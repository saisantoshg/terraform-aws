provider "aws" {
  version = "2.33.0"
  region="ap-south-1"
  }

resource "aws_iam_user" "iam_user"{
  name="sai"
  }
