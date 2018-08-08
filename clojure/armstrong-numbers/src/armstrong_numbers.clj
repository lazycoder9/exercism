(ns armstrong-numbers)

(defn armstrong? [num]
  (let [power (-> num str seq count)]
    (->> num
         str
         (map #(Character/digit % 10))
         (map #(Math/pow % power))
         (reduce +) 
         (== num))))
