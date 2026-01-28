FROM python:3.12-slim

ENV WORKDIR=/data

RUN pip install --no-cache-dir mcp-streamablehttp-proxy mcp-python-interpreter

EXPOSE 8080

CMD ["bash","-lc", "\
  mkdir -p ${WORKDIR} && \
  mcp-streamablehttp-proxy --host 0.0.0.0 --port ${PORT:-8080} \
    mcp-python-interpreter --dir ${WORKDIR} \
"]
