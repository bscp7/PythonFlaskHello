# Python Flask Hello

Small python server that reads user cookie named `name` and greets the user.

```bash
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
