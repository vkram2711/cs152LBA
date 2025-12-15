// src/components/AnimatedField.tsx
import React from "react";
import { motion } from "framer-motion";

interface AnimatedFieldProps {
    children: React.ReactNode;
}

const AnimatedField: React.FC<AnimatedFieldProps> = ({ children }) => {
    return (
        <motion.div
            layout
            initial={{ opacity: 0, y: -8 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -8 }}
            transition={{ duration: 0.20, ease: "easeOut" }}
        >
            {children}
        </motion.div>
    );
};

export default AnimatedField;
