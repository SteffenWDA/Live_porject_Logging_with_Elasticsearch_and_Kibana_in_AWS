output "securityGroupList" {
  value = list(aws_security_group.allow_https.id,aws_security_group.allow_http.id,aws_security_group.allow_ssh.id)
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "vpc_id" {
  value = module.vpc.vpc_id
}