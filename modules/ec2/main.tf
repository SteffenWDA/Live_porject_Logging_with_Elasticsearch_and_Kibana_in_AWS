#TODO Implement keys as resource and pass pub key here

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}



variable "securityGroups" {
  description = "List of security groups for ec2 instances"
  type = list(string)
}

data "template_file" "user_data" {
  template = file("scripts/add-ssh-web-app.yaml")
}


resource "aws_instance" "liveProjectInstance1" {
  ami = data.aws_ami.ubuntu.image_id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  user_data                   = data.template_file.user_data.rendered
  security_groups = var.securityGroups
  tags = {
    Name = "liveProjectInstance1"
  }
}

resource "aws_instance" "liveProjectInstance2" {
  ami = data.aws_ami.ubuntu.image_id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  user_data                   = data.template_file.user_data.rendered
  security_groups = var.securityGroups
  tags = {
    Name = "liveProjectInstance2"
  }
}

