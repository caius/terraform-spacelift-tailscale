# spacelift-tailscale Terraform Module

Terraform module that manages [Spacelift][] resources to enable [spacelift-tailscale] to function.

[Spacelift]: https://spacelift.io/
[spacelift-tailscale]: https://github.com/caius/spacelift-tailscale/

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| spacelift | >= 1.0 |

## Providers

| Name | Version |
|------|---------|
| spacelift | >= 1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [spacelift_context.spacelift-tailscale-runtime](https://registry.terraform.io/providers/spacelift-io/spacelift/latest/docs/resources/context) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| context\_labels | List of labels for the Spacelift Context. eg. ["autoattach:runtime:spacelift-tailscale"] | `list(string)` | n/a | yes |
| space\_id | The ID of the Spacelift Space to create the resources inside | `any` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->