# AWS provider using default profile
provider "aws" {
  version = "2.65.0"
  region = "us-west-2"
}



resource "aws_instance" "liveProjectInstance1" {
  ami = "ami-008b09448b998a562"
  instance_type = "t2.micro"
  tags = {
    Name = "liveProjectInstance1"
  }
}


resource "aws_instance" "liveProjectInstance2" {
  ami = "ami-008b09448b998a562"
  instance_type = "t2.micro"
  tags = { #B
    Name = "liveProjectInstance2"
  }
}