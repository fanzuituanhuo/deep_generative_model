#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")" && pwd)"
TEX_DIR="$ROOT/tex"
PDF_DIR="$ROOT/pdf"

usage() {
  cat <<'EOF'
用法:
  ./build.sh              # 编译 tex/ 下全部章节
  ./build.sh <name>.tex   # 编译指定章节（可省略 .tex 后缀）

示例:
  ./build.sh chap5_diffusion_model
  ./build.sh chapter4_score_based_en.tex
EOF
}

compile_one() {
  local name="$1"
  name="${name%.tex}"
  local src="$TEX_DIR/${name}.tex"

  if [[ ! -f "$src" ]]; then
    echo "错误: 找不到源文件 $src" >&2
    exit 1
  fi

  echo "==> 编译 $name"
  (
    cd "$TEX_DIR"
    xelatex -interaction=nonstopmode "$name.tex" >/dev/null
    xelatex -interaction=nonstopmode "$name.tex" >/dev/null
    mv -f "${name}.pdf" "$PDF_DIR/"
    rm -f "${name}.aux" "${name}.log" "${name}.out"
  )
  echo "    输出: $PDF_DIR/${name}.pdf"
}

if [[ "${1:-}" == "-h" || "${1:-}" == "--help" ]]; then
  usage
  exit 0
fi

mkdir -p "$PDF_DIR"

if [[ $# -eq 0 ]]; then
  for src in "$TEX_DIR"/*.tex; do
    compile_one "$(basename "$src")"
  done
else
  compile_one "$1"
fi

echo "完成。"
