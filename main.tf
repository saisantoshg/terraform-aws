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
  policy="${file("s3_fullaccess_policy.json")}"
  }
resource "aws_iam_policy_attachment" "iam_attach_policy"{
  name       = "test-attachment"
  users      = ["${aws_iam_user.iam_user.name}"]
  policy_arn = "${aws_iam_policy.s3_user_policy.arn}"
  }
resource "aws_iam_policy_attachment" "iam_ec2_attach_policy"{
  name       = "test-attachment"
  users      = ["${aws_iam_user.iam_user.name}"]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
  }
resource "aws_s3_bucket" "s3_clientbucket" {
  bucket = var.bucket_name1
  acl    = "private"

  versioning {
    enabled = true
  }
}
resource "aws_s3_bucket_public_access_block" "block_s3_clientbucket" {
  bucket = var.bucket_name1

  block_public_acls   = true
  block_public_policy = true
}
