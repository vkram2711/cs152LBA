import React from "react";

interface Props {
    label: string;
    value: string;
    options: string[];
    onChange: (v: string) => void;
    className?: string;
    name?: string;
}

const CustomSelect: React.FC<Props> = ({ label, value, options, onChange, className = "", name }) => {
    return (
        <div className={className}>
            <label className="block text-sm font-medium mb-1">{label}</label>
            <select
                name={name}
                value={value}
                onChange={(e) => onChange(e.target.value)}
                className="w-full rounded-xl border-gray-300 px-3 py-2 bg-white"
            >
                {options.map((opt) => (
                    <option key={opt} value={opt}>
                        {opt.replace("_", " ")}
                    </option>
                ))}
            </select>
        </div>
    );
};

export default CustomSelect;
