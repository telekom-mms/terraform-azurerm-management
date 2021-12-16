module "management" {
  source                 = "../terraform-management"
  management_lock_config = merge(
    {
      for resource_group in keys(module.resource-groups.resource_group) :
      format("delete_%s", module.resource-groups.resource_group[resource_group].name) => {
        name  = "restrict_delete_rg"
        scope = module.resource-groups.resource_group[resource_group].id
        notes = "protect all in resource_group"
      }
    },
    {
      for resource in keys(module.keyvault-mgmt.keyvault) :
      format("delete_%s", module.keyvault-mgmt.keyvault[resource].name) => {
        name  = "restrict_delete"
        scope = module.keyvault-mgmt.keyvault[resource].id
        notes = "protect for resource"
      }
    }
  )
}
