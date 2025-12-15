import React from "react";

interface Props {
    start: number;
    end: number;
    onChange: (s: number, e: number) => void;
    min?: number;
    max?: number;
}

const formatHour = (hour: number) => {
    // hour is like 9 or 17.5
    const h = Math.floor(hour);
    const m = Math.round((hour - h) * 60);
    const mm = m === 0 ? "00" : (m === 30 ? "30" : String(m).padStart(2, "0"));
    return `${h}:${mm}`;
};

const TimeRangeSlider: React.FC<Props> = ({ start, end, onChange, min = 7, max = 22 }) => {
    return (
        <div>
            <label className="block text-sm font-medium mb-2">Time range</label>

            <div className="flex justify-between text-xs text-gray-500 mb-2">
                <span>{formatHour(start)}</span>
                <span>{formatHour(end)}</span>
            </div>

            <div className="space-y-2">
                <input
                    type="range"
                    min={min}
                    max={max}
                    step={0.5}
                    value={start}
                    onChange={(e) => {
                        const s = Number(e.target.value);
                        // ensure start <= end
                        onChange(s, Math.max(s, end));
                    }}
                    className="w-full"
                />

                <input
                    type="range"
                    min={min}
                    max={max}
                    step={0.5}
                    value={end}
                    onChange={(e) => {
                        const eVal = Number(e.target.value);
                        // ensure start <= end
                        onChange(Math.min(start, eVal), eVal);
                    }}
                    className="w-full"
                />
            </div>
        </div>
    );
};

export default TimeRangeSlider;
