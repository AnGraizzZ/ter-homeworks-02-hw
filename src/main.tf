resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [var.default_cidr[0]]
}


resource "yandex_vpc_subnet" "develop_db" {
  name           = var.vpc_name_db
  zone           = var.default_zone_db
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [var.default_cidr[1]]
}



data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_yandex_compute_image
}
resource "yandex_compute_instance" "platform" {
  name        = "${local.organization}-${local.env}-${local.project}-${local.roles[0]}"
  platform_id = var.vm_web_yandex_compute_instance.platform_id
resources {
  cores         = var.vms_resources["web"].cores
  memory        = var.vms_resources["web"].memory
  core_fraction = var.vms_resources["web"].core_fraction
}
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_yandex_compute_instance.scheduling_policy.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_yandex_compute_instance.network_interface.nat
  }

  # metadata = {
  #   serial-port-enable = var.vm_db_yandex_compute_instance.metadata.serial-port-enable
  #   ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  # }
  metadata = var.metadata

}
resource "yandex_compute_instance" "netology-develop-platform-db" {
  name        = "${local.organization}-${local.env}-${local.project}-${local.roles[1]}"
  platform_id = var.vm_db_yandex_compute_instance.platform_id
  zone = var.vm_db_yandex_compute_instance.zone
resources {
  cores         = var.vms_resources["db"].cores
  memory        = var.vms_resources["db"].memory
  core_fraction = var.vms_resources["db"].core_fraction
}
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_yandex_compute_instance.scheduling_policy.preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop_db.id
    nat       = var.vm_db_yandex_compute_instance.network_interface.nat
  }

  # metadata = {
  #   serial-port-enable = var.vm_db_yandex_compute_instance.metadata.serial-port-enable
  #   ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  # }
  metadata = var.metadata

}
