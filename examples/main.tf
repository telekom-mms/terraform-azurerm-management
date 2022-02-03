module "management" {
  source = "../terraform-management"
  management_lock = merge(
    /** protect all created resource_groups */
    {
      for resource_group in keys(module.resource_group.resource_group) :
      format("delete_%s", module.resource_group.resource_group[resource_group].name) => {
        name  = "restrict_delete_rg"
        scope = module.resource_group.resource_group[resource_group].id
        notes = "protect all in resource_group"
      }
    },
    /** protect created resources */
    {
      for resource in keys(module.acr.container_registry) :
      format("delete_%s", module.acr.container_registry[resource].name) => {
        name  = "restrict_delete"
        scope = module.acr.container_registry[resource].id
        notes = "protect for resource"
      }
    }
  )
}
