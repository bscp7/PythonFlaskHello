from flask import Flask, request, jsonify
app = Flask(__name__)

@app.route('/', methods = ['GET'])
def index():
    name = request.headers.get('name')
    name = 'anonymous' if not name else name
    r = jsonify({
        'user': name
    })
    r.status_code = 200
    return r

if __name__ == '__main__':
    app.run(debug=True, port=8080)
