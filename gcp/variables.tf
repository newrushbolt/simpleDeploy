variable "google_vars" {
    type = "map"
    default = {
        "project_id"              = "genial-reporter-220618"
        "region"                  = "asia-east1"
        "zone"                    = "a"
        "node_count"              = 2
        "ssh_keys"                = "svmikhailov:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC9kE/e17Th8dUu5YrAfrjcuS8zxhGU+1Xp0mSp/BdjInSBSmkG8udoOaI4OTYbg3lVdj93BbdHreF5PI5UHuUWpb2yL1Q58syjEHp7owVN+gmCQClRpMtK7BvaEZAqDXtyJYpqLOPjF+4uTzX7ZSMZUoqjxw2BLRk23PX59nB+0bQ7xKgWcSSWxnw+04Q9ShWA3XZArhuzogqJfdBNpJvswY4X25zkTNaYW/xrw2wPfIBRQRNXtVtKAvwPe14/EXjvUcYff1VGbcn+aL0Ibw0YGyNlKcB/f0UHpWuogB/K5zBeG8v3yfUK4hnKL070uB25DeTsA7KXuO5QqrGOf94V svmikhailov@svm-laptop-bb"
        "dns_zone_fqdn"           = "newrushbolt.space."
        "dns_zone_id"             = "newrushbolt-space"
        "host_image"              = "ubuntu-os-cloud/ubuntu-minimal-1804-lts"
    }
}

variable "DEPLOY_PROJECT_HEAD" {}
variable "DEPLOY_PROJECT_NAME" {}
