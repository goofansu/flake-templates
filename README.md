# nix-templates

## Install

```shell
nix registry add goofansu/templates git+https://git.sr.ht/~goofansu/nix-templates
```

## Usage

In your project, init Nix flakes template with the command:

- Default template

```shell
nix flake init -t goofansu/templates
```

- Specific template

```shell
nix flake init -t goofansu/templates#rails_postgres
```
