output "vpc_ids" {
  value = {
    useast1 = module.networking_useast1.vpc_id
    uswest2 = module.networking_uswest2.vpc_id
  }
}