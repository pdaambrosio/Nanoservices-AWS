resource "aws_elasticsearch_domain" "elasticsearch-images" {
    domain_name = "elk-images"
    elasticsearch_version = "7.10"

    cluster_config {
      instance_count  = 1
      instance_type   = "t2.small.search"
    }

    vpc_options {
      subnet_ids = [module.vpc.private_subnets[0]]
      security_group_ids = module.security-group.security_group_id
    }

    tags = var.tags
}