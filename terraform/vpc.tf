provider "aws" {
  region = "us-east-1"
}

terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

resource "aws_vpc" "ha_vpc" {
  cidr_block = var.cidr_vpc
  enable_dns_hostnames = true
  enable_dns_support = true
  tags = {
    Name = "ha-vpc"
    Environment = "dev"
    Project     = "terraform-vpc"
  }
}