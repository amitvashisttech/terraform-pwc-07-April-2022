# Create a Resource Group
resource "azurerm_resource_group" "blue" {
  count    = lookup(var.rg_count, terraform.workspace)  
  name     = "${var.my_rg_name}-${terraform.workspace}-${count.index +1}"
  location = var.my_loc
  tags = {
    Owner = "Amit Vashist" 
    Team  = "DevOps Team"
    Project = "Terraform Automation - ${terraform.workspace}"
  }
}

