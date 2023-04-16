# creating vpc

resource "aws_vpc" "webapp-vpc" {
  cidr_block = var.vpc-cidr_block

  tags = {
    "Name" = "webapp-vpc"
  }
}

# creating public subnets

resource "aws_subnet" "webapp-public_subnet-1" {
  cidr_block              = var.subnet-public-1-cidr_block
  vpc_id                  = aws_vpc.webapp-vpc.id
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "webapp-public_subnet-1"
  }
}

resource "aws_subnet" "webapp-public_subnet-2" {
  cidr_block              = var.subnet-public-2-cidr_block
  vpc_id                  = aws_vpc.webapp-vpc.id
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "webapp-public_subnet-2"
  }
}

# creating private subnets

resource "aws_subnet" "webapp-private_subnet-1" {
  cidr_block              = var.subnet-private-1-cidr_block
  vpc_id                  = aws_vpc.webapp-vpc.id
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "webapp-private_subnet-1"
  }
}

resource "aws_subnet" "webapp-private_subnet-2" {
  cidr_block              = var.subnet-private-2-cidr_block
  vpc_id                  = aws_vpc.webapp-vpc.id
  availability_zone       = "ap-south-1b"
  map_public_ip_on_launch = true

  tags = {
    "Name" = "webapp-private_subnet-2"
  }
}

# creating internet gateway

resource "aws_internet_gateway" "webapp-internet_gateway" {
  vpc_id = aws_vpc.webapp-vpc.id

  tags = {
    "Name" = "webapp-internet_gateway"
  }
}

# creating route table

resource "aws_route_table" "webapp-route_table-1" {
  vpc_id = aws_vpc.webapp-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.webapp-internet_gateway.id
  }

  tags = {
    "Name" = "webapp-route_table-1"
  }
}

# creating route table association 

resource "aws_route_table_association" "webapp-RT-ASS-1" {
  route_table_id = aws_route_table.webapp-route_table-1.id
  subnet_id      = aws_subnet.webapp-public_subnet-1.id
}

resource "aws_route_table_association" "webapp-RT-ASS-2" {
  route_table_id = aws_route_table.webapp-route_table-1.id
  subnet_id      = aws_subnet.webapp-public_subnet-2.id
}
