resource "aws_vpc" "main" {
    cidr_block = "18.0.0.0/16"
    instance_tenency = "default"

    tags = {
        Name = "demo"
    }
}
