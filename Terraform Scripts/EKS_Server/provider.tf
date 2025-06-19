terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "endtoendcicdproject"
    key            = "eks-server/terraform.tfstate"
    dynamodb_table = "terraform-lock"
    region         = "ap-south-1"

  }
}

resource "aws_dynamodb_table" "tf_lock" {
  name           = "terraform-lock"
  hash_key       = "LockID"
  read_capacity  = 3
  write_capacity = 3
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "Terrafrom Lock Table"
  }
  lifecycle {
    prevent_destroy = true
  }
}

provider "aws" {
  region = "ap-south-1"
}