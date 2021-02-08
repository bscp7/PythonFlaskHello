from flask import Flask, render_template, request
app = Flask(__name__)

@app.route('/', methods = ['GET'])
def main():
    name = request.headers.get('name')
    name = 'World' if not name else name
    return render_template('index.html', name=name)

if __name__ == '__main__':
    app.run(debug=True, port=9000)
