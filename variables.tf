variable "public_ssh_key" {
  description = "public ssh key for ssh auth at ec2 instances"
  type = string
}

variable "namespace" {
  description = "namespace which is used to identify related components"
  type = string
}

variable "availability_zones" {
  description = ""
  type = list(string)
}
