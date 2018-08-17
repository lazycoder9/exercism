(ns bob
  (:require [clojure.string :as str]))

(defn question? [s] (= \? (last s)))
(defn silence? [s] (str/blank? s))
(defn shout? [s] (and (= s (str/upper-case s)) (re-seq #"[a-zA-Z]" s)))

(defn response-for [s]
  (cond
    (and (shout? s) (question? s)) "Calm down, I know what I'm doing!"
    (silence? s) "Fine. Be that way!"
    (question? s) "Sure."
    (shout? s) "Whoa, chill out!"
    :else "Whatever."))
