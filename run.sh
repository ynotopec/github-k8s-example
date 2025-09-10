#!/usr/bin/env bash
set -euo pipefail

server_address=${1:-}
port_number=${2:-}
python_version=python3

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
python_dir="${HOME}/venv/$(basename "${DIR}")"
cd "${DIR}"

if [ ! -d "${python_dir}" ]; then
  "${python_version}" -m venv "${python_dir}"
fi
# shellcheck disable=SC1091
source "${python_dir}/bin/activate"

"${python_version}" -m pip install --upgrade pip setuptools wheel
"${python_version}" -m pip install --upgrade -r requirements.txt

if [ -f ".env" ]; then
  set -a
  # shellcheck disable=SC1091
  source .env
  set +a
else
  echo ".env file not found!"
  exit 1
fi

if [ -n "${server_address}" ]; then
  export HOST="${server_address}"
fi
if [ -n "${port_number}" ]; then
  export PORT="${port_number}"
fi

exec "${python_version}" app.py
