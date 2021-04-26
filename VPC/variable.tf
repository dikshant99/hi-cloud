variable "AWS_REGION" {    
    default = "us-west-1"
}

variable "AWS_ZONE" {
	default = "us-west-1a"
}

variable "AMI" {
    type = "map"
    
    default = {
        us-west-1a = "ami-0a741b782c2c8632d"
    }
}

variable "VPC_CIDR_BLOCK" {
    default = "172.168.0.0/16"
  
}

variable "private_subnet_cidr_block" {
  default = "172.168.21.0/24"
}
variable "public_subnet_cidr_block" {
  default = "172.168.22.0/24"
}

variable "public_ip_false" {
    default=false
  
}
variable "public_ip_true" {
    default="true"
  
}

variable "available_zone" {
  default = "us-west-1a"
}

variable "igw_cidr_block" {
    default = "0.0.0.0/0" 
}


variable "out_bound" {
  default = "0.0.0.0/0"
}


variable "myip" {
  default = "27.58.117.248/32"
}

variable "protocol_type" {
  default ="tcp"
}
