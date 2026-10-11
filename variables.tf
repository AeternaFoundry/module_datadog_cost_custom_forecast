variable "cost_custom_forecasts" {
  description = <<EOT
Map of cost_custom_forecasts, attributes below
Required:
    - budget_uid
Optional:
    - entries (block):
        - amount (required)
        - month (required)
        - tag_filters (optional, block):
            - tag_key (required)
            - tag_value (required)
EOT

  type = map(object({
    budget_uid = string
    entries = optional(list(object({
      amount = number
      month  = number
      tag_filters = optional(list(object({
        tag_key   = string
        tag_value = string
      })))
    })))
  }))
}

