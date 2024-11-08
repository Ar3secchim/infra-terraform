variable "VPC_CIDR" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "INTERNET_GATEWAY" {
  description = "CIDR block for the internet gateway"
  type        = string
}

variable "DB_PASSWORD" {
  description = "DB password"
  type        = string
}

variable "DB_USERNAME" {
  description = "DB username"
  type        = string
}

variable "SUBNET_CIDR_PRIVATE_A" {
  description = "CIDR block for private subnet B"
  type        = string
}

variable "SUBNET_CIDR_PRIVATE_B" {
  description = "CIDR block for private subnet B"
  type        = string
}

variable "SUBNET_CIDR_PRIVATE_C" {
  description = "CIDR block for private subnet C"
  type        = string
}

variable "AVAILABILITY_ZONE_A" {
  description = "Availability zone for subnet A"
  type        = string
}

variable "AVAILABILITY_ZONE_B" {
  description = "Availability zone for subnet B"
  type        = string
}

variable "AVAILABILITY_ZONE_C" {
  description = "Availability zone for subnet C"
  type        = string
}


variable "INSTANCE_TYPE_EC2" {
  description = "Instance type for EC2 instances"
  type        = string
}

variable "AWS_REGION" {
  description = "AWS region"
  type        = string
}
