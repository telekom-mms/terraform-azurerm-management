variable "management_lock_config" {
  type    = any
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
  keyvault_config = {
    for config in keys(local.default.management_lock_config) :
    config => {
      for instance in keys(var.management_lock_config[config]) :
      instance => merge(local.default.management_lock_config[config], var.management_lock_config[config][instance])
    }
  }
}
