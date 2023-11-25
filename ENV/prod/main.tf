module "RG" {
  source = "../../../Cloud_Security_copy/Modules/Resourcegroup"
  rg     = var.rg
}

module "storageaccount" {
  source     = "../../../Cloud_Security_copy/Modules/Storage_Account"
  sa         = var.sa
  depends_on = [module.RG]
}

module "Vnet" {
  source     = "../../../Cloud_Security_copy/Modules/Vnet"
  vnet       = var.vnet
  depends_on = [module.storageaccount]
}

module "subnet" {
  source     = "../../../Cloud_Security_copy/Modules/Subnet"
  subnet     = var.subnet
  depends_on = [module.Vnet]
}

module "publicip" {
    source = "../../../Cloud_Security_copy/Modules/Public_IP"
    public_ip = var.public_ip
    depends_on = [ module.Route_Table ]
}

module "Bastion" {
  source     = "../../../Cloud_Security_copy/Modules/Bastion"
  bastion    = var.bastion
  depends_on = [module.serviceplan]
}

module "NSG" {
  source     = "../../../Cloud_Security_copy/Modules/NSG"
  nsg        = var.nsg
  depends_on = [module.subnet]
}

module "NSG_Rules" {
  source     = "../../../Cloud_Security_copy/Modules/NSG_rules"
  nsg_rules  = var.nsg_rules
  depends_on = [module.NSG]
}

module "Route_Table" {
  source      = "../../../Cloud_Security_copy/Modules/Route_Table"
  route_table = var.route_table
  depends_on  = [module.NSG_Rules]
}

module "serviceplan" {
  source     = "../../../Cloud_Security_copy/Modules/Service_Plan"
  sp         = var.sp
  depends_on = [module.Route_Table]
}

module "functionApp" {
  source      = "../../../Cloud_Security_copy/Modules/Function_App"
  functionapp = var.functionapp
  depends_on  = [module.serviceplan]
}