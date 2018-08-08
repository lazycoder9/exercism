(ns beer-song
  (:require [clojure.string :as str]))

(defn bottles [n]
  (case n
    0 "no more bottles of beer"
    1 "1 bottle of beer"
    (str n " bottles of beer")))

(defn action [n]
  (case n
    0 "Go to the store and buy some more"
    1 "Take it down and pass it around"
    "Take one down and pass it around"))

(defn fewer [n]
  (if (zero? n) 99 (dec n)))

(defn verse [n]
  (str (str/capitalize (bottles n)) " on the wall, "
       (bottles n) ".\n"
       (action n) ", "
       (bottles (fewer n)) " on the wall.\n"))

(defn sing
  ([start] (sing start 0))
  ([start end]
    (->> (range start (dec end) -1)
         (map verse)
         (str/join "\n"))))
