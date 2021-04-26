# Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "hi-cloud-igw"
  }
}

# route Table

resource "aws_route_table" "private-route1" {
    vpc_id = "${aws_vpc.main.id}"
    tags = {
        Name = "hi-cloud-pvtroute"
    }
}


resource "aws_route_table" "public-route1" {
    vpc_id = "${aws_vpc.main.id}"
    route {
        //associated subnet can reach everywhere
        # cidr_block = "0.0.0.0/0" 
        cidr_block = "${var.igw_cidr_block}"
        //CRT uses this IGW to reach internet
        gateway_id = "${aws_internet_gateway.igw.id}" 
    }
    tags = {
        Name = "hi-cloud-pubroute"
    }

}

# Route table association

resource "aws_route_table_association" "hi-cloud-subnet"{
    subnet_id = "${aws_subnet.public-subnet.id}"
    route_table_id = "${aws_route_table.public-route1.id}"
}

#resource "aws_route_table_association" "hi-cloud-private-subnet"{
#    subnet_id = "${aws_subnet.private-subnet.id}"
#    route_table_id = "${aws_route_table.private-route1.id}"
#}


# create security group
resource "aws_security_group" "ssh-allowed" {
    vpc_id = "${aws_vpc.main.id}"
    #outbound rules
    egress {
        from_port = 0
        to_port = 0
        protocol = -1   #for all protocol
        cidr_blocks = ["${var.out_bound}"]
    }
    #inbound rules
    ingress {
        from_port = 22
        to_port = 22
        protocol = "${var.protocol_type}"
        cidr_blocks = ["${var.myip}"]
    }
    ingress {
        from_port = 80
        to_port = 80
        protocol = "${var.protocol_type}"
        cidr_blocks = ["${var.myip}"]
    }
    ingress {
        from_port = 443
        to_port = 443
        protocol = "${var.protocol_type}"
        cidr_blocks = ["${var.myip}"]
    }
    ingress {
        from_port = 9200
        to_port = 9200
        cidr_blocks = ["0.0.0.0/0"] 
        protocol = "${var.protocol_type}"
        #cidr_blocks = ["${var.myip}"]
    }
    ingress {
        from_port = 9300
        to_port = 9300
        protocol = "${var.protocol_type}"
        cidr_blocks = ["0.0.0.0/0"]
        #["${var.myip}"]
    }
    ingress {
        from_port = 5601
        to_port = 5601
        protocol = "${var.protocol_type}"
        cidr_blocks = ["${var.myip}"]
    }
    ingress {
        from_port = 9600
        to_port = 9600
        protocol = "${var.protocol_type}"
        cidr_blocks = ["${var.myip}"]
    }
    tags = {
        Name = "hi-cloud-securitygroup"
    }
}
