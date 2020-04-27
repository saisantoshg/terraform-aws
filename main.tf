provider "aws" {
  version = "2.33.0"
  region="ap-south-1"
  }

resource "aws_iam_user" "iam_user"{
  name="sai"
  }

resource "aws_iam_policy" "s3_user_policy"{
  name="s3_fullaccess_policy"
  description="give sai s3 full access"
  
    policy=<<EOF
    {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Effect": "Allow",
              "Action": "s3:*",
              "Resource": "*"
          }
      ]
    }
  EOF
  }
resource "aws_iam_policy_attachment" "iam_attach_policy"{
  name       = "test-attachment"
  users      = ["${aws_iam_user.iam_user.name}"]
  policy_arn = "${aws_iam_policy.s3_user_policy.arn}"
  
  }
