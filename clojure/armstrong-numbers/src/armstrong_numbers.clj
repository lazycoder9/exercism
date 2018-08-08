(ns armstrong-numbers)

(defn int-to-digits [num]
  (->> num str (map #(Character/digit % 10))))

(defn armstrong? [num] 
  (let [digits (int-to-digits num)
        power (count digits)]
    (->> digits
         (map #(Math/pow % power)) 
         (reduce + ) 
         (== num))))
