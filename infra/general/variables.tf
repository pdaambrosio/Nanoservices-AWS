variable "region" {
}

variable "prefix" {
  type = string
  default = "general"
}

variable "tags" {
    type = map(string)
    default = {
        environment = "lab",
        terraforms = "true"
    }
}
