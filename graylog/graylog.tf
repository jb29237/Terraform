provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "graylog" {
  ami                         = "${var.ami}"
  instance_type               = "${var.size}"
  key_name                    = "${aws_key_pair.mainkey.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.secgroup1.id}"]
  subnet_id                   = "${aws_subnet.main.id}"
  associate_public_ip_address = true
  root_block_device {
    delete_on_termination = true  
  }
}



resource "aws_vpc" "vpc" {
  cidr_block           = "${var.vpc_subnet}"
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_internet_gateway" "ig" {
  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_subnet" "main" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  cidr_block              = "${var.subnet_one}"
  map_public_ip_on_launch = true
}

resource "aws_security_group" "secgroup1" {
  name        = "graylog"
  description = "Some default ports for graylog"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = "${var.myip}"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = "${var.myip}"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.vpc.id}"
}

resource "aws_route" "public_4" {
  route_table_id         = "${aws_route_table.public.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.ig.id}"
}

resource "aws_route_table_association" "public" {
  subnet_id      = "${aws_subnet.main.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_key_pair" "mainkey" {
  key_name   = "mainkey-pub"
  public_key = "${var.pub_key}"
}
