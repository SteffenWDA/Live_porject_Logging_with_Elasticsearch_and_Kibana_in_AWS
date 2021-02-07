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
