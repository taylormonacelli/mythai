packer {
  required_plugins {
    incus = {
      version = ">= 1.0.0"
      source  = "github.com/bketelsen/incus"
    }
    ansible = {
      version = "~> 1"
      source = "github.com/hashicorp/ansible"
    }
  }
}

source "incus" "jammy" {
  image        = "002-jolly-penguin"
  output_image = "032-install-toml-cli-on-linux"
  container_name = "mythai"
  reuse        = true
  skip_publish = true
}

build {
  sources = ["incus.jammy"]

  provisioner "shell" {
    scripts = [
      "032-install-toml-cli-on-linux.sh",
    ]
  }
}