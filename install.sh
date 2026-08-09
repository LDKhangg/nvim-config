#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: install.sh [--bootstrap] [--force]

  --bootstrap  Install the first-run init.lua bootstrap template
  --force      Back up any existing config before installing
EOF
}

mode="symlink"
force=0

while [ $# -gt 0 ]; do
  case "$1" in
    --bootstrap)
      mode="bootstrap"
      ;;
    --force)
      force=1
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      printf 'Unknown argument: %s\n' "$1" >&2
      usage >&2
      exit 1
      ;;
  esac
  shift
done

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
backup_dir="${config_dir}.bak.$(date +%Y%m%d-%H%M%S)"
bootstrap_file="$repo_root/bootstrap/init.lua"

backup_existing() {
  if [ -e "$config_dir" ] || [ -L "$config_dir" ]; then
    if [ "$force" -ne 1 ]; then
      printf 'Refusing to overwrite %s. Re-run with --force.\n' "$config_dir" >&2
      exit 1
    fi

    mv "$config_dir" "$backup_dir"
    printf 'Backed up existing config to %s\n' "$backup_dir"
  fi
}

if [ "$mode" = "symlink" ]; then
  if [ "$config_dir" = "$repo_root" ]; then
    printf 'This repo is already installed at %s\n' "$config_dir"
    exit 0
  fi

  backup_existing
  mkdir -p "$(dirname "$config_dir")"
  ln -s "$repo_root" "$config_dir"
  printf 'Linked %s -> %s\n' "$config_dir" "$repo_root"
  exit 0
fi

if [ ! -f "$bootstrap_file" ]; then
  printf 'Missing bootstrap template: %s\n' "$bootstrap_file" >&2
  exit 1
fi

backup_existing
mkdir -p "$config_dir"
install -m 0644 "$bootstrap_file" "$config_dir/init.lua"
printf 'Installed bootstrap init.lua to %s\n' "$config_dir/init.lua"
