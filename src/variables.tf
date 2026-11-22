###cloud vars


variable "cloud_id" {
  type        = string
  default     = "b1geka85su9shc2epst0"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1gk501lkjc82415d2s5"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_zone_db" {
  type        = string
  default     = "ru-central1-e"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24","10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}
variable "vpc_name_db" {
  type        = string
  default     = "develo-db"
  description = "VPC network & subnet name"
}


###ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6EhiwXnuQCcnV9Hv0DdHWlDqcM1+xQiCkN2t0SxzIJgT99a0Ozl2o9nP2cyTrpa0OSOHssuWrt1v8sUEQ3SIbddWKts8M3yHcFd/lAkK63g5N+Pyd9n0+OxNQTeXJ2tV+fRPQriSYY7uJW46iTR8NfEcZVf0XHg/HcrJyp0adCthPTelv3fgx0POkoY6BxaDXKFLfnX9qPUvmOQjfUfPTk7QYWA0tT0Ahm+wDoySrJ3IoQrIwzigrImJ4UNEajNk4+B4paT3cs1uct2eYCaW9jaZsJyHBKsiOT+uTq8FMcED6H3CWdQ+1x3hLBDO5hghKoAP3wDDy1P5VbMK/SRS66k+WYxBDODCzGEa365Y8pLzpPRWVfjcZp5v+TXaMO8232a6tflGxO1h9ABTcreVVOXa+n6MWwa8X4Gt9cE7YDArpPD8kG3fl5Rzv8Xh0XNKpcfcSD5FRfDUogaN8MkDXGmElQMOz877e8WLIBZlXZOm16279wcY3AJ1WQ9ZxKl8= agz@Debian-terraform-machine"
  description = "ssh-keygen -t ed25519"
}

variable "vms_resources"{
    type = map(object({
        cores         = number
        memory        = number
        core_fraction = number
    }))
    default = {
        web={
            cores         = 2
            memory        = 1
            core_fraction = 5
        }
        db={
            cores         = 2
            memory        = 2
            core_fraction = 20
        }

    }
    
}

variable "metadata" {
  type        = map(string)
    default = {
    serial-port-enable = "1"
    ssh-keys           = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC6EhiwXnuQCcnV9Hv0DdHWlDqcM1+xQiCkN2t0SxzIJgT99a0Ozl2o9nP2cyTrpa0OSOHssuWrt1v8sUEQ3SIbddWKts8M3yHcFd/lAkK63g5N+Pyd9n0+OxNQTeXJ2tV+fRPQriSYY7uJW46iTR8NfEcZVf0XHg/HcrJyp0adCthPTelv3fgx0POkoY6BxaDXKFLfnX9qPUvmOQjfUfPTk7QYWA0tT0Ahm+wDoySrJ3IoQrIwzigrImJ4UNEajNk4+B4paT3cs1uct2eYCaW9jaZsJyHBKsiOT+uTq8FMcED6H3CWdQ+1x3hLBDO5hghKoAP3wDDy1P5VbMK/SRS66k+WYxBDODCzGEa365Y8pLzpPRWVfjcZp5v+TXaMO8232a6tflGxO1h9ABTcreVVOXa+n6MWwa8X4Gt9cE7YDArpPD8kG3fl5Rzv8Xh0XNKpcfcSD5FRfDUogaN8MkDXGmElQMOz877e8WLIBZlXZOm16279wcY3AJ1WQ9ZxKl8= agz@Debian-terraform-machine"
    }
}