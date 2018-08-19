(ns trinary)

(def dict {\0 0 \1 1 \2 2})

(defn to-decimal [trinary]
  (if (every? dict (seq trinary))
    (->> trinary
        (map dict)
        (reduce (fn [acc e] (+ e (* 3 acc)))))
    0))
