resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = var.public_subnet1_id
  key_name = "remote-kp"
  vpc_security_group_ids = [aws_security_group.public_sg.id]
  user_data = file("scripts/web-server-setup.sh")

   tags = merge(var.tags, {
    Name = "${var.tags["project"]}-${var.tags["application"]}-${var.tags["environment"]}-pub-web-server"
  }) 
}

resource "aws_security_group" "public_sg" {
  name        = "${var.tags["project"]}-${var.tags["application"]}-${var.tags["environment"]}-public-sg"
  description = "allow http traffic"
  vpc_id      = var.vpc_id

    ingress {
    description      = "allow ssh traffic"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    description      = "allow http traffic"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

    ingress {
    description      = "allow https traffic"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"  # allows any type of protocol
    cidr_blocks      = ["0.0.0.0/0"]
  }

   tags = merge(var.tags, {
    Name = "${var.tags["project"]}-${var.tags["application"]}-${var.tags["environment"]}-public-sg"
  }) 
}



  # user_data = base64encode(<<-EOF
  #                           #!/bin/bash
  #                           sudo su
  #                           yum update -y
  #                           yum install -y httpd
  #                           cd /var/www/html
  #                           wget https://github.com/Ahmednas211/jupiter-zip-file/raw/main/jupiter-main.zip
  #                           unzip jupiter-main.zip
  #                           cp -r jupiter-main/* /var/www/html
  #                           rm -rf jupiter-main jupiter-main.zip
  #                           systemctl start httpd
  #                           systemctl enable httpd
  #                         EOF
  # )