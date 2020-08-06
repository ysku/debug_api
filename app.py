from flask import Flask
from flask import request
from flask import jsonify


app = Flask(__name__)


@app.route('/', defaults={'path': ''})
@app.route('/<path:path>')
def catch_all(path):
    headers = dict(request.headers)
    summary = {
        "headers": headers,
        "path": path,
    }
    app.logger.info(summary)
    return jsonify(summary)
