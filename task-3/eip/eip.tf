resource "aws_eip" "bastion_k3s" {
  tags = {
    Name = "bastion-k3s"
  }
}