
#include ec2 module
module "ec2" {
  source = "./modules/ec2"
  securityGroups =  module.networking.securityGroupList
  public_ssh_key = var.public_ssh_key
  public_subnet_ids = module.networking.public_subnets

}

module "networking" {
  source = "./modules/networking"
  vpc_name = var.namespace
  availability_zones =var.availability_zones
}
