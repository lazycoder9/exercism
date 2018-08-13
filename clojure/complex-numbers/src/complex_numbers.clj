(ns complex-numbers)

(def real first)

(def imaginary last)

(defn square [c] (reduce + (map * c c)))

(defn abs [c] (Math/sqrt (square c)))

(defn conjugate [[a b]] [a (- b)])

(def add (partial map +))

(def sub (partial map -))

(defn op [f1 f2 [a b] [c d]]
  [(f1 (* a c) (* b d))
   (f2 (* b c) (* a d))])

(defn mul [c1 c2] (op - + c1 c2))

(defn div [c1 [c d :as c2]]
  (when-not (== 0 c d)
    (let [div-op #(/ (double %) (square c2))]
      (op (comp div-op +) (comp div-op -) c1 c2))))