# Python Flask Hello

Small python server that reads header `name` and returns JSON response with `name` in it.

```bash
# Run Unit Tests

python -m pytest -v    

# Run

python app/main.py

# Test
curl http://localhost:8080/
curl http://localhost:8080/ -H "name: Bhavesh"

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
