############# PRIVATE SUBNETS. 
resource "aws_eip" "nat_eip_a" {
  domain = "vpc"
  tags = {
    Name = "nat-eip-a"
  }
}

resource "aws_eip" "nat_eip_b" {
  domain = "vpc"
  tags = {
    Name = "nat-eip-b"
  }
}
# NAT 
resource "aws_nat_gateway" "nat_a" {
  allocation_id = aws_eip.nat_eip_a.id
  subnet_id = aws_subnet.public_subnet_a.id
  depends_on = [ aws_internet_gateway.igw ]
  tags = {
    Name = "nat-a"
  }
}

resource "aws_nat_gateway" "nat_b" {
  allocation_id = aws_eip.nat_eip_b.id
  subnet_id = aws_subnet.public_subnet_b.id
  depends_on = [ aws_internet_gateway.igw ]
  tags = {
    Name = "nat-b"
  }
}