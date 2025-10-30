# AWS EC2 Public IP
output "aws_instance_public_ip" {
  description = "Public IP of AWS EC2 instance"
  value       = aws_instance.ec2_instance.public_ip
}

# Azure VM Private IP
output "azure_vm_private_ip" {
  description = "Private IP of Azure VM"
  value       = azurerm_network_interface.azure_nic.private_ip_address
}
