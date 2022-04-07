variable "region" {
}

variable "prefix" {
  type    = string
  default = "http-handler"
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
    "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess",
    "arn:aws:iam::aws:policy/AmazonSSMReadOnlyAccess"
  ]
}
