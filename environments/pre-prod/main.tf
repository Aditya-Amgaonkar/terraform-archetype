provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "my_vpc" {
    source      = "../../modules/aws/vpc"
    vpc_cidr    = "192.168.0.0/16"
    tenancy     = "default"
    vpc_id      = module.my_vpc.vpc_id
    subnet_cidr = "192.168.1.0/24"
}

module "my_ec2" {
    source        = "../../modules/aws/ec2"
    ec2_count     = "1"
    ami_id        = "ami-087c17d1fe0178315"
    instance_type = "t2.micro"
    subnet_id     = module.my_vpc.subnet_id
}