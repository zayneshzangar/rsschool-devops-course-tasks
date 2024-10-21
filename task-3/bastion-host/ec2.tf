resource "aws_instance" "bastion_k3s" {
  ami                    = var.ami_id
  instance_type          = var.ami_type
  vpc_security_group_ids = [aws_security_group.bastion_sg_k3s.id]
  subnet_id              = data.aws_subnet.subnet_public_rsschool.id
  key_name               = "key-pair-rsschool"
  availability_zone      = var.vpc_azs

  # Закодировать user_data в Base64
  user_data = base64encode(<<-EOF
    #!/bin/bash
    # echo "test" >> ~/.ssh/rsschool-key.pem

    chmod 400 ~/.ssh/rsschool.pem

    # Настройка SSH для безопасности
    sudo sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
    sudo sed -i 's/^#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config
    sudo sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

    # Перезапуск SSH для применения изменений
    sudo systemctl restart sshd

    # Установка haproxy
    sudo apt-get update -y
    sudo apt-get install haproxy -y

    # Настройка haproxy
    sudo bash -c 'cat > /etc/haproxy/haproxy.cfg' <<EOL
    frontend k3s-api
        bind *:6443
        default_backend k3s-master

    backend k3s-master
        server k3s-master ${data.terraform_remote_state.ec2_state.outputs.ec2_private_ip}:6443 check
    EOL

    # Перезапуск haproxy
    sudo systemctl restart haproxy
    sudo systemctl enable haproxy
  EOF
  )


  tags = {
    Name = "bastion"
  }
}