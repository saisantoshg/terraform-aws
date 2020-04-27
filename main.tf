provider "aws" {
  version = "2.33.0"
  region="ap-south-1"
  }

data "aws_iam_user" "sai"{
  name="sai"
  }
