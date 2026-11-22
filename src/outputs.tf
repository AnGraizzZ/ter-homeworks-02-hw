
output "vm_ssh_connection" {
  description = "Автоматически собранная информация и SSH-команда для подключения"
  value = {
    for vm in local.all_vms : vm.name => {
    instance_name = vm.name
    fqdn = vm.fqdn
    external_ip   = vm.network_interface[0].nat_ip_address
    # ssh_command   = "ssh -i ~/.ssh/yc_key ${split(":", yandex_compute_instance.platform.metadata["ssh-keys"])[0]}@${yandex_compute_instance.platform.network_interface[0].nat_ip_address}"
    }
  }
}