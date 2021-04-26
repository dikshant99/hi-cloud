resource "aws_vpc" "main" {
  # cidr_block       = "172.168.0.0/16"
  cidr_block = "${var.VPC_CIDR_BLOCK}"
  enable_dns_hostnames = true

  tags = {
    Name = "hi-cloud-vpc"
  }
}

# Subnets
#resource "aws_subnet" "private-subnet" {
#  vpc_id     = "${aws_vpc.main.id}"
  # cidr_block = "172.168.21.0/24"
#  cidr_block = "${var.private_subnet_cidr_block}"
  # map_public_ip_on_launch = false
#  map_public_ip_on_launch = "${var.public_ip_false}"
  # availability_zone = "us-west-1a"
#  availability_zone = "${var.available_zone}"

#  tags = {
#    Name = "hi-cloud-private"
#  }
#}

resource "aws_subnet" "public-subnet" {
  vpc_id     = "${aws_vpc.main.id}"
  # cidr_block = "172.168.22.0/24"
  cidr_block = "${var.public_subnet_cidr_block}"
  # map_public_ip_on_launch = true
  map_public_ip_on_launch = true
  # availability_zone = "us-west-1a"
  availability_zone = "${var.available_zone}"
  tags = {
    Name = "hi-cloud-public"
  }
}
