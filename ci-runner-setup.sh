#!/usr/bin/env bash
set -euo pipefail
echo "==> Docker socket permissions..."
[ -S /var/run/docker.sock ] && chmod 666 /var/run/docker.sock || true
echo "==> Pulling CI image..."
docker pull catthehacker/ubuntu:act-22.04 || true
echo "==> git safe.directory..."
git config --global --add safe.directory '*' 2>/dev/null || true
echo "==> Done."
