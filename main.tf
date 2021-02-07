
#include ec2 module
module "ec2"
{
  source = "modules/ec2"
  securityGroups =  module.networking.securityGroupList
}

module "networking"
{
  source = "modules/networking"
}
