provider "aws" {
  version = "2.33.0"
  }

data "aws_iam_user" "iam_user"{
  user_name="user1"
  }
