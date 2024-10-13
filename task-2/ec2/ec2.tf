resource "aws_instance" "test_ec2_privateA" {
  ami                    = var.ami_id
  instance_type          = var.ami_type
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]
  subnet_id              = data.aws_subnet.subnet_private_rsschoolA.id
  key_name               = "key-pair-rsschool"
  availability_zone      = var.vpc_azs[0]

  tags = {
    Name = "test-ec2-privateA"
  }
}

resource "aws_instance" "test_ec2_privateB" {
  ami                    = var.ami_id
  instance_type          = var.ami_type
  vpc_security_group_ids = [aws_security_group.ssh_sg.id]
  subnet_id              = data.aws_subnet.subnet_private_rsschoolB.id
  key_name               = "key-pair-rsschool"
  availability_zone      = var.vpc_azs[1]

  tags = {
    Name = "test-ec2-privateB"
  }
}
