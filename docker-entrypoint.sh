#!/bin/bash
set -e

# 验证工具安装
echo "Verifying installed tools..."
php -v
composer --version
vim --version
curl --version
echo "All tools verified successfully."
echo ""

# 执行传入的命令
exec "$@"

