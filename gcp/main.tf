provider "google" {
	project     = "genial-reporter-220618"
	region      = "europe-west1"
}

resource "google_compute_instance" "default" {
	name         = "test1-compute-west"
	machine_type = "f1-micro"
	zone         = "europe-west1-b"

	boot_disk {
			initialize_params {
				image = "ubuntu-os-cloud/ubuntu-minimal-1804-lts"
			}
	}

	metadata {
		 sshKeys = "svmikhailov:${file("~/.ssh/id_rsa.pub")}"
	}
	metadata_startup_script = "sudo apt-get update"
	network_interface {
			network = "default"
			access_config {
			}
	}
}
