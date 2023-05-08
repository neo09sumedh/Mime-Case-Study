variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "Provide VPC CIDR"
}
variable "publicSubnet"{
    type = string
    default = "10.0.1.0/24"
    description = "Public Subnet CIDR"
}

variable "bucket_name"{
  type = string
  default = "mimeitdemobucket"
}
variable "key_name" {
  type = string
  default = "testingkey"
}

variable "instance_count" {
  type = number 
  default = 2
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "sec_group_name" {
  type = string
  default = "Mine-IT-SG"
}

variable "sec_group_description" {
  type = string
  default = "Securitygroup for Mine-IT"
}
variable "volume_size" {
  type = number 
  default = 8
}
variable "ip_list" {
  description = "Allowed IPs"
  type = list(string)
  default = [
    "0.0.0.0/0",
  ]
}
variable "port_list" {
  description = "Allowed ports"
  type = list(number)
  default = [
    22,
  ]
}