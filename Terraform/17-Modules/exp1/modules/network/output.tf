output "my_nic" { 
 value = azurerm_network_interface.example_rg.*.id
}


output "pip" {
 value = azurerm_public_ip.examplepublicip
}

output "my_vm_public_IP" {
 value = azurerm_public_ip.examplepublicip.*.ip_address
}

