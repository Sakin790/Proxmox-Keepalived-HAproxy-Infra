terraform {
  required_version = ">= 1.5.0"
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.68.0"
    }
  }
}

# ১. Load Balancer Node 1
resource "proxmox_virtual_environment_vm" "lb_node_1" {
  name      = "lb-node-1"
  node_name = "pve"
  vm_id     = 101

  clone {
    vm_id = 9000
  }

  boot_order = ["scsi0", "net0"]

  operating_system {
    type = "l26"
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  initialization {
    ip_config {
      ipv4 {
        address = "192.168.122.11/24"
        gateway = "192.168.122.1"
      }
    }
    user_account {
      username = "ubuntu"
      keys     = [file(pathexpand("~/.ssh/id_rsa.pub"))]
    }
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }
}

# ২. Load Balancer Node 2
resource "proxmox_virtual_environment_vm" "lb_node_2" {
  name      = "lb-node-2"
  node_name = "pve"
  vm_id     = 102

  clone {
    vm_id = 9000
  }

  boot_order = ["scsi0", "net0"]

  operating_system {
    type = "l26"
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  initialization {
    ip_config {
      ipv4 {
        address = "192.168.122.12/24"
        gateway = "192.168.122.1"
      }
    }
    user_account {
      username = "ubuntu"
      keys     = [file(pathexpand("~/.ssh/id_rsa.pub"))]
    }
  }

  cpu {
    cores = 2
  }

  memory {
    dedicated = 2048
  }
}

# ৩. Backend Web Server 1
resource "proxmox_virtual_environment_vm" "backend_1" {
  name      = "backend-1"
  node_name = "pve"
  vm_id     = 201

  clone {
    vm_id = 9000
  }

  boot_order = ["scsi0", "net0"]

  operating_system {
    type = "l26"
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  initialization {
    ip_config {
      ipv4 {
        address = "192.168.122.21/24"
        gateway = "192.168.122.1"
      }
    }
    user_account {
      username = "ubuntu"
      keys     = [file(pathexpand("~/.ssh/id_rsa.pub"))]
    }
  }

  cpu {
    cores = 1
  }

  memory {
    dedicated = 1024
  }
}

# ৪. Backend Web Server 2
resource "proxmox_virtual_environment_vm" "backend_2" {
  name      = "backend-2"
  node_name = "pve"
  vm_id     = 202

  clone {
    vm_id = 9000
  }

  boot_order = ["scsi0", "net0"]

  operating_system {
    type = "l26"
  }

  network_device {
    bridge = "vmbr0"
    model  = "virtio"
  }

  initialization {
    ip_config {
      ipv4 {
        address = "192.168.122.22/24"
        gateway = "192.168.122.1"
      }
    }
    user_account {
      username = "ubuntu"
      keys     = [file(pathexpand("~/.ssh/id_rsa.pub"))]
    }
  }

  cpu {
    cores = 1
  }

  memory {
    dedicated = 1024
  }
}
