(ns flatten-array)

(defn flatten [x]
  (->> (tree-seq sequential? seq x)
       rest
       (filter (complement sequential?))
       (filter (complement nil?))))
