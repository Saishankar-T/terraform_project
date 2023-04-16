variable "region" {
  type = string
}

variable "vpc-cidr_block" {
  type = string
}

variable "subnet-public-1-cidr_block" {
  type = string
}

variable "subnet-public-2-cidr_block" {
  type = string
}

variable "subnet-private-1-cidr_block" {
  type = string
}

variable "subnet-private-2-cidr_block" {
  type = string
}

variable "template-image_id" {
  type = string
}

variable "template-instance_type" {
  type = string
}

variable "template-key_name" {
  type = string
}

variable "ASG-desired_capacity" {
  type = number
}

variable "ASG-min_size" {
  type = number
}

variable "ASG-max_size" {
  type = number
}