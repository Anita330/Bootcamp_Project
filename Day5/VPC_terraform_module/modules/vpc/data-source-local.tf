data "aws_vpc" "existing" {
  id = "vpc-02358ddc1cb955bcd"
}

data "aws_internet_gateway" "existing" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.existing.id]
  }
}