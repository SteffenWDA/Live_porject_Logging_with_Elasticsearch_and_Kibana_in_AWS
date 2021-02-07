variable "securityGroups" {
  description = "List of security groups for ec2 instances"
  type = list(string)
}

variable "public_ssh_key" {
  type = string
}