module "container" {
  source = "registry.terraform.io/telekom-mms/container/azurerm"
  container_registry = {
    crmms = {
      location            = "westeurope"
      resource_group_name = "rg-mms-github"
    }
  }
}

module "management" {
  source = "registry.terraform.io/telekom-mms/management/azurerm"
  management_lock = {
    container_registry = {
      name  = "restrict_delete"
      scope = module.container.container_registry["crmms"].id
      notes = "protect resource"
    }
  }
}
