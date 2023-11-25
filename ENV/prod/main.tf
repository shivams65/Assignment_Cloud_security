module "RG" {
  source = "github.com/shivams65/Assignment_Cloud_security/Modules/Resourcegroup"
  rg     = var.rg
}

module "storageaccount" {
  source     = "github.com/shivams65/Assignment_Cloud_security/Modules/Storage_Account"
  sa         = var.sa
  depends_on = [module.RG]
}

module "Vnet" {
  source     = "github.com/shivams65/Assignment_Cloud_security/Modules/Vnet"
  vnet       = var.vnet
  depends_on = [module.storageaccount]
}

module "subnet" {
  source     = "github.com/shivams65/Assignment_Cloud_security/Modules/Subnet"
  subnet     = var.subnet
  depends_on = [module.Vnet]
}

module "publicip" {
    source = "github.com/shivams65/Assignment_Cloud_security/Modules/Public_IP"
    public_ip = var.public_ip
    depends_on = [ module.Route_Table ]
}

module "Bastion" {
  source     = "github.com/shivams65/Assignment_Cloud_security/Modules/Bastion"
  bastion    = var.bastion
  depends_on = [module.serviceplan]
}

module "NSG" {
  source     = "github.com/shivams65/Assignment_Cloud_security/Modules/NSG"
  nsg        = var.nsg
  depends_on = [module.subnet]
}

module "NSG_Rules" {
  source     = "github.com/shivams65/Assignment_Cloud_security/Modules/NSG_rules"
  nsg_rules  = var.nsg_rules
  depends_on = [module.NSG]
}

module "Route_Table" {
  source      = "github.com/shivams65/Assignment_Cloud_security/Modules/Route_Table"
  route_table = var.route_table
  depends_on  = [module.NSG_Rules]
}

module "serviceplan" {
  source     = "github.com/shivams65/Assignment_Cloud_security/Modules/Service_Plan"
  sp         = var.sp
  depends_on = [module.Route_Table]
}

module "functionApp" {
  source      = "github.com/shivams65/Assignment_Cloud_security/Modules/Function_App"
  functionapp = var.functionapp
  depends_on  = [module.serviceplan]
}