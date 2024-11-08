terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "tf-s3-bucket-1234567890"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
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

