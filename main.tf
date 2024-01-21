
locals {
  helm_release  = var.helm_release
  helm_template = var.helm_template
}

resource "helm_release" "release" {
  for_each         = { for k, v in local.helm_release : k => v }
  name             = each.value.name
  repository       = each.value.repository
  chart            = each.value.chart
  version          = each.value.version
  namespace        = each.value.namespace
  create_namespace = each.value.create_namespace
  lint             = each.value.lint
  values           = each.value.values
  force_update     = true
}

data "helm_template" "template" {
  for_each         = { for k, v in local.helm_template : k => v }
  name             = each.value.name
  repository       = each.value.repository
  chart            = each.value.chart
  version          = each.value.version
  namespace        = each.value.namespace
  create_namespace = each.value.create_namespace
  values           = each.value.values
  is_upgrade       = true
}

resource "local_file" "manifests" {
  for_each = {
    for item in data.helm_template.template : item.name => item.manifest
  }

  filename   = "${path.root}/manifests/${each.key}.yaml"
  content    = each.value
  depends_on = [data.helm_template.template]
}
