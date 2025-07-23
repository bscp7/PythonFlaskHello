from urllib import response
from flask import Flask, request, jsonify
import time
import random

app = Flask(__name__)
app.debug = True

# Global list to hold memory blocks
memory_blocks = []

@app.route('/', methods=['GET'])
def index():
    response = dict()
    response['message'] = request.headers.get('message')
    # 10% chance to simulate load
    if random.random() < 0.3:
        response['anomaly'] = simulate_random_load()

    return jsonify(response), 200

def simulate_random_load() -> dict:
    response = dict()
    load_type = random.choice(['cpu', 'memory', 'both'])
    response["load_type"] = load_type
    duration = random.randint(3, 10)
    block_size_mb = random.randint(50, 200)

    if load_type in ['cpu', 'both']:
        simulate_cpu_load(duration)
        response["duration"] = duration

    if load_type in ['memory', 'both']:
        simulate_memory_load(block_size_mb)
        response["block_size_mb"] = block_size_mb
    
    return response

def simulate_cpu_load(duration):
    end_time = time.time() + duration
    while time.time() < end_time:
        # Randomize the intensity of the CPU task
        intensity = random.randint(5000, 50000)
        [x**2 for x in range(intensity)]

def simulate_memory_load(block_size_mb):
    block = bytearray(block_size_mb * 1024 * 1024)
    memory_blocks.append(block)

if __name__ == '__main__':
    app.run(debug=True, port=8080)
