(ns binary)

(defn to-decimal [binary]
  (->> binary
       reverse
       (map #(Character/digit % 10))
       (filter #(not (neg? %)))
       (map-indexed #(* %2 (Math/pow 2 %1)))
       (reduce +)
       int))
