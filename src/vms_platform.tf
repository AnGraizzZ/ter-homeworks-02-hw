variable "vm_web_yandex_compute_image" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "Образ ОС"
}
variable "vm_web_yandex_compute_instance" {
  type = object({
    name        = string
    platform_id = string
    # resources = object({
    #   core_fraction = number
    #   cores         = number
    #   memory        = number
    # })
    boot_disk = object({
      initialize_params = object({
        image_id = string
      })
    })
    scheduling_policy = object({
      preemptible = bool
    })
    network_interface = object({
      subnet_id = string
      nat       = bool
    })
    # metadata = map(string)
  })

  default = {
    name        = "netology-develop-platform-web"
    platform_id = "standard-v2"
    # resources = {
    #   cores         = 2
    #   memory        = 1
    #   core_fraction = 5
    # }
    boot_disk = {
      initialize_params = {
        image_id = ""
      }
    }
    scheduling_policy = {
      preemptible = true
    }
    network_interface = {
      subnet_id = ""
      nat       = true
    }
    # metadata = {
    #   serial-port-enable = "1"
    # }
  }
}
variable "vm_db_yandex_compute_instance" {
  type = object({
    name        = string
    platform_id = string
    zone = string
    # resources = object({
    #   core_fraction = number
    #   cores         = number
    #   memory        = number
    # })
    boot_disk = object({
      initialize_params = object({
        image_id = string
      })
    })
    scheduling_policy = object({
      preemptible = bool
    })
    network_interface = object({
      subnet_id = string
      nat       = bool
    })
    metadata = map(string)
  })

  default = {
    name        = "netology-develop-platform-db"
    platform_id = "standard-v2"
    zone = "ru-central1-e"
    # resources = {
    #   cores         = 2
    #   memory        = 2
    #   core_fraction = 20
    # }
    boot_disk = {
      initialize_params = {
        image_id = ""
      }
    }
    scheduling_policy = {
      preemptible = true
    }
    network_interface = {
      subnet_id = ""
      nat       = true
    }
    metadata = {
      serial-port-enable = "1"
    }
  }
}

