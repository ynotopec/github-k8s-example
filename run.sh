#!/bin/bash

serverAddress=$1
portNumber=$2

pythonVersion=python${PYTHON_VERSION:-3}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pythonDir=~/"venv/$(basename "${DIR}")"
cd $DIR

deactivate 2>/dev/null
mkdir -p "${pythonDir}"
${pythonVersion} -m venv "${pythonDir}"
source "${pythonDir}"/bin/activate

#intall
${pythonVersion} -m pip cache purge
${pythonVersion} -m pip install -U pip
${pythonVersion} -m pip install -U -r requirements.txt
#optimize space
(jdupes -X size+:99M -r -L ~ >/dev/null 2>&1 )&

export OPENAI_API_MODEL="vicuna"
export OPENAI_API_BASE="https://api-ai.numerique-interieur.com/v1"
export OPENAI_API_KEY="sk-1234"

[ ! -z "${serverAddress}" ] && export GRADIO_SERVER_NAME="${serverAddress}"
[ ! -z "${portNumber}" ] && export GRADIO_SERVER_PORT="${portNumber}"
export CUDA_LAUNCH_BLOCKING=1

${pythonVersion} app.py
#${pythonVersion} -m streamlit run app.py --browser.gatherUsageStats false $([ ! -z "${serverAddress}" ] && echo --server.address ${serverAddress}) $([ ! -z "${portNumber}" ] && echo --server.port ${portNumber})
#${pythonVersion} -m uvicorn app:app --reload $([ ! -z "${serverAddress}" ] && echo --host ${serverAddress}) $([ ! -z "${portNumber}" ] && echo --port ${portNumber})
