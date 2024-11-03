output "ec2_private_ip" {
  description = "Private IP address of the EC2 instance"
  value       = aws_instance.bastion_k3s.private_ip
}
