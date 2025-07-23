# Python Flask Hello

Small python server that reads header named `message` and returns JSON response with `message` in it. It also adds memory and cpu spikes that can help us see random usage metrics.

```bash
# Run Unit Tests

python -m pytest -v

# Run

uv run gunicorn -b :8080 app.main:app --reload

# Test
curl http://localhost:8080/
curl http://localhost:8080/ -H "message: lets ask LLM"

# Build Docker image

docker build -f Dockerfile -t pythonflaskhello:latest .

# Create Docker container

docker run --rm -p 8080:8080 --name hello pythonflaskhello:latest
```

# Create CI pipelines

```bash
oc apply -f .tekton/
```

# Troubleshooting

```bash
oc logs deployment/el-github-listener -c event-listener
```
