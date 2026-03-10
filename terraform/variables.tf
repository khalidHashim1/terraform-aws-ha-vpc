variable "cidr_vpc" {
  default = "10.0.0.0/16"
}

variable "cidr_public_a" {
  default = "10.0.1.0/24"
}

variable "cidr_public_b" {
  default = "10.0.2.0/24"
}

variable "cidr_private_a" {
  default = "10.0.11.0/24"
}

variable "cidr_private_b" {
  default = "10.0.22.0/24"
}

variable "public_az_a" {
  default = "us-east-1a"
}

variable "public_az_b" {
  default = "us-east-1b"
}

variable "private_az_a" {
  default = "us-east-1a"
}

variable "private_az_b" {
  default = "us-east-1b"
}