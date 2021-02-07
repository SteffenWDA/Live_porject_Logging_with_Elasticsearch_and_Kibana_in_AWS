variable "securityGroups" {
  description = "List of security groups for ec2 instances"
  type = list(string)
}

variable "public_ssh_key" {
  type = string
}

variable "public_subnet_ids" {
  description = "List of public subnet ids"
  type = list(string)
}

