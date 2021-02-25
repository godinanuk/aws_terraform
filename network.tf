# Create a VPC
resource "aws_vpc" "green_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Create Subnet
resource "aws_subnet" "compute_subnet" {
  vpc_id            = aws_vpc.green_vpc.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "green_environment"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.green_vpc.id
}

resource "aws_route_table" "green_route_table" {
  vpc_id = aws_vpc.green_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "green_environment"
  }
}

resource "aws_route_table_association" "green_subnet_association" {
  subnet_id      = aws_subnet.compute_subnet.id
  route_table_id = aws_route_table.green_route_table.id
}
