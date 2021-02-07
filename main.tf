
#include ec2 module
module "ec2" {
  source = "./modules/ec2"
  securityGroups =  module.networking.securityGroupList
  public_ssh_key = var.public_ssh_key
  public_subnet_ids = module.networking.subnet
}

module "networking" {
  source = "./modules/networking"
  vpc_name = var.namespace
}
