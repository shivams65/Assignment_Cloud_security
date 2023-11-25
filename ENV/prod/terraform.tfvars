rg = {
  "rg1" = {
    name     = "Application"
    location = "east us"
  }
}

sa = {
  "sa1" = {
    name                     = "linuxfunctionappsa2511"
    resource_group_name      = "Application"
    location                 = "east us"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

vnet = {
  "vnet1" = {
    name                = "App-Frontend-vnet"
    location            = "east us"
    resource_group_name = "Application"
    address_space       = ["10.0.0.0/16"]
  },
  "vnet2" = {
    name                = "App-vnet"
    location            = "east us"
    resource_group_name = "Application"
    address_space       = ["20.0.0.0/16"]
  }
}

subnet = {
  "subnet1" = {
    name                 = "frontend-subnet-01"
    resource_group_name  = "Application"
    virtual_network_name = "App-Frontend-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  },
  "subnet2" = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "Application"
    virtual_network_name = "App-vnet"
    address_prefixes     = ["20.0.1.0/24"]
  }
}

public_ip = {
  "public_ip01" = {
    name                = "Bastionpublicip01"
    location            = "east us"
    resource_group_name = "Application"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

bastion = {
  "bastion01" = {
    name                = "bastion01"
    location            = "east us"
    resource_group_name = "Application"
    ipconfigname        = "configuration"
  }
}

nsg = {
  "nsg1" = {
    name                = "ApplicationNSG"
    location            = "east us"
    resource_group_name = "Application"
  }
}

nsg_rules = {
  "nsgrules01" = {
    name                        = "test123"
    priority                    = 100
    direction                   = "Outbound"
    access                      = "Allow"
    protocol                    = "Tcp"
    source_port_range           = "*"
    destination_port_range      = "*"
    source_address_prefix       = "*"
    destination_address_prefix  = "*"
    resource_group_name         = "Application"
    network_security_group_name = "ApplicationNSG"

  }
}

route_table = {
  "route_table01" = {
    name                = "Application-routetable"
    location            = "east us"
    resource_group_name = "Application"
    routename           = "route1"
    address_prefix      = "10.1.0.0/16"
    next_hop_type       = "VnetLocal"
  }
}

sp = {
  "sp1" = {
    name                = "example-app-service-plan"
    resource_group_name = "Application"
    location            = "east us"
    os_type             = "Linux"
    sku_name            = "Y1"
  }
}

functionapp = {
  "functionapp01" = {
    name                = "function-app211"
    resource_group_name = "Application"
    location            = "east us"
  }
}
