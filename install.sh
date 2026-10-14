#!/bin/bash
# PimeraX Open Super Compression 一键安装脚本
# 只装 PRX 压缩工具（纯 Python），不含 C++ 框架。
# 需要 C++ 推理框架请去 PimeraX 仓：github.com/aniso199191/PimeraX

set -e
DIR="$(cd "$(dirname "$0")" && pwd)"
echo "=== PimeraX Open Super Compression 安装 ==="

# 1. Python 依赖
echo "[1/2] 检查 Python 依赖..."
if command -v python3 &>/dev/null; then
    python3 -c "import zstandard" 2>/dev/null && echo "  ✔ zstandard 已有" || {
        pip3 install zstandard 2>/dev/null && echo "  ✔ zstandard 已装" || echo "  ⚠ zstandard 装不上，xz 兜底仍可用"
    }
    python3 -c "import torch" 2>/dev/null && echo "  ✔ torch 已有" || echo "  ⚠ torch 未装（转 .pt 需要它）"
else
    echo "  ✗ 需要 python3"
    exit 1
fi

# 2. 验证
echo "[2/2] 验证..."
python3 "$DIR/prx.py" 2>&1 | head -2

echo ""
echo "=== 安装完成 ==="
echo "用法:"
echo "  python3 prx.py 转 <模型.pt> <输出.prx>   # 量化+压缩"
echo "  python3 prx.py 压 <模型.prx> <输出.prx.sc> # 超压缩"
echo "  python3 prx.py 解 <压缩.prx.sc> <还原.prx> # 解压"
