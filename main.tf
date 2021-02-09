
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

module "elastic_search" {
  source = "./modules/elasticsearch"
  subnet_id = module.networking.public_subnets [1]
  vpc_id = module.networking.vpc_id
  cidr_block=module.networking.cidr_blocks
}