(ns trinary)

(defn to-decimal [trinary]
  (if (every? #{\0 \1 \2} (seq trinary))
    (->> trinary
        (map #({\0 0 \1 1 \2 2} % 0))
        (reduce (fn [acc e] (+ e (* 3 acc)))))
    0))
