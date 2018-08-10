(ns word-count
  (:require [clojure.string :as str]))

(defn word-count [s]
  (->> s
       (re-seq #"\w+")
       (map #(str/lower-case %))
       (reduce #(assoc %1 %2 (inc (%1 %2 0))) {})))
