#TODO Implement keys as resource and pass pub key here


variable "securityGroups" {
  description = "List of security groups for ec2 instances"
  type = list(string)
}

data "template_file" "user_data" {
  template = file("scripts/add-ssh-web-app.yaml")
}


resource "aws_instance" "liveProjectInstance1" {
  #TODO: I need to implement this with filter
  ami = "ami-008b09448b998a562"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  user_data                   = data.template_file.user_data.rendered
  security_groups = var.securityGroups
  tags = {
    Name = "liveProjectInstance1"
  }
}

resource "aws_instance" "liveProjectInstance2" {
  #TODO: I need to implement this with filter
  ami = "ami-008b09448b998a562"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  user_data                   = data.template_file.user_data.rendered
  security_groups = var.securityGroups
  tags = {
    Name = "liveProjectInstance2"
  }
}

