provider "aws" {
  region     = var.AWS_REGION
}

data "aws_vpc" "default" {
  default = true
} 