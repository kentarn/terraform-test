output "vm1_details" {
  description = "Details of VM 1"
  value = {
    name       = module.vm1.vm_name
    private_ip = module.vm1.private_ip
  }
}

output "vm2_details" {
  description = "Details of VM 2"
  value = {
    name       = module.vm2.vm_name
    private_ip = module.vm2.private_ip
  }
}

output "vm3_details" {
  description = "Details of VM 3"
  value = {
    name       = module.vm3.vm_name
    private_ip = module.vm3.private_ip
  }
}
