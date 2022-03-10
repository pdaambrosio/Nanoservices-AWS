variable "region" {
}

variable "prefix" {
  type    = string
  default = "general"
}

variable "vpc_name" {
  type    = string
  default = "elasticsearch"
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "lab",
    Terraforms  = "true"
  }
}

variable "cidr" {
  type    = string
  default = "172.32.0.0/16"
}

variable "availability_zones" {
  type = list(string)
  default = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c"
  ]
}

variable "private_subnets" {
  type = list(string)
  default = [
    "172.32.0.0/24",
    "172.32.1.0/24",
    "172.32.3.0/24"
  ]
}
