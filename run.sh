
if [ ! -d "venv" ]; then
    echo "创建虚拟环境"
    if ! command -v uv &> /dev/null; then
        echo "uv 未安装，尝试安装"
        curl -LsSf https://astral.sh/uv/install.sh | sh
    fi
    uv venv --seed --python 3.13 venv
    source venv/bin/activate
    uv pip install -r requirements.txt
fi

HF_ENDPOINT=https://hf-mirror.com HF_HOME=data/hf_data NLTK_DATA=data/nltk_data OPENAI_API_KEY=sk-1212 OPENAI_API_BASE=http://20.66.31.2:12013/v1 python test_advanced.py --model Qwen3-30B-A3B --output output1.json --ratio 0.1 --backend openai
# HF_ENDPOINT=https://hf-mirror.com HF_HOME=data/hf_data NLTK_DATA=data/nltk_data OPENAI_API_KEY=sk-1212 OPENAI_API_BASE=http://127.0.0.1:1234/v1 python test_advanced.py --model lmstudio-community/Qwen3-0.6B-MLX-bf16 --output output1.json --ratio 0.1 --backend openai