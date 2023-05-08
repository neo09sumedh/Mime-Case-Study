variable "key_name" {
  type = string  
  default = "Mine-IT"
}
variable "instance_profile_id"{
  type = string
}
variable "subnet_id" {
    type = string
}
variable "instance_count" {
  type = number 
}
variable "vpc_id" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "sec_group_name" {
  type = string
}

variable "sec_group_description" {
  type = string
}
variable "volume_size" {
  type = number
}
variable "ip_list" {
  description = "Allowed IPs"
  type = list(string)
}
variable "port_list" {
  description = "Allowed ports"
  type = list(number)
}