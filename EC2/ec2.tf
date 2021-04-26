module "vpc_main" {
  source = "../VPC"
  
}


resource "aws_key_pair" "hicloud_key" {
  key_name   = "hicloud"
  public_key = file("hicloud.pub")
  tags = {
          Name = "hicloud-key"
  }
}


# public instance
resource "aws_instance" "master-instance" {
    ami           = "ami-0a741b782c2c8632d"
    instance_type = "${var.instance_type}"
    # subnet_id = "${aws_subnet.public-subnet.id}"
    subnet_id = "${module.vpc_main.subnet-public}"
    # vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]
    vpc_security_group_ids = ["${module.vpc_main.security-group}"]
    # key_name
    key_name = "${var.key_name}"
    disable_api_termination = false
    tags = {
      Name = "hi-cloud-public-tf"
      node = "master"
    }
}


resource "aws_instance" "data-instance" {
    ami           = "ami-0a741b782c2c8632d"
    instance_type = "${var.instance_type}"
    subnet_id = "${module.vpc_main.subnet-public}"
    vpc_security_group_ids = ["${module.vpc_main.security-group}"]
    # key_name
    key_name = "${var.key_name}"
    disable_api_termination = false
    tags = {
      Name = "hi-cloud-public-tf"
      node = "data"
    }
}


resource "aws_instance" "public-instance" {
    ami           = "ami-0a741b782c2c8632d"
    instance_type = "${var.instance_type}"
   
    subnet_id = "${module.vpc_main.subnet-public}"
  
    vpc_security_group_ids = ["${module.vpc_main.security-group}"]
    # key_name
    key_name = "${var.key_name}"
    disable_api_termination = false
    tags = {
      Name = "hi-cloud-public-tf"
      node1 = "logstash"
      node2 = "kibana"
    }
}
