variable "private_subnet1" {
    type = string
    description = "private subnet1 id"
}


variable "private_subnet2" {
    type = string
    description = "private subnet2 id"
}

variable "tags" {
    type = map(string)
    description = "tags"
}

variable "vpc_id" {
    type = string
    description = "vpc id"
}

variable "vpc_cidr" {
    type = string
    description = "cidr range"
}