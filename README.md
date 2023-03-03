# Serverless Operator Automation module

Automation to deploy the Serverless Operator in OpenShift using GitOps


## Software dependencies

The module depends on the following software components:

### Command-line tools

- terraform - v12
- kubectl

### Terraform providers

- IBM Cloud provider >= 1.5.3
- Helm provider >= 1.1.1 (provided by Terraform)

## Module dependencies

This module makes use of the output from other modules:

- GitOps - github.com/cloud-native-toolkit/terraform-tools-gitops.git
- Namespace - github.com/cloud-native-toolkit/terraform-gitops-namespace.git
- etc

## Example usage

```hcl-terraform
module "gitops_module" {
  source = "github.com/cloud-native-toolkit/terraform-gitops-serverless-operator"
  depends_on = [
    module.gitops,
    module.gitops-bootstrap
  ]

  gitops_config = module.gitops.gitops_config
  git_credentials = module.gitops.git_credentials
  server_name = module.gitops.server_name
  namespace = "openshift-operators"
  kubeseal_cert = module.gitops.sealed_secrets_cert
}
```