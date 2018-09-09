(ns pascals-triangle)

(defn next-row [row]
  (concat [1N] (map + row (rest row)) [1N]))

(def triangle (iterate next-row [1]))

(defn row [n]
  (nth triangle (dec n)))
