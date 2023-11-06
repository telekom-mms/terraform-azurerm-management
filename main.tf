/**
* # management
*
* This module manages the hashicorp/azurerm management resources.
* For more information see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs > management
*
*/

resource "azurerm_management_lock" "management_lock" {
  for_each = var.management_lock

  name       = local.management_lock[each.key].name == "" ? each.key : local.management_lock[each.key].name
  scope      = local.management_lock[each.key].scope
  lock_level = local.management_lock[each.key].lock_level
  notes      = local.management_lock[each.key].notes
}
