# AWS provider using default profile
provider "aws" {
  version = "2.65.0"
  region = "us-west-2"
}

#TODO Implement keys as resource and pass pub key here
data "template_file" "user_data" {
  template = file("scripts/add-ssh-web-app.yaml")
}


resource "aws_instance" "liveProjectInstance1" {
  #TODO: I need to implement this with filter
  ami = "ami-008b09448b998a562"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  user_data                   = data.template_file.user_data.rendered
  #TODO: if I access the values as attributes it causes problems during destroy security_groups = [ aws_security_group.allow_ssh.name,aws_security_group.allow_http.name,aws_security_group.allow_https.name]
  security_groups = ["allow_ssh","allow_http","allow_https"]
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
  #TODO: if I access the values as attributes it causes problems during destroy security_groups = [ aws_security_group.allow_ssh.name,aws_security_group.allow_http.name,aws_security_group.allow_https.name]
  security_groups = ["allow_ssh","allow_http","allow_https"]
  tags = {
    Name = "liveProjectInstance2"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "aws_security_group to enable ssh"

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
  description = "aws_security_group to allow http"

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
#TODO. check if this is needed
resource "aws_security_group" "allow_https" {
  name = "allow_https"
  description = "aws_security_group to allow https"

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
    Name = "allow_https"
  }
}


output "public_ip_liveProjectInstance1" {
  value = aws_instance.liveProjectInstance1.public_ip
}

output "public_dns_liveProjectInstance1" {
  value = aws_instance.liveProjectInstance1.public_dns
}

output "public_ip_liveProjectInstance2" {
  value = aws_instance.liveProjectInstance2.public_ip
}

output "public_dns_liveProjectInstance2" {
  value = aws_instance.liveProjectInstance2.public_dns
}
