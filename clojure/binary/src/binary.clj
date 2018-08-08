(ns binary)

(defn to-decimal [binary]
  (->> binary
       reverse
       (map #({\0 0 \1 1} % 0))
       (map-indexed #(int (* %2 (Math/pow 2 %1))))
       (reduce +)))
