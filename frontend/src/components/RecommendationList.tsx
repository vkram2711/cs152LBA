export default function RecommendationList({ items }: any) {
    if (!items.length) return null;

    return (
        <div>
            <h2 className="font-semibold mb-2">Recommended</h2>
            <ul className="space-y-2">
        {items.map((c: string) => (
                <li
                    key={c}
            className="p-3 rounded-xl bg-amber-100"
            >
            ☕ {c}
    </li>
))}
    </ul>
    </div>
);
}
