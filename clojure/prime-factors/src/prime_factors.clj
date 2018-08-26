(ns prime-factors)

(defn of [n]
  (loop [x n d 2 factors []]
    (cond
      (= x 1) []
      (> d (Math/sqrt x)) (conj factors x)
      (zero? (mod x d)) (recur (/ x d) d (conj factors d))
      :else (recur x (inc d) factors))))
