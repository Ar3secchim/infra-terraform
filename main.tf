terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = var.S3_BUCKET_NAME
    key    = var.S3_KEY
    region = var.AWS_REGION
  }
}

#configure the AWS provider
provider "aws" {
  region = var.AWS_REGION
  default_tags {
    tags = {
      environment = "dev"
      author      = "Renara"
      project     = "terraform-ada"
    }
  }
}

