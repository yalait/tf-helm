module "helm" {
  source = "git::https://github.com/yalait/helm.git?ref=main"
  helm_template = {
    cni = {
      name       = "cilium"
      repository = "https://helm.cilium.io/repository/cilium-charts/"
      chart      = "cilium"
      version    = "1.14.5"
      namespace  = "kube-system"

      values = [templatefile("${path.module}/templates/values/my-cilium-values.yaml.tmpl", {
        k8s_service_host = var.cluster_parameters.api_domain
        k8s_service_port = var.cluster_parameters.api_port
        pod_subnet       = var.cluster_parameters.pod_subnet
      })]
    }
  }
  helm_release = {
    cni = {
      name       = "cilium"
      repository = "https://helm.cilium.io/repository/cilium-charts/"
      chart      = "cilium"
      version    = "1.14.5"
      namespace  = "kube-system"

      values = [templatefile("${path.root}/templates/values/my-cilium-values.yaml.tmpl", {
        k8s_service_host = var.cluster_parameters.api_domain
        k8s_service_port = var.cluster_parameters.api_port
        pod_subnet       = var.cluster_parameters.pod_subnet
      })]
    }
  }
}
