provider "aws"{
  region="ap-south-1"
  }

resource "aws ec2 instance" "redhat"{
    ami="ami-0a74bfeb190bd404f"
    instance_type="t2.micro"
    availability_zone="ap-south-1"
  }
