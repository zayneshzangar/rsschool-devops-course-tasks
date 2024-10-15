resource "aws_security_group" "bastion_sg" {
  name        = "${var.vpc_name}-sg"
  description = "${var.vpc_name} SG"
  vpc_id      = data.aws_vpc.vpc_rsschool.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Разрешить доступ всем
    description = "Allow SSH access from anywhere"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_name}-sg"
  }
}
