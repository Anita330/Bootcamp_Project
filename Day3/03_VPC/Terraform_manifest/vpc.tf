

# Resource-3: Public Subnets
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
  availability_zone = "ap-south-1a"

  tags = {
    Name = "AnitaKar-20-priv-subnet"
  }
}

# Resource-5: Elastic IP for NAT Gateway
# resource "aws_eip" "nat" {
#   tags = merge(var.tags, { Name = "${var.environment_name}-nat-eip" })
# }

# Resource-6: NAT Gateway
# resource "aws_nat_gateway" "nat" {
#   allocation_id = aws_eip.nat.id
#   subnet_id     = aws_subnet.public_subnet.id
#   tags = merge(var.tags, { Name = "${var.environment_name}-nat" })
#   depends_on = [data.aws_internet_gateway.existing]
# }

# Resource-7: Public Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = data.aws_vpc.existing.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.existing.id
  }
  tags = merge(var.tags, { Name = "${var.environment_name}-public-rt" })
}

# Resource-8: Public Route Table Associate to Public Subnet
resource "aws_route_table_association" "public_rt_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# Resource-9: Private Route Table
# resource "aws_route_table" "private_rt" {
#   vpc_id = data.aws_vpc.existing.id
#   route {
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = data.aws_nat_gateway.existing.id
#   }
#   tags = merge(var.tags, { Name = "${var.environment_name}-private-rt" })
# }

# Resource-10: Private Route Table Association to Private Subnet
# resource "aws_route_table_association" "private_rt_assoc" {
  
#   subnet_id      = aws_subnet.private_subnet.id
#   route_table_id = data.aws_route_table.existing.id
# }