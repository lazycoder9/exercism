(ns series)

(defn slices [string length]
  (map #(apply str %) (partition length 1 string)))
