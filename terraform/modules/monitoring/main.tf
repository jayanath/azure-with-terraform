module "random" {
  source = "../random"
}

resource "azurerm_monitor_diagnostic_setting" "activity_logs" {
  name                       = "diag-${var.location}-${var.environment}-${module.random.result}"
  storage_account_id         = var.storage_account_id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  target_resource_id         = var.target_resource_id

  dynamic "log" {
    for_each = var.categories
    content {
      category = log.value.category
      retention_policy {
        enabled = log.value.retention_policy.enabled
      }
    }
  }

}
