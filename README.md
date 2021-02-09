# Python Flask Hello

Small python server that reads header `name` and returns JSON response with `name` in it.

```bash
# Run Unit Tests

python -m pytest -v    

# Run

python app/main.py

# Test
curl http://localhost:9000/
curl http://localhost:9000/ -H "name: Bhavesh"

# Build Docker image

docker build -f Dockerfile -t pythonflaskhello:latest .

# Create Docker container

docker run --rm -p 9000:9000 --name hello pythonflaskhello:latest
```
