/**
 * # management lock
 *
 * This module manages Azure Management Locks.
 *
*/
resource "azurerm_management_lock" "management_lock" {
  for_each = local.management_lock_config

  name       = local.management_lock_config[each.key].name
  scope      = local.management_lock_config[each.key].scope
  lock_level = local.management_lock_config[each.key].lock_level
  notes      = local.management_lock_config[each.key].notes
}
