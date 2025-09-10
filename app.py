import os
from flask import Flask

app = Flask(__name__)


@app.route('/')
def hello_world():
    """Return a greeting message.

    The message can be customized by setting the ``MESSAGE`` environment
    variable. If it is not set, ``"Hello, World!"`` is used by default.
    """
    return os.getenv("MESSAGE", "Hello, World!")


if __name__ == '__main__':
    host = os.getenv("HOST", "0.0.0.0")
    port = int(os.getenv("PORT", "5000"))
    app.run(host=host, port=port)
