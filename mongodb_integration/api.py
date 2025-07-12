from flask import Flask, request, jsonify
import pandas as pd
from mongo_config import get_database
from models.data_model import create_transaction_document, create_passage_document

app = Flask(__name__)
db = get_database()

@app.route("/upload/transaction", methods=["POST"])
def upload_transaction():
    file = request.files["file"]
    df = pd.read_excel(file)
    docs = [create_transaction_document(row) for index, row in df.iterrows()]
    db.transactions.insert_many(docs)
    return jsonify({"status": "uploaded", "count": len(docs)})

@app.route("/upload/passage", methods=["POST"])
def upload_passage():
    file = request.files["file"]
    df = pd.read_excel(file)
    docs = [create_passage_document(row) for index, row in df.iterrows()]
    db.passages.insert_many(docs)
    return jsonify({"status": "uploaded", "count": len(docs)})

if __name__ == "__main__":
    app.run(debug=True)

