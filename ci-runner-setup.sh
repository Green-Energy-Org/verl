#!/usr/bin/env bash
# [ci-fixer] Runner environment setup — run once on your self-hosted runner host
set -euo pipefail

echo "==> Ensuring Docker socket permissions..."
if [ -S /var/run/docker.sock ]; then
  chmod 666 /var/run/docker.sock || sudo chmod 666 /var/run/docker.sock
fi

echo "==> Pulling default CI image..."
docker pull catthehacker/ubuntu:act-22.04 || true

echo "==> Setting up git safe directory..."
git config --global --add safe.directory '*' 2>/dev/null || true

echo "==> Done. Runner is ready."
