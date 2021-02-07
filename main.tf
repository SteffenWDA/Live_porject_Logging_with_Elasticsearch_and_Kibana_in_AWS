
#include ec2 module
module "ec2" {
  source = "./modules/ec2"
  securityGroups =  module.networking.securityGroupList
  public_ssh_key = var.public_ssh_key
}

module "networking" {
  source = "./modules/networking"
}
