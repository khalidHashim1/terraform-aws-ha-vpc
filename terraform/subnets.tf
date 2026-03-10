resource "aws_subnet" "public_subnet_a" {
  vpc_id = aws_vpc.ha_vpc.id
  cidr_block = var.cidr_public_a
  availability_zone = var.public_az_a
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-a"
  }
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id = aws_vpc.ha_vpc.id
  cidr_block = var.cidr_public_b
  availability_zone = var.public_az_b
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-b"
  }
}

resource "aws_subnet" "private_subnet_a" {
  vpc_id = aws_vpc.ha_vpc.id
  cidr_block = var.cidr_private_a
  availability_zone = var.private_az_a
  # Not using "map_public_ip_on_launch = true" private subnet instance should not have public IP. 
  tags = {
    Name = "private-subnet-a"
  }
}

resource "aws_subnet" "private_subnet_b" {
  vpc_id = aws_vpc.ha_vpc.id
  cidr_block = var.cidr_private_b
  availability_zone = var.private_az_b
  tags = {
    Name = "private-subnet-b"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ha_vpc.id
  tags = {
    Name = "igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.ha_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-route-table"
  }
}
# association for SUBNET A
resource "aws_route_table_association" "public_assoc_a" {
  subnet_id = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_rt.id
}
# association for SUBNET b
resource "aws_route_table_association" "public_assoc_b" {
  subnet_id = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.public_rt.id
}

# route table for PRIVATE SUBNETS
resource "aws_route_table" "private_rt_a" {
  vpc_id = aws_vpc.ha_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_a.id
  }
  tags = {
    Name = "private_rt_a"
  }
}

resource "aws_route_table" "private_rt_b" {
  vpc_id = aws_vpc.ha_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_b.id
  }
  tags = {
    Name = "private_rt_b"
  }
}

resource "aws_route_table_association" "private_assoc_a" {
  route_table_id = aws_route_table.private_rt_a.id
  subnet_id = aws_subnet.private_subnet_a.id
}

resource "aws_route_table_association" "private_assoc_b" {
  route_table_id = aws_route_table.private_rt_b.id
  subnet_id = aws_subnet.private_subnet_b.id
}