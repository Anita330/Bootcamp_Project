
output "public_subnet_ids" {
  value       = aws_subnet.public_subnet.id
  description = "List of public subnet IDs"
}

output "private_subnet_ids" {
  value       = aws_subnet.private_subnet.id
  description = "List of private subnet IDs"
}

# output "public_subnet_map" {
#   value       = aws_subnet.public_subnet_map.id
#   description = "Map of AZ to Public Subnet ID"
# }