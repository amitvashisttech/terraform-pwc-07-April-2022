variable "my_loc" { 
 description = "My Resource Group Location"
 type = list  
 default = ["eastus", "westus", "westus2" ]
}



variable "my_rg_name" { 
 description = "My Resource Group Name"
 type = string 
 default = "Test-RG"
}

variable "multi-region-deployment" { 
  default = false 
}
