# creating security group

resource "aws_security_group" "webapp-security_group-1" {
  name        = "webapp-security_group-1"
  description = "Allowing inbound traffic"
  vpc_id      = aws_vpc.webapp-vpc.id

  ingress {
    description = "22 from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "80 from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "webapp-security_group-1"
  }
}

