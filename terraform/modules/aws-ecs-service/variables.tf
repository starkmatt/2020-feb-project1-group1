variable "project_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "cluster_id" {
  type = string
}

variable "task_arn" {
  type = string
}

variable "vpc_id" {
  type = string
}
