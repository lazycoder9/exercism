(ns anagram)

(defn anagram? [w other]
  (let [a (.toLowerCase w)
        b (.toLowerCase other)]
    (and
      (= (frequencies a) (frequencies b))
      (not= a b))))

(defn anagrams-for [word prospect-list]
    (filter #(anagram? word %) prospect-list))
