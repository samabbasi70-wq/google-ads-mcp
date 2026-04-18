FROM python:3.12-slim

WORKDIR /app

RUN pip install --no-cache-dir uv

COPY . .

RUN uv sync --frozen || uv sync

ENV GOOGLE_ADS_MCP_BASE_URL=http://0.0.0.0:8000

EXPOSE 8000

CMD ["sh", "-c", "uv run python -m ads_mcp.server"]
