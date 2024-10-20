resource "aws_security_group" "ssh_k3s_sg" {
  name        = "ssh-sg"
  description = "Security Group for private EC2 instance"
  vpc_id      = data.aws_vpc.vpc_rsschool.id

  # Разрешение исходящих соединений (если потребуется, например для доступа к другим сервисам в VPC)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Все протоколы
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Разрешение входящих соединений только из других ресурсов внутри VPC (например, с других инстансов)
  ingress {
    from_port   = 22 # SSH, если нужно подключение для управления
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.vpc_cidr # Разрешение доступа только из VPC
  }

  ingress {
    from_port   = 6443 # SSH, если нужно подключение для управления
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = var.vpc_cidr # Разрешение доступа только из VPC
  }

  tags = {
    Name = "rsschool-zayneshzangar-ec2-sg"
  }
}