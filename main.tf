module "network" {
    source = "./modules/network"
    vpc_cidr = var.vpc_cidr
    publicSubnet = var.publicSubnet
}

module "compute" {
    source = "./modules/compute"
    key_name = var.key_name
    instance_count = var.instance_count
    instance_type = var.instance_type
    subnet_id = module.network.subnet_id
    sec_group_name = var.sec_group_name
    sec_group_description = var.sec_group_description
    volume_size = var.volume_size
    ip_list = var.ip_list
    port_list = var.port_list
    vpc_id = module.network.vpc_id
}



