import React, { useState, FormEvent } from "react";
import PrettySelect from "./components/PrettySelect";
import DurationPicker from "./components/DurationPicker";
import TimeRangeSlider from "./components/TimeRangeSlider";

/* ================= TYPES ================= */

type Intent = "work" | "relax" | "meet_friends" | "quick_coffee";
type Mood = "neutral" | "tired" | "focused" | "social";
type Weather = "dont_care" | "sunny" | "rainy";
type Duration = "short" | "long" | "dont_care";

type Budget = "low" | "medium" | "high";
type WalkTime = "short" | "medium" | "long";
type Noise = "quiet" | "moderate" | "lively";
type YesNo = "yes" | "no";
type Outdoor = "yes" | "no" | "dont_care";

/* ================= OPTIONS ================= */

const intentOptions: Intent[] = [
  "work",
  "relax",
  "meet_friends",
  "quick_coffee"
];

const moodOptions: Mood[] = ["neutral", "tired", "focused", "social"];
const weatherOptions: Weather[] = ["dont_care", "sunny", "rainy"];
const budgetOptions: Budget[] = ["low", "medium", "high"];
const walkOptions: WalkTime[] = ["short", "medium", "long"];
const noiseOptions: Noise[] = ["quiet", "moderate", "lively"];
const yesNoOptions: YesNo[] = ["yes", "no"];
const outdoorOptions: Outdoor[] = ["dont_care", "yes", "no"];
const mealOptions = ["coffee", "bakery", "breakfast", "brunch", "lunch"];

/* ================= APP ================= */

const App: React.FC = () => {
  const [intent, setIntent] = useState<Intent>("work");
  const [mood, setMood] = useState<Mood>("neutral");
  const [weather, setWeather] = useState<Weather>("dont_care");
  const [duration, setDuration] = useState<Duration>("dont_care");
  const [groupSize, setGroupSize] = useState(1);

  const [form, setForm] = useState({
    budget: "medium" as Budget,
    meal_type: "coffee",
    computer_friendly: "yes" as YesNo,
    max_walk_time: "short" as WalkTime,
    noise_level: "quiet" as Noise,
    outdoor_seating: "dont_care" as Outdoor,
    start_hour: 9,
    end_hour: 18
  });

  const [recommendations, setRecommendations] = useState<string[]>([]);
  const [loading, setLoading] = useState(false);

  /* ======== BRANCHING LOGIC ======== */

  const showComputer =
      intent === "work" || duration === "long" || mood === "focused";

  const showNoise =
      intent !== "quick_coffee" || mood === "tired" || mood === "social";

  const showOutdoor =
      intent === "relax" || weather === "sunny" || mood === "social";

  const showWalk =
      intent === "quick_coffee" || mood === "tired";

  /* ======== SUBMIT ======== */

  const submit = async (e: FormEvent) => {
    e.preventDefault();
    setLoading(true);

    const preferences: Record<string, any> = {
      budget: form.budget,
      meal_type: form.meal_type,
      start_hour: form.start_hour,
      end_hour: form.end_hour
    };

    if (showComputer) preferences.computer_friendly = form.computer_friendly;
    if (showNoise) preferences.noise_level = form.noise_level;
    if (showOutdoor) preferences.outdoor_seating = form.outdoor_seating;
    if (showWalk) preferences.max_walk_time = form.max_walk_time;

    const payload = {
      intent,
      mood: mood !== "neutral" ? mood : undefined,
      weather: weather !== "dont_care" ? weather : undefined,
      duration: duration !== "dont_care" ? duration : undefined,
      group_size: groupSize,
      preferences
    };

    const res = await fetch("http://localhost:5000/recommend", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(payload)
    });

    const data = await res.json();
    setRecommendations(Array.from(new Set(data.recommendations || [])));
    setLoading(false);
  };

  /* ======== UI ======== */

  return (
      <div className="min-h-screen bg-crema p-6">
        <div className="max-w-4xl mx-auto grid md:grid-cols-2 gap-6">
          {/* FORM */}
          <form onSubmit={submit} className="bg-white rounded-3xl p-6 shadow-xl space-y-4">
            <h1 className="text-2xl font-bold">☕ Smart Café Finder</h1>

            <PrettySelect label="Intent" value={intent} options={intentOptions} onChange={(v) => setIntent(v as Intent)} />
            <PrettySelect label="Mood" value={mood} options={moodOptions} onChange={(v) => setMood(v as Mood)} />
            <PrettySelect label="Weather" value={weather} options={weatherOptions} onChange={(v) => setWeather(v as Weather)} />

            <DurationPicker value={duration} onChange={setDuration} />

            <PrettySelect label="Budget" value={form.budget} options={budgetOptions} onChange={(v) => setForm(p => ({ ...p, budget: v as Budget }))} />
            <PrettySelect label="Meal" value={form.meal_type} options={mealOptions} onChange={(v) => setForm(p => ({ ...p, meal_type: v }))} />

            {showComputer && (
                <PrettySelect label="Computer friendly?" value={form.computer_friendly} options={yesNoOptions} onChange={(v) => setForm(p => ({ ...p, computer_friendly: v as YesNo }))} />
            )}

            {showWalk && (
                <PrettySelect label="Max walk time" value={form.max_walk_time} options={walkOptions} onChange={(v) => setForm(p => ({ ...p, max_walk_time: v as WalkTime }))} />
            )}

            {showNoise && (
                <PrettySelect label="Noise level" value={form.noise_level} options={noiseOptions} onChange={(v) => setForm(p => ({ ...p, noise_level: v as Noise }))} />
            )}

            {showOutdoor && (
                <PrettySelect label="Outdoor seating" value={form.outdoor_seating} options={outdoorOptions} onChange={(v) => setForm(p => ({ ...p, outdoor_seating: v as Outdoor }))} />
            )}

            <TimeRangeSlider
                start={form.start_hour}
                end={form.end_hour}
                onChange={(s, e) => setForm(p => ({ ...p, start_hour: s, end_hour: e }))}
            />

            <button className="w-full bg-accent text-white py-3 rounded-2xl font-semibold">
              {loading ? "Finding cafés..." : "Find cafés"}
            </button>
          </form>

          {/* RESULTS */}
          <div className="bg-white rounded-3xl p-6 shadow-xl">
            <h2 className="text-xl font-bold mb-4">Recommendations</h2>
            {recommendations.length === 0 ? (
                <p className="text-gray-500">No results yet.</p>
            ) : (
                <ul className="space-y-3">
                  {recommendations.map((cafe, i) => (
                      <li key={cafe} className="p-4 bg-latte rounded-2xl">
                        <div className="font-semibold capitalize">{cafe.replace("_", " ")}</div>
                        <div className="text-xs text-gray-600">Rank #{i + 1}</div>
                      </li>
                  ))}
                </ul>
            )}
          </div>
        </div>
      </div>
  );
};

export default App;
