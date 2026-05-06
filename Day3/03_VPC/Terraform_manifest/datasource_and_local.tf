# data "aws_vpc" "existing" {
#   filter {
#     name   = "Bootcamp-vpc-do-not-delete-vpc"
#     values = ["vpc-02358ddc1cb955bcd"]
#   }
# }

data "aws_vpc" "existing" {
  id = "vpc-02358ddc1cb955bcd"
}

data "aws_internet_gateway" "existing" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.existing.id]
  }
}

# data "aws_nat_gateway" "existing" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.existing.id]
#   }

#   state = "available"
# }

data "aws_nat_gateway" "existing" {
  id = "nat-054be5efc41467fef"
}

# data "aws_route_table" "existing" {
#   filter {
#     name   = "vpc-id"
#     values = [data.aws_vpc.existing.id]
#   }

#   filter {
#     name   = "tag:Name"
#     values = ["Bootcamp-vpc-do-not-delete-public-rt"]
#   }
# }