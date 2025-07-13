resource "aws_vpc" "us_east_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "multiple-resources-vpc"
  }
}

resource "aws_subnet" "us_east_subnet" {
  count      = var.subnet_count
  vpc_id     = aws_vpc.us_east_vpc.id
  cidr_block = "10.0.${count.index}.0/24"
  tags = {
    Name = "multiple-resources-subnet-${count.index}"
  }
}