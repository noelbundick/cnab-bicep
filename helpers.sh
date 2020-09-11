#!/usr/bin/env bash
set -euo pipefail

build() {
  bicep build bicep/vm.bicep
}

upgrade() {
  echo Simulated upgrade
}

uninstall() {
  echo Simulated uninstall
}

# Call the requested function and pass the arguments as-is
"$@"
