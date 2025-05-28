module "networking_useast1" {
  source         = "./modules/networking"
  providers      = { aws = aws.useast1 }
  region         = "us-east-1"
  vpc_cidr_block = "10.0.0.0/16"
  project_prefix = var.project_prefix
}

module "networking_uswest2" {
  source         = "./modules/networking"
  providers      = { aws = aws.uswest2 }
  region         = "us-west-2"
  vpc_cidr_block = "10.0.0.0/16"
  project_prefix = var.project_prefix
}

module "dynamodb_useast1" {
  source         = "./modules/dynamodb"
  providers      = { aws = aws.useast1 }
  region         = "us-east-1"
  replica_region = "us-west-2"
  project_prefix = var.project_prefix
}
module "iam" {
  source         = "./modules/iam"
  project_prefix = var.project_prefix
}

module "ec2_useast1" {
  source                   = "./modules/ec2"
  providers                = { aws = aws.useast1 }
  region                   = "us-east-1"
  ami                      = "ami-028078b00cb6e98cb"
  project_prefix           = var.project_prefix
  aws_iam_instance_profile = module.iam.aws_iam_instance_profile
  vpc_id                   = module.networking_useast1.vpc_id
  public_web_subnet_ids    = module.networking_useast1.public_web_subnet_ids
  public_web_sg_id         = module.networking_useast1.public_web_sg_id
  public_lb_sg_id          = module.networking_useast1.public_lb_sg_id
}

module "ec2_uswest2" {
  source                   = "./modules/ec2"
  providers                = { aws = aws.uswest2 }
  region                   = "us-west-2"
  ami                      = "ami-0c4ad3e8c46467aa3"
  project_prefix           = var.project_prefix
  aws_iam_instance_profile = module.iam.aws_iam_instance_profile
  vpc_id                   = module.networking_uswest2.vpc_id
  public_web_subnet_ids    = module.networking_uswest2.public_web_subnet_ids
  public_web_sg_id         = module.networking_uswest2.public_web_sg_id
  public_lb_sg_id          = module.networking_uswest2.public_lb_sg_id
}


