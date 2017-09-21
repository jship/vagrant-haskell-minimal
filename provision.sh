#!/bin/bash -e
#set -e -x

# Portions of this provisioning script are modeled after the scripts from the
# 'haskell-vim-now' project: https://github.com/begriffs/haskell-vim-now

msg() { echo -e "--- $@" ; }
err() { echo -e "*** $@" 1>&2; }
exit_err() {
  err ${1}
  err "Aborting..."
  exit 1
}

check_exist() {
  local not_exist=()
  for prg; do
    if ! command -v ${prg} >/dev/null 2>&1; then
      not_exist+=("${prg}")
    fi
  done
  echo ${not_exist[@]}
  return ${#not_exist[@]}
}

package_install() {
  if [ $# -eq 0 ]; then
    msg "No new packages needed for install..."
    return
  fi
  msg "Updating package list for apt-get..."
  apt-get update || true
  msg "Installing system packages [$*] using apt-get..."
  apt-get install -y $*
}

provision() {
  local PKGS_TO_INSTALL=$(check_exist git vim curl)
  if [ ! -z "${PKGS_TO_INSTALL}" ]; then
    package_install ${PKGS_TO_INSTALL}
  fi
  curl -sSL https://get.haskellstack.org/ > /tmp/install_stack.sh
  bash /tmp/install_stack.sh -q
  msg "Wewt - provision completed successfully!"
}

main() {
  provision
  exit 0
}

main
exit_err "Boo... provision failed!"
