import React from "react";

interface TimeRangeProps {
    start: number;
    end: number;
    onChange: (start: number, end: number) => void;
}

const formatHour = (hour: number) => {
    const h = Math.floor(hour);
    const m = (hour - h) * 60;
    return `${h}:${m === 0 ? "00" : "30"}`;
};

const TimeRangeSlider: React.FC<TimeRangeProps> = ({ start, end, onChange }) => {
    return (
        <div>
            <label className="block text-sm font-medium mb-2">Time Range</label>

            <div className="flex justify-between text-xs text-gray-500 mb-1">
                <span>{formatHour(start)}</span>
                <span>{formatHour(end)}</span>
            </div>

            <div className="space-y-2">
                <input
                    type="range"
                    min={8}
                    max={22}
                    step={0.5}
                    value={start}
                    onChange={(e) =>
                        onChange(
                            Number(e.target.value),
                            Math.max(end, Number(e.target.value))
                        )
                    }
                    className="w-full accent-accent"
                />
                <input
                    type="range"
                    min={8}
                    max={22}
                    step={0.5}
                    value={end}
                    onChange={(e) =>
                        onChange(
                            Math.min(start, Number(e.target.value)),
                            Number(e.target.value)
                        )
                    }
                    className="w-full accent-accent"
                />
            </div>
        </div>
    );
};

export default TimeRangeSlider;
