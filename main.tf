locals {
  topic-name = "jolchin-update-topic"
}


#Resource: aws_sns_topic
resource "aws_sns_topic" "user_updates" {
  #   name = "jolchin-updates-topic"
  name = "${local.topic-name}-${var.abc}"
}



resource "aws_instance" "example" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id //get subnet id from vpc.id using data
  associate_public_ip_address = true
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.basic-security.id]

  tags = {
    Name = "${jolchin-ec2}-${var.abc}"
  }
}

data "aws_vpc" "main-id" {
  tags = {
    Name = "main-vpc"
  }
}

resource "aws_security_group" "basic-security" {

  name        = "jolchin-securitygroup-allow-http-https-ssh"
  description = "allow http, https and ssh"
  # can use data block instead
  #   vpc_id = var.vpc_id
  vpc_id = data.aws_vpc.main-id.id

  tags = {
    Name = "jolchin-securitygroup-allow-http-https-ssh"
  }


  #array, mutltiple securtiy group

  # ingress =  [{
  #     from_port   = 80
  #     to_port     = 80
  #     protocol    = "tcp"
  #     cidr_blocks = ["0.0.0.0/0"]
  #     description = "Allow HTTP traffic from anywhere"
  #   }]

  ingress = [
    {
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = null
      prefix_list_ids  = []
      security_groups  = []
      self             = null
      description      = "Allow HTTP traffic from anywhere"
    },
    {
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = null
      prefix_list_ids  = []
      security_groups  = []
      self             = null
      description      = "Allow HTTPS traffic from anywhere"
    },
    {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["121.6.143.225/32"]
      ipv6_cidr_blocks = null
      prefix_list_ids  = []
      security_groups  = []
      self             = null
      description      = "Allow SSH traffic from your IP address"
    }
  ]

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # ingress = []
  # egress = []


}
