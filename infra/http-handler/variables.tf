variable "region" {
}

variable "prefix" {
  type = string
  default = "http-handler"
}

variable "tags" {
    type = map(string)
    default = {
        environment = "lab",
        terraforms = "true"
    }
}

variable "iam_policy_arn" {
  type = list(string)
  default = [
    "arn:aws:iam::aws:policy/CloudWatchFullAccess",
    "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  ]
}
