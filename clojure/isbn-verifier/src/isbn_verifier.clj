(ns isbn-verifier)

(defn isbn? [isbn]
  (let [nums (->> isbn
                  (re-seq #"\d|X$(?<!XX$)")
                  (map #(if (= "X" %) 10 (Integer. %))))
        sum  (->> nums
                  (map * (range 10 0 -1))
                  (reduce +))]
    (and (zero? (mod sum 11))
         (= 10 (count nums)))))

