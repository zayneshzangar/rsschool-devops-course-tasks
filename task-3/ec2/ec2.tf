resource "aws_instance" "master" {
  ami                    = var.ami_id
  instance_type          = var.ami_type
  vpc_security_group_ids = [aws_security_group.ssh_k3s_sg.id]
  subnet_id              = data.aws_subnet.subnet_private_rsschoolA.id
  key_name               = "key-pair-rsschool"
  availability_zone      = var.vpc_azs[0]

  # Установка K3s
  user_data = <<-EOF
    #!/bin/bash

    echo "${var.rsschool_key}" >> ~/.ssh/rsschool-key.pem

    chmod 400 ~/.ssh/rsschool.pem

    curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644 --tls-san ${data.terraform_remote_state.eip_state.outputs.eip_for_master}
  EOF

  tags = {
    Name = "master"
  }

}

resource "aws_instance" "worker" {
  ami                    = var.ami_id
  instance_type          = var.ami_type
  vpc_security_group_ids = [aws_security_group.ssh_k3s_sg.id]
  subnet_id              = data.aws_subnet.subnet_private_rsschoolB.id
  key_name               = "key-pair-rsschool"
  availability_zone      = var.vpc_azs[1]
  depends_on             = [aws_instance.master]

  tags = {
    Name = "worker"
  }

  # Подключение воркер-ноды к мастер-ноде
  user_data = <<-EOF
    #!/bin/bash

    echo "${var.rsschool_key}" >> ~/.ssh/rsschool-key.pem

    chmod 400 ~/.ssh/rsschool.pem

    # Установка K3s как агент (воркер-нода)

    while ! nc -z ${aws_instance.master.private_ip} 6443; do
      echo "Ожидание доступности мастер-ноды на ${aws_instance.master.private_ip}:6443..."
      sleep 5
    done

    # Устанавливаем K3s агент и подключаем к мастер-ноде
    curl -sfL https://get.k3s.io | K3S_URL=https://${aws_instance.master.private_ip}:6443 K3S_TOKEN=$(ssh -o StrictHostKeyChecking=no -i ~/.ssh/your-ssh-key.pem ubuntu@${aws_instance.master.private_ip} 'sudo cat /var/lib/rancher/k3s/server/node-token') sh -
  EOF

}

