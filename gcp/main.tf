terraform {
  backend "gcs" {
    bucket  = "genial-reporter-220618.appspot.com"
    prefix  = "terraform/state"
  }
}

provider "google" {
  project     = "${var.google_vars["project_id"]}"
  region      = "${var.google_vars["region"]}"
}

resource "google_compute_instance" "default" {
  count        = "${var.google_vars["node_count"]}"
  name         = "docker-${count.index}"
  machine_type = "f1-micro"
  zone         = "${var.google_vars["region"]}-${var.google_vars["zone"]}"

  boot_disk {
      initialize_params {
        image = "${var.google_vars["host_image"]}"
      }
  }

  metadata {
    sshKeys = "${var.google_vars["ssh_keys"]}"
  }

metadata_startup_script = "curl https://raw.githubusercontent.com/newrushbolt/simpleDeploy/${var.DEPLOY_PROJECT_HEAD}/${var.DEPLOY_PROJECT_NAME}/post_install.sh -o post_install.sh&&sudo bash post_install.sh"

  network_interface {
      network = "default"
      access_config {

      }
  }
}

resource "google_dns_record_set" "dns" {
  count        = "${var.google_vars["node_count"]}"
  managed_zone = "${var.google_vars["dns_zone_id"]}"
  name         = "docker-${count.index}.${var.google_vars["project_id"]}.${var.google_vars["dns_zone_fqdn"]}"
  type         = "A"
  ttl          = 60
  rrdatas      = ["${element(google_compute_instance.default.*.network_interface.0.access_config.0.nat_ip, count.index)}"]
}

