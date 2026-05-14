resource "aws_subnet" "public_subnet" {
  vpc_id                  = data.aws_vpc.existing.id
  cidr_block              = "10.0.30.0/24"
  availability_zone       = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "AnitaKar-20-pub-subnet"
  }
}

# Resource-4: Private Subnets
resource "aws_subnet" "private_subnet" {
  vpc_id            = data.aws_vpc.existing.id
  cidr_block        = "10.0.130.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "AnitaKar-20-priv-subnet"
  }
}



resource "aws_route_table" "public_rt" {
  vpc_id = data.aws_vpc.existing.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.existing.id
  }
  tags = merge(var.tags, { Name = "${var.environment_name}-public-rt" })
}

resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}


resource "aws_route_table_association" "private_rt_assoc" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# resource "aws_route_table" "private_rt" {
#   vpc_id = aws_vpc.main.id
#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat.id
#   }
#   tags = merge(var.tags, { Name = "${var.environment_name}-private-rt" })
# }

# resource "aws_route_table_association" "private_rt_assoc" {
#   for_each = aws_subnet.private
#   subnet_id      = each.value.id
#   route_table_id = aws_route_table.private_rt.id
# }