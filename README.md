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
mise run terraform:format
```
