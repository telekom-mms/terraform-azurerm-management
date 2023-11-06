output "management_lock" {
  description = "Outputs all attributes of resource_type."
  value = {
    for management_lock in keys(azurerm_management_lock.management_lock) :
    management_lock => {
      for key, value in azurerm_management_lock.management_lock[management_lock] :
      key => value
    }
  }
}

output "variables" {
  description = "Displays all configurable variables passed by the module. __default__ = predefined values per module. __merged__ = result of merging the default values and custom values passed to the module"
  value = {
    default = {
      for variable in keys(local.default) :
      variable => local.default[variable]
    }
    merged = {
      management_lock = {
        for key in keys(var.management_lock) :
        key => local.management_lock[key]
      }
    }
  }
}
