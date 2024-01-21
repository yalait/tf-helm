output "helm_release_status" {
  value = {
    for item in helm_release.release : item.name => {
      status = item.status
    }
  }
  description = "helm release status"
}

output "helm_release_manifest" {
  value = {
    for item in helm_release.release : item.name => {
      manifests = item.manifest
    }
  }
  description = "helm release manifest"
}

output "helm_template_manifest" {
  value = {
    for item in data.helm_template.template : item.name => {
      manifests = item.manifest
    }
  }
  description = "Helm template manifest"
}

output "helm_template_manifests" {
  #value = data.helm_template.template.notes
  value = {
    for item in data.helm_template.template : item.name => {
      manifests = item.manifests
    }
  }
  description = "Helm template manifest one file"
}

output "helm_template_notes" {
  value = {
    for item in data.helm_template.template : item.name => {
      manifests = item.notes
    }
  }
  description = "Helm template notes"
}

