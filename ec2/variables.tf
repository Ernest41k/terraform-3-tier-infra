variable "ami" {
    type = string
    description = "ami of ec2 instance"
    default = "ami-05c13eab67c5d8861"
}

variable "instance_type" {
    type = string
    description = "type of ec2 instance"
    default = "t2.micro"
}

variable "tags" {
    type = map(string)
    description = "tags"
}

# variable "public_sg_id" {
#     type = string
#     description = "public ec2 security group"
# }

variable "public_subnet1_id" {
    type = string
    description = "(optional) describe your variable"
}

variable "vpc_id" {
    type = string
    description = "id of vpc"
}