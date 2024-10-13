resource "aws_launch_template" "launch_template_bastion" {
  name = "bastion"
  image_id      = var.ami_id
  instance_type = "t2.micro"
  key_name      = "key-rsschool"

  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size           = 15
      volume_type           = "gp2"
      delete_on_termination = true
    }
  }

  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "Bastion"
    }
  }
}
