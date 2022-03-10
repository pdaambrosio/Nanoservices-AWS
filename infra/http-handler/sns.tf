resource "aws_sns_topic" "sns-handler-images-topic" {
  name = "s3-handler-images-topic"
  tags = var.tags
}

resource "aws_sns_topic_policy" "sns-handler-images-topic-policy" {
  arn    = aws_sns_topic.sns-handler-images-topic.arn
  policy = data.aws_iam_policy_document.sns-handler-images-iam-policy.json
}

data "aws_iam_policy_document" "sns-handler-images-iam-policy" {
  policy_id = "__default_policy_ID"

  statement {
    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]

    condition {
      test     = "ArnLike"
      variable = "AWS:SourceArn"

      values = [
        aws_s3_bucket.bucket-handler-images.arn,
      ]
    }

    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    resources = [
      aws_sns_topic.sns-handler-images-topic.arn,
    ]

    sid = "__default_statement_ID"
  }
}