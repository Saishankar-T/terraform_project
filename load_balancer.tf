# creating target group

resource "aws_lb_target_group" "webapp-target_group" {
  name     = "webapp-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.webapp-vpc.id

}

# creating listener 

resource "aws_lb_listener" "webapp-listener" {
  load_balancer_arn = aws_lb.webapp-load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.webapp-target_group.arn
  }
}

# creating load balancer

resource "aws_lb" "webapp-load_balancer" {
  name               = "webapp-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.webapp-security_group-1.id]
  subnets            = [aws_subnet.webapp-public_subnet-1.id, aws_subnet.webapp-public_subnet-2.id]

  #   enable_deletion_protection = true

  tags = {
    Environment = "production"
  }
}

