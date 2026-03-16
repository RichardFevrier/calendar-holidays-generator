set dotenv-load

setup:
  git config core.hooksPath .githooks
  chmod +x .githooks/pre-commit

odinBuildCmd *args:
  odin build src -out:$(basename $PWD) {{args}}

dev:
  @just odinBuildCmd -debug -o:none

prod:
  @just odinBuildCmd -o:speed

format:
  find . -name "*.nix" | xargs nixfmt
