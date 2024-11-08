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
  default     = "us-east-1"
}

variable "S3_BUCKET_NAME" {
  description = "S3 bucket name for Terraform state"
  type        = string
  default     = "tf-s3-bucket-1234567890"
}

variable "S3_KEY" {
  description = "S3 key for Terraform state"
  type        = string
  default     = "state/terraform.tfstate"
}
