provider "aws" {
  version = "2.33.0"
  region="ap-south-1"
  }

resource "aws_instance" "redhat"{
  attribute{
    ami="ami-0a74bfeb190bd404f"
    instance_type="t2.micro"
    availability_zone="ap-south-1"
    }
  }
