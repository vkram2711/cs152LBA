import React from "react";
import { motion } from "framer-motion";

interface AnimatedFieldProps {
    children: React.ReactNode;
}

const AnimatedField: React.FC<AnimatedFieldProps> = ({ children }) => {
    return (
        <motion.div
            initial={{ opacity: 0, height: 0, y: -8 }}
            animate={{ opacity: 1, height: "auto", y: 0 }}
            exit={{ opacity: 0, height: 0, y: -8 }}
            transition={{ duration: 0.25, ease: "easeOut" }}
            style={{ overflow: "hidden" }}
        >
            {children}
        </motion.div>
    );
};

export default AnimatedField;
