resource "aws_elasticsearch_domain" "elasticsearch-images" {
    domain_name = "elk-images"
    elasticsearch_version = "7.10"

    cluster_config {
      instance_count  = 1
      instance_type   = "t2.small.elasticsearch"
    }

    vpc_options {
      subnet_ids          = [module.vpc.private_subnets[0]]
      security_group_ids  = [module.security-group.security_group_id]
    }

    ebs_options {
      ebs_enabled = true
      volume_size = 10
      volume_type = "gp2"
    }

    tags = var.tags
}

resource "aws_iam_service_linked_role" "elasticsearch-images-linked-role" {
    aws_service_name = "es.amazonaws.com"
    description      = "Allows Amazon ES to manage AWS resources for a domain."
}

# resource "aws_elasticsearch_domain_policy" "elasticsearch-images-policy" {
#   domain_name = aws_elasticsearch_domain.elasticsearch-images.domain_name

#   access_policies = <<POLICIES
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Action": "es:*",
#             "Principal": "*",
#             "Effect": "Allow",
#             "Resource": "${aws_elasticsearch_domain.elasticsearch-images.arn}/*"
#         }
#     ]
# }
# POLICIES
# }
