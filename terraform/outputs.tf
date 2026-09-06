output "loadbalancer_ips" {
  value = {
    lb_node_1 = proxmox_virtual_environment_vm.lb_node_1.initialization[0].ip_config[0].ipv4[0].address
    lb_node_2 = proxmox_virtual_environment_vm.lb_node_2.initialization[0].ip_config[0].ipv4[0].address
  }
}

output "backend_ips" {
  value = {
    backend_1 = proxmox_virtual_environment_vm.backend_1.initialization[0].ip_config[0].ipv4[0].address
    backend_2 = proxmox_virtual_environment_vm.backend_2.initialization[0].ip_config[0].ipv4[0].address
  }
}
