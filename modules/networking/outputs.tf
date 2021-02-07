output "securityGroupList" {
  value = list(aws_security_group.allow_https.name,aws_security_group.allow_http.name,aws_security_group.allow_ssh.name)
}

output "subnet" {
  value = module.vpc_example_complete-vpc.public_subnets
}