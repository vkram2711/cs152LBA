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
    list(prolog.query(f"assertz({fact})"))


def clear_context():
    list(prolog.query("clear_context"))


@app.route("/recommend", methods=["POST"])
def recommend():
    data = request.json
    clear_context()

    # ---- Intent ----
    if "intent" in data:
        assert_fact(f"user_intent({data['intent']})")

    # ---- Mood ----
    if "mood" in data:
        assert_fact(f"user_mood({data['mood']})")

    # ---- Group size ----
    if "group_size" in data:
        assert_fact(f"group_size({data['group_size']})")

    # ---- Weather ----
    if "weather" in data:
        assert_fact(f"weather({data['weather']})")

    # ---- Duration ----
    if "duration" in data:
        assert_fact(f"stay_duration({data['duration']})")

    # ---- Explicit preferences ----
    prefs = data.get("preferences", {})
    for key, value in prefs.items():
        assert_fact(f"user_pref({key}, {value})")

    # ---- Query recommendations ----
    results = list(prolog.query("recommended_sorted(R)"))

    if not results:
        return jsonify({"recommendations": []})

    cafes = results[0]["R"]

    # Convert Prolog atoms to strings
    cafes = [str(cafe) for cafe in cafes]

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
