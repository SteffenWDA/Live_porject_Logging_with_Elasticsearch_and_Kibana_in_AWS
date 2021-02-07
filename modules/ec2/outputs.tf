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
