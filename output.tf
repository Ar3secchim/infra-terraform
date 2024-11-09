output "vpc_id" {
  value       = aws_vpc.main.id
  description = "value of the vpc id"
}

output "subnet_id_public_a" {
  value       = aws_subnet.public-a.id
  description = "value of the public-a subnet id"
}

output "subnet_id_public_b" {
  value       = aws_subnet.public-b.id
  description = "value of the public-b subnet id"
}

output "subnet_id_public_c" {
  value       = aws_subnet.public-c.id
  description = "value of the public-c subnet id"
}
