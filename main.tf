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
  security_groups = [ "allow_ssh","allow_http","allow_https"]
  tags = {
    Name = "liveProjectInstance1"
  }
}


resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh"
  }
}

resource "aws_security_group" "allow_http" {
  name = "allow_http"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "SSH"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  egress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]

  }
  tags = {
    Name = "allow_http"
  }
}

resource "aws_security_group" "allow_https" {
  name = "allow_https"
  description = "Allow TLS inbound traffic"

  ingress {
    description = "SSH"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"]
  }

  egress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "allow_http"
  }
}


output "public_ip" {
  value = aws_instance.liveProjectInstance1.public_ip
}
