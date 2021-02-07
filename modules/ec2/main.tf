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

data "template_file" "user_data" {
  template = file("scripts/add-ssh-web-app.yaml")
}

resource "aws_key_pair" "example_ssh_key" {
  key_name   = "example-ssh-key"
  public_key = var.public_ssh_key
}

resource "aws_instance" "liveProjectInstance1" {
  ami = data.aws_ami.ubuntu.image_id
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  user_data                   = data.template_file.user_data.rendered
  security_groups = var.securityGroups
  key_name = aws_key_pair.example_ssh_key.key_name
  subnet_id = var.public_subnet_ids[0]
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
  key_name = aws_key_pair.example_ssh_key.key_name
  subnet_id = var.public_subnet_ids[0]

  tags = {
    Name = "liveProjectInstance2"
  }
}

