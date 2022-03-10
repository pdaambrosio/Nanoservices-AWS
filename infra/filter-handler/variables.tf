variable "region" {
}

variable "prefix" {
  type    = string
  default = "filter-handler"
}

variable "tags" {
  type = map(string)
  default = {
    environment = "lab",
    terraforms  = "true"
  }
}
