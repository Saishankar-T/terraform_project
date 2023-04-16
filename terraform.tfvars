region = "ap-south-1"

vpc-cidr_block = "10.0.0.0/16"

subnet-public-1-cidr_block = "10.0.1.0/24"

subnet-public-2-cidr_block = "10.0.2.0/24"

subnet-private-1-cidr_block = "10.0.3.0/24"

subnet-private-2-cidr_block = "10.0.4.0/24"

template-image_id = "ami-02eb7a4783e7e9317"

template-instance_type = "t2.micro"

template-key_name = "demo-machine-keypair"

ASG-desired_capacity = 2

ASG-min_size = 1

ASG-max_size = 5