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


def add_preference(key, value):
    # Strings need quotes in Prolog
    if isinstance(value, str):
        value = value.lower()
        prolog.assertz(f"user_pref({key}, {value})")
    else:
        prolog.assertz(f"user_pref({key}, {value})")


@app.route("/recommend", methods=["POST"])
def recommend():
    """
    Expected JSON:
    {
      "computer_friendly": "yes",
      "budget": "medium",
      "max_walk_time": "short",
      "start_hour": 9.0,
      "end_hour": 18.0,
      "meal_type": "coffee",
      "noise_level": "quiet",
      "outdoor_seating": "dont_care"
    }
    """

    data = request.json

    clear_preferences()

    for key, value in data.items():
        add_preference(key, value)

    results = []
    for solution in prolog.query("recommend(P)."):
        results.append(solution["P"])

    return jsonify({
        "recommendations": results
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
