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

output "securityGroupList" {
  value = list(aws_security_group.allow_https.name,aws_security_group.allow_http.name,aws_security_group.allow_ssh.name)
}