output "vpc_id" {
    value = aws_vpc.main.id
}

output "public_subnet1_id" {
    value = aws_subnet.public_subnet1.id
}

output "public_subnet2_id" {
    value = aws_subnet.public_subnet2.id
}

output "private_subnet1_id" {
    value = aws_subnet.private_subnet1.id
}

output "private_subnet2_id" {
    value = aws_subnet.private_subnet2.id
}

# output "public_sg_id" {
#   description = "public security group id"
#   value = aws_security_group.public_sg.id
# }
