import os

from flask import Flask, request, jsonify, send_from_directory
from flask_cors import CORS
from pyswip import Prolog

app = Flask(__name__, static_folder="../frontend/build")
CORS(app)

prolog = Prolog()
prolog.consult("cafes.pl")


def clear_preferences():
    list(prolog.query("clear_prefs."))


def assert_fact(fact: str):
    list(prolog.query(f"set_pref({fact})"))


def clear_context():
    list(prolog.query("clear_context"))


def assert_attribute(predicate: str, value):
    """
    Sets a single-value attribute (intent, mood, weather).
    Wraps string values in quotes to ensure valid Prolog atoms.
    """
    # If value is a string, wrap in quotes for Prolog; otherwise keep as is (int/float)
    val_str = f"'{value}'" if isinstance(value, str) else str(value)

    # Calls: set_attribute(user_intent, 'work')
    query = f"set_attribute({predicate}, {val_str})"
    list(prolog.query(query))


def assert_pref(key: str, value):
    """
    Sets a user_pref pair.
    """
    val_str = f"'{value}'" if isinstance(value, str) else str(value)

    # Calls: set_pref('wifi', 'true')
    query = f"set_pref('{key}', {val_str})"
    list(prolog.query(query))


@app.route("/recommend", methods=["POST"])
def recommend():
    data = request.json

    clear_context()

    # ---- 1. Handle Single-Value Attributes ----
    # Map JSON keys to Prolog predicates
    attribute_map = {
        "intent": "user_intent",
        "mood": "user_mood",
        "group_size": "group_size",
        "weather": "weather",
        "duration": "stay_duration"
    }

    for json_key, prolog_pred in attribute_map.items():
        if json_key in data:
            assert_attribute(prolog_pred, data[json_key])

    # ---- 2. Handle Dictionary Preferences ----
    prefs = data.get("preferences", {})
    for key, value in prefs.items():
        assert_pref(key, value)

    # ---- 3. Query ----
    results = list(prolog.query("recommended_sorted(R)"))

    if not results:
        return jsonify({"recommendations": []})

    cafes = [str(cafe) for cafe in results[0]["R"]]

    return jsonify({
        "recommendations": cafes
    })

@app.route("/health", methods=["GET"])
def health():
    return jsonify({"status": "ok"})


@app.route("/", defaults={"path": ""})
@app.route("/<path:path>")
def serve(path):
    if path != "" and os.path.exists(os.path.join(app.static_folder, path)):
        return send_from_directory(app.static_folder, path)
    return send_from_directory(app.static_folder, "index.html")


if __name__ == "__main__":
    port = int(os.environ.get("PORT", 5000))
    app.run(host="0.0.0.0", port=port, debug=True)
