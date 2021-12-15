variable "region" {
}

variable "prefix" {
  type = string
  default = "image-tagging-filter"
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
    "arn:aws:iam::aws:policy/AmazonRekognitionFullAccess",
    "arn:aws:iam::aws:policy/AmazonSQSFullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  ]
}
