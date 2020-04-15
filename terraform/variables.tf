variable "project_name" {
  default = "project_1_group_1"
}

variable "username" {
  type        = string
  description = "Db Username"
}

variable "pass" {
  type        = string
  description = "Db Pass"
}

variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default = "10.10.0.0/16"
}
