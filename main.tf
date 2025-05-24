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

module "dynamodb_uswest2" {
  source         = "./modules/dynamodb"
  providers      = { aws = aws.uswest2 }
  region         = "us-west-2"
  replica_region = "us-east-1"
  project_prefix = var.project_prefix
}