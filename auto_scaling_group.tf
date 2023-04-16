# creating launch template 

resource "aws_launch_template" "webapp-launch_template" {
  name                   = "webapp-launch_template"
  image_id               = var.template-image_id
  instance_type          = var.template-instance_type
  key_name               = var.template-key_name
  vpc_security_group_ids = [aws_security_group.webapp-security_group-1.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "webapp-server"
    }
  }

  user_data = filebase64("sample.sh")
}

# creating auto scaling group

resource "aws_autoscaling_group" "webapp-auto_scaling_group" {
  desired_capacity    = var.ASG-desired_capacity
  max_size            = var.ASG-max_size
  min_size            = var.ASG-min_size
  vpc_zone_identifier = [aws_subnet.webapp-public_subnet-1.id, aws_subnet.webapp-public_subnet-2.id]

  launch_template {
    id      = aws_launch_template.webapp-launch_template.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.webapp-target_group.arn]
}