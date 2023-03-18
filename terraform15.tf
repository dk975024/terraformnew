provider "aws" {
  region = "eu-west-1"
}

terraform {
  backend "s3" {
    bucket = "dk97502400"
    key    = "terraform15.tfstate"
    region = "ap-northeast-1"
    dynamodb_table = "terraform.tf"
  }
}
resource "aws_vpc" "my_vpc" {
  count = "${terraform.workspace == "dev" ? 0 : 1}"
  cidr_block = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "javaHomeVpc"
    Environment = "${terraform.workspace}"
    Need = "test3"
  }

  
}
#output "vpc_cidr" {
#    value = "${aws_vpc.my_vpc.cidr_block}"
#  }
#output "vpc_id" {
#    value = "${aws_vpc.my_vpc.id}"
#  }


