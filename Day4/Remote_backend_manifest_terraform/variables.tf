variable "environment_name" {
  description = "Deployment environment (e.g., dev, staging, prod)"
  type        = string
  default     = "test"
}

variable "aws_region" {
  description = "AWS region to deploy backend"
  type        = string
  default     = "ap-south-1"
}