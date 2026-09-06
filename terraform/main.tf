data "proxmox_virtual_environment_nodes" "available_nodes" {}

output "proxmox_connection_status" {
  value = "Connected successfully! Available Proxmox Nodes: ${join(", ", data.proxmox_virtual_environment_nodes.available_nodes.names)}"
}
