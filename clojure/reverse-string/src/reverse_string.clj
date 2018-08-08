(ns reverse-string)

(defn reverse-string [s]
  (->> s seq reverse (apply str)))
