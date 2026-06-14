#!/bin/bash
set -e

echo "🚀 Starting Arvin VPS Server with X-UI..."

# Start SSH service
service ssh start
echo "✅ SSH started"

# Start X-UI (بدون systemd)
echo "✅ Starting X-UI Panel..."
nohup /usr/local/x-ui/x-ui > /var/log/x-ui.log 2>&1 &

# Start wetty
echo "✅ Starting Wetty on port ${PORT:-3000}..."
exec wetty \
  --port ${PORT:-3000} \
  --host 0.0.0.0 \
  --ssh-host localhost \
  --ssh-port 22 \
  --ssh-user root \
  --title "Arvin VPS + X-UI" \
  --base /
