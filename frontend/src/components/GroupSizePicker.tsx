import React from "react";

interface GroupSizePickerProps {
    value: number;
    onChange: (value: number) => void;
}

const options = [
    { label: "Solo", value: 1 },
    { label: "2–3", value: 2 },
    { label: "4–6", value: 4 },
    { label: "7+", value: 7 }
];

const GroupSizePicker: React.FC<GroupSizePickerProps> = ({ value, onChange }) => {
    return (
        <div>
            <label className="block text-sm font-medium mb-1">Group size</label>

            <div className="grid grid-cols-4 gap-2">
                {options.map((opt) => {
                    const active =
                        value === opt.value ||
                        (opt.value === 2 && value > 1 && value < 4) ||
                        (opt.value === 4 && value >= 4 && value < 7) ||
                        (opt.value === 7 && value >= 7);

                    return (
                        <button
                            type="button"
                            key={opt.value}
                            onClick={() => onChange(opt.value)}
                            className={`py-2 rounded-xl text-sm font-medium transition ${
                                active
                                    ? "bg-accent text-white shadow"
                                    : "bg-latte text-gray-700 hover:bg-accent/10"
                            }`}
                        >
                            {opt.label}
                        </button>
                    );
                })}
            </div>
        </div>
    );
};

export default GroupSizePicker;
