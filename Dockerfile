FROM python:3.12-slim

WORKDIR /app

RUN pip install --no-cache-dir uv

COPY . .

RUN uv sync --frozen || uv sync

EXPOSE 8000

CMD ["sh", "-c", "uv run python -m ads_mcp.server --transport streamable-http --host 0.0.0.0 --port ${PORT:-8000}"]
