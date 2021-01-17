# AWS provider using default profile
provider "aws" {
  version = "2.65.0"
  region = "us-west-2"
}


data "template_file" "user_data" {
  template = file("scripts/add-ssh-web-app.yaml")
}


resource "aws_instance" "liveProjectInstance1" {
  ami = "ami-008b09448b998a562"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  user_data                   = data.template_file.user_data.rendered

  tags = {
    Name = "liveProjectInstance1"
  }
}

output "public_ip" {
  value = aws_instance.liveProjectInstance1.public_ip
}
