output "vpc_id" {
  value = module.network.vpc_id
}
output "subnet_id" {
  value = module.network.subnet_id
}  
output "instance_id"{
    value = module.compute.*.instance_id
}
output "Security_group_id"{
    value = module.compute.security_group_id
}