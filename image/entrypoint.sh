
#!/bin/bash
set -euo pipefail

if [ -n "${CLOUD_INIT_CONFIG_BASE64:-}" ]; then
  echo "[ENTRYPOINT] Detected CLOUD_INIT_CONFIG_BASE64, decoding..."

  # Decode into a file (YAML or whatever you provide)
  echo "${CLOUD_INIT_CONFIG_BASE64}" | base64 -d > /tmp/cloud-init-user-data.yaml

  echo "[ENTRYPOINT] Decoded cloud-init user-data written to /tmp/cloud-init-user-data.yaml"

  # Optional: show it for debugging (remove in production)
  echo "--------------------------------------"
  cat /tmp/cloud-init-user-data.yaml || true
  echo "--------------------------------------"

  # Here you could parse and apply it (e.g. run shell commands inside)
  # Example: if it's just a shell script instead of YAML:
  # chmod +x /tmp/cloud-init-user-data.yaml
  # /tmp/cloud-init-user-data.yaml
fi

echo "[ENTRYPOINT] Starting main process: $*"
exec "$@"
