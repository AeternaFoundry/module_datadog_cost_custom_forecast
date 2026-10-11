resource "datadog_cost_custom_forecast" "cost_custom_forecasts" {
  for_each = var.cost_custom_forecasts

  budget_uid = each.value.budget_uid

  dynamic "entries" {
    for_each = each.value.entries != null ? each.value.entries : []
    content {
      amount = entries.value.amount
      month  = entries.value.month
      dynamic "tag_filters" {
        for_each = entries.value.tag_filters != null ? entries.value.tag_filters : []
        content {
          tag_key   = tag_filters.value.tag_key
          tag_value = tag_filters.value.tag_value
        }
      }
    }
  }
}

