import React from "react";

interface Props {
    value: "short" | "long" | "dont_care";
    onChange: (v: "short" | "long" | "dont_care") => void;
}

const options = [
    { value: "dont_care", label: "Doesn't matter" },
    { value: "short", label: "Quick visit (≤ 1h)" },
    { value: "long", label: "Long stay (2h+)" }
] as const;

const DurationPicker: React.FC<Props> = ({ value, onChange }) => {
    return (
        <div>
            <label className="block text-sm font-medium mb-1">How long?</label>
            <div className="grid grid-cols-3 gap-2">
                {options.map((opt) => (
                    <button
                        key={opt.value}
                        type="button"
                        onClick={() => onChange(opt.value)}
                        className={`px-3 py-2 rounded-xl border text-sm ${
                            value === opt.value
                                ? "bg-accent text-white border-accent"
                                : "bg-white"
                        }`}
                    >
                        {opt.label}
                    </button>
                ))}
            </div>
        </div>
    );
};

export default DurationPicker;
