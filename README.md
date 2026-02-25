## terraform-labs

### Prerequisites

- Install mise: https://mise.jdx.dev/getting-started.html

### One-time shell setup

Add mise activation to bash so tools from `mise.toml` are available in every new terminal:

```bash
echo 'eval "$(mise activate bash)"' >> ~/.bashrc
source ~/.bashrc
```

### Install and verify tools

From this repository:

```bash
mise install
mise current
terraform version
aws --version
```

If `terraform` is still not found, open a new terminal and run:

```bash
source ~/.bashrc
```

### AWS commands

Configure AWS credentials/profile using the task in `mise.toml`:

```bash
mise run aws:configure
mise run aws:whoami
```

Or run AWS CLI directly through mise without relying on shell activation:

```bash
mise exec aws-cli -- aws --version
mise exec aws-cli -- aws configure
```

### Terraform tasks

Run tasks defined in `mise.toml`:

```bash
mise run terraform:init
mise run terraform:plan
mise run terraform:apply
mise run terraform:destroy
mise run terraform:validate
mise run terraform:validate-ci
mise run terraform:fmt
mise run checkov:scan
mise run check
mise run check:ci
```

### Security checks policy

- Prefer fixing findings instead of suppressing checks.
- If suppression is required, scope it to specific check IDs and document rationale in the PR.
- Keep suppressions minimal, time-bound, and reviewed regularly.
- Checkov policy is configured in `.checkov.yml`; TFLint policy is configured in `.tflint.hcl`.

### Remote state (S3 backend)

`infra/backend.tf` uses an S3 backend with runtime backend config.

Set these GitHub repository or environment variables before running deploy/destroy workflows:

- `TF_STATE_BUCKET` (required): S3 bucket name for Terraform state.
- `TF_STATE_PREFIX` (optional): Prefix under the bucket. Defaults to GitHub repository name.
- `AWS_ROLE_TO_ASSUME` (required): IAM role ARN for OIDC auth.

For this repository, set `TF_STATE_BUCKET=tfstate-llewandowski`.

Locking is configured with S3 native lockfiles (`use_lockfile=true`), so no DynamoDB table is required.

Bucket requirements (configure on the S3 bucket itself):

- Versioning enabled.
- Default encryption enabled (SSE-S3 or SSE-KMS).

State key path is set by prefix + workflow input environment:

- `<prefix>/dev/terraform.tfstate`
- `<prefix>/staging/terraform.tfstate`
- `<prefix>/prod/terraform.tfstate`

Where `<prefix>` is `TF_STATE_PREFIX` if set, otherwise the GitHub repo name (for example `terraform-labs`).

### Re-enable strict TFLint rules

Re-enable these rules in `.tflint.hcl` when the scaffold grows into real infrastructure:

- `terraform_unused_declarations`: re-enable once locals/variables are actively consumed by resources or modules.
- `terraform_unused_required_providers`: re-enable once `required_providers` only lists providers used in code.
- Run `mise run check` after re-enabling to verify no regressions.
