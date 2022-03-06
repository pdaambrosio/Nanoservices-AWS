module "http-handler" {
  source                = "./http-handler"
  region                = var.region
}

module "thumbnail-handler" {
  source                = "./thumbnail-handler"
  region                = var.region
}

module "filter-handler" {
  source                = "./filter-handler"
  region                = var.region
}

module "image-tagging-filter" {
  source                = "./image-tagging-filter"
  region                = var.region
}

module "general" {
  source                = "./general"
  region                = var.region
}
