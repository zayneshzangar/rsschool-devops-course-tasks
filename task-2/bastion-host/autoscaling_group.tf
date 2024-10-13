resource "aws_autoscaling_group" "asg_bastion" {
  min_size            = 1
  max_size            = 1
  desired_capacity    = 1
  vpc_zone_identifier = data.aws_subnets.subnet_public_rsschool.ids
  launch_template {
    id = aws_launch_template.launch_template_bastion.id
  }

  tag {
    key                 = "Name"
    value               = "asg-basion"
    propagate_at_launch = true
  }
}
