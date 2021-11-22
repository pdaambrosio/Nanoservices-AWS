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
