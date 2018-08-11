(ns collatz-conjecture)

(defn collatz [num]
  {:pre [(pos? num)]}
  (loop [count 0
         n     num]
    (cond (= n 1)  count
          (odd? n) (recur (inc count) (inc (* n 3)))
          :else    (recur (inc count) (/ n 2)))))
