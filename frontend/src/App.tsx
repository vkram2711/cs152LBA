import React, { useState, FormEvent } from "react";
import TimeRangeSlider from "./components/TimeRangeSlider";
import PrettySelect from "./components/PrettySelect";

/* ======================
   Types
====================== */

type Budget = "low" | "medium" | "high";
type WalkTime = "short" | "medium" | "long";
type NoiseLevel = "quiet" | "moderate" | "lively";
type YesNo = "yes" | "no";
type DontCareYesNo = "yes" | "no" | "dont_care";

interface Preferences {
  computer_friendly: YesNo;
  budget: Budget;
  max_walk_time: WalkTime;
  start_hour: number;
  end_hour: number;
  meal_type: string;
  noise_level: NoiseLevel;
  outdoor_seating: DontCareYesNo;
}

interface RecommendationResponse {
  recommendations: string[];
}

interface SelectField {
  label: string;
  name: keyof Preferences;
  options: string[];
}

/* ======================
   Fields Metadata
====================== */

const selectFields: SelectField[] = [
  { label: "Computer Friendly", name: "computer_friendly", options: ["yes", "no"] },
  { label: "Budget", name: "budget", options: ["low", "medium", "high"] },
  { label: "Max Walk Time", name: "max_walk_time", options: ["short", "medium", "long"] },
  { label: "Meal Type", name: "meal_type", options: ["coffee", "bakery", "breakfast", "brunch", "lunch"] },
  { label: "Noise Level", name: "noise_level", options: ["quiet", "moderate", "lively"] },
  { label: "Outdoor Seating", name: "outdoor_seating", options: ["dont_care", "yes", "no"] }
];

/* ======================
   App Component
====================== */

const App: React.FC = () => {
  const [form, setForm] = useState<Preferences>({
    computer_friendly: "yes",
    budget: "medium",
    max_walk_time: "short",
    start_hour: 9,
    end_hour: 18,
    meal_type: "coffee",
    noise_level: "quiet",
    outdoor_seating: "dont_care"
  });

  const [recommendations, setRecommendations] = useState<string[]>([]);
  const [loading, setLoading] = useState(false);

  const submitForm = async (e: FormEvent) => {
    e.preventDefault();
    setLoading(true);

    try {
      const res = await fetch("http://localhost:5000/recommend", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(form)
      });
      const data: RecommendationResponse = await res.json();
      setRecommendations([...new Set(data.recommendations)]); // deduplicate
    } finally {
      setLoading(false);
    }
  };

  return (
      <div className="min-h-screen flex items-center justify-center bg-crema p-6">
        <div className="max-w-4xl w-full grid md:grid-cols-2 gap-8">

          {/* LEFT: Form */}
          <div className="bg-white rounded-3xl shadow-xl p-8">
            <h1 className="text-3xl font-bold mb-2">☕ Café Finder</h1>
            <p className="text-gray-500 mb-6">
              Find your perfect Buenos Aires café
            </p>

            <form onSubmit={submitForm} className="space-y-4">
              {selectFields.map((field) => (
                  <PrettySelect
                      key={field.name}
                      label={field.label}
                      value={String(form[field.name])}
                      options={field.options}
                      onChange={(val) =>
                          setForm((prev) => ({
                            ...prev,
                            [field.name]: val
                          }))
                      }
                  />
              ))}

              <TimeRangeSlider
                  start={form.start_hour}
                  end={form.end_hour}
                  onChange={(start, end) =>
                      setForm((prev) => ({ ...prev, start_hour: start, end_hour: end }))
                  }
              />

              <button
                  type="submit"
                  disabled={loading}
                  className="w-full mt-4 bg-accent hover:bg-mocha text-white font-semibold py-3 rounded-2xl transition"
              >
                {loading ? "Brewing..." : "Find Cafés"}
              </button>
            </form>
          </div>

          {/* RIGHT: Recommendations */}
          <div className="bg-white rounded-3xl shadow-xl p-8">
            <h2 className="text-2xl font-bold mb-4">Recommendations</h2>
            {recommendations.length === 0 ? (
                <p className="text-gray-500">
                  No cafés yet. Adjust preferences and search again.
                </p>
            ) : (
                <ul className="space-y-4">
                  {recommendations.map((cafe) => (
                      <li
                          key={cafe}
                          className="p-5 rounded-2xl bg-gradient-to-r from-latte to-crema shadow-md flex items-center justify-between"
                      >
                  <span className="text-lg font-semibold capitalize">
                    {cafe.replace("_", " ")}
                  </span>
                        <span className="text-sm text-gray-500">Recommended</span>
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
