resource "random_string" "main" {
  length  = var.length
  upper   = var.upper
  special = var.special
}