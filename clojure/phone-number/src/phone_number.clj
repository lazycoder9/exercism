(ns phone-number)

(defn number [num-string]
  (let [digits (re-seq #"\d" num-string)
        digit-count (count digits)]
    (cond
      (= digit-count 10) (apply str digits)
      (and (= digit-count 11) (= "1" (first digits))) (apply str (rest digits))
      :else "0000000000")))

(defn area-code [num-string]
  (subs (number num-string) 0 3))

(defn pretty-print [num-string] ;; <- arglist goes here
  (let [nums (number num-string)
        area (area-code num-string)
        head-nums (subs nums 3 6)
        tail-nums (subs nums 6 10)]
    (format "(%s) %s-%s" area head-nums tail-nums)))
