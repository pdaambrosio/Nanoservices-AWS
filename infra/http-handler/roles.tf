resource "aws_iam_role" "lambda-http-role" {
    name = "${var.prefix}-role"
    assume_role_policy = "${file("${path.module}/lambdaRole.json")}"
    tags = var.tags
}

resource "aws_iam_role_policy_attachment" "lambda-http-attach" {
    role = aws_iam_role.lambda-http-role.name
    count = length(var.iam_policy_arn)
    policy_arn = var.iam_policy_arn[count.index]
}