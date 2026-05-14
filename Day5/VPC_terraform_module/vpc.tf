module "vpc" {
  source = "./modules/vpc"
 // vpc_id = data.aws_vpc.existing.id
  environment_name = var.environment_name
  subnet_newbits   = var.subnet_newbits
  tags = var.tags

}

