terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "llewandowski"

    workspaces {
      name = "my-aws-app"
    }
  }
}