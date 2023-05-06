output subnet_id {
  value       = aws_subnet.PublicSubnet.id
  description = "Public Subnet Id"  
}
output "vpc_id" {
  value = aws_vpc.vpc.id
}