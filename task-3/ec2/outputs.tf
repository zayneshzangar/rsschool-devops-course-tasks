output "ec2_private_ip_1" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.master.private_ip
}

output "ec2_private_ip_2" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.worker.private_ip
}
