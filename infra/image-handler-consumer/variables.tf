variable "region" {
}

variable "prefix" {
  type    = string
  default = "image-handler-consumer"
}

variable "tags" {
  type = map(string)
  default = {
    Environment = "lab",
    Terraforms  = "true"
  }
}

variable "iam_policy_arn" {
  type = list(string)
  default = [
    "arn:aws:iam::aws:policy/CloudWatchFullAccess",
    "arn:aws:iam::aws:policy/AmazonVPCFullAccess",
    "arn:aws:iam::aws:policy/AmazonESFullAccess",
    "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess",
    "arn:aws:iam::aws:policy/AmazonSQSFullAccess"
  ]
}