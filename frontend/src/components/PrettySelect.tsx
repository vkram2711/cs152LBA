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
                                                   }) => {
    return (
        <div className="relative">
            <label className="block text-sm font-medium mb-1">{label}</label>

            <Listbox value={value} onChange={onChange}>
                <Listbox.Button className="w-full rounded-xl border px-3 py-2 text-left bg-white shadow-sm">
                    {value.replace("_", " ")}
                </Listbox.Button>

                <Listbox.Options className="absolute mt-1 w-full bg-white rounded-xl shadow-lg border z-20">
                    {options.map((opt) => (
                        <Listbox.Option
                            key={opt}
                            value={opt}
                            className={({ active }) =>
                                `cursor-pointer px-3 py-2 ${
                                    active ? "bg-latte" : ""
                                }`
                            }
                        >
                            {opt.replace("_", " ")}
                        </Listbox.Option>
                    ))}
                </Listbox.Options>
            </Listbox>
        </div>
    );
};

export default PrettySelect;
