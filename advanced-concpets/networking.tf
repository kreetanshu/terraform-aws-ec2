resource "aws_vpc" "us_east_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = merge(local.tags, {
    Name = "us-east-vpc"
  })
}

resource "aws_subnet" "us_east_subnet" {
  vpc_id     = aws_vpc.us_east_vpc.id
  cidr_block = "10.0.0.0/24"
  tags = merge(local.tags, {
    Name = "us-east-subnet"
  })
}

resource "aws_internet_gateway" "us_east_igw" {
  vpc_id = aws_vpc.us_east_vpc.id
  tags = merge(local.tags, {
    Name = "us-east-igw"
  })
}

resource "aws_route_table" "us_east_route_table" {
  vpc_id = aws_vpc.us_east_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.us_east_igw.id
  }
}

resource "aws_route_table_association" "us-east_route_table_association" {
  subnet_id      = aws_subnet.us_east_subnet.id
  route_table_id = aws_route_table.us_east_route_table.id
}