import React from "react";
import { Listbox } from "@headlessui/react";

interface PrettySelectProps {
    label: string;
    value: string;
    options: string[];
    onChange: (value: string) => void;
}

const PrettySelect: React.FC<PrettySelectProps> = ({
                                                       label,
                                                       value,
                                                       options,
                                                       onChange
                                                   }) => (
    <div>
        <label className="block text-sm font-medium mb-1">{label}</label>

        <Listbox value={value} onChange={onChange}>
            <Listbox.Button className="w-full rounded-xl border px-3 py-2 text-left bg-white shadow-sm">
                {value.replace("_", " ")}
            </Listbox.Button>

            <Listbox.Options className="mt-1 bg-white rounded-xl shadow-lg border z-10 relative">
                {options.map((opt) => (
                    <Listbox.Option
                        key={opt}
                        value={opt}
                        className="cursor-pointer px-3 py-2 hover:bg-latte"
                    >
                        {opt.replace("_", " ")}
                    </Listbox.Option>
                ))}
            </Listbox.Options>
        </Listbox>
    </div>
);

export default PrettySelect;
