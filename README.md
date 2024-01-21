<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.4 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.11.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.11.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.1 |

## Resources

| Name | Type |
|------|------|
| [helm_release.release](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [local_file.manifests](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [helm_template.template](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/data-sources/template) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_helm_release"></a> [helm\_release](#input\_helm\_release) | Helm release | ```map(object({ name = string repository = optional(string) chart = string version = optional(string) namespace = optional(string) create_namespace = optional(bool, true) lint = optional(bool, true) values = optional(list(string)) } ))``` | `{}` | no |
| <a name="input_helm_template"></a> [helm\_template](#input\_helm\_template) | Helm template | ```map(object({ name = optional(string) repository = optional(string) chart = optional(string) version = optional(string) namespace = optional(string) create_namespace = optional(bool, true) values = optional(list(string)) } ))``` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_helm_release_manifest"></a> [helm\_release\_manifest](#output\_helm\_release\_manifest) | helm release manifest |
| <a name="output_helm_release_status"></a> [helm\_release\_status](#output\_helm\_release\_status) | helm release status |
| <a name="output_helm_template_manifest"></a> [helm\_template\_manifest](#output\_helm\_template\_manifest) | Helm template manifest |
| <a name="output_helm_template_manifests"></a> [helm\_template\_manifests](#output\_helm\_template\_manifests) | Helm template manifest one file |
| <a name="output_helm_template_notes"></a> [helm\_template\_notes](#output\_helm\_template\_notes) | Helm template notes |
<!-- END_TF_DOCS -->