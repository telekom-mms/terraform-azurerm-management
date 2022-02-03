variable "management_lock" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}

locals {
  default = {
    # resource definition
    management_lock = {
      name       = ""
      lock_level = "CanNotDelete"
      notes      = ""
    }
  }

  # compare and merge custom and default values
  # merge all custom and default values
  management_lock = {
    for management_lock in keys(var.management_lock) :
    management_lock => merge(local.default.management_lock, var.management_lock[management_lock])
  }
}
