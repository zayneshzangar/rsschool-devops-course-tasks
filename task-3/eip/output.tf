output "eip_for_bastion" {
description = "Private IP address of the EC2 instance"
value       = aws_eip.bastion_k3s.id
}

output "eip_for_master" {
description = "Private IP address of the EC2 instance"
value       = aws_eip.bastion_k3s.public_ip
}

