variable "management_lock_config" {
  type        = any
  default     = {}
  description = "resource configuration, default settings are defined within locals and merged with var settings"
}

locals {
  default = {
    management_lock_config = {
      name       = "Delete"
      lock_level = "CanNotDelete"
      notes      = ""
    }
  }

  # deep merge
  management_lock_config = {
    for config in keys(var.management_lock_config) :
    config => merge(local.default.management_lock_config, var.management_lock_config[config])
  }
}
