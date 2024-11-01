(ns crypto-square)
(require '[clojure.string :as str])

(defn normalize-plaintext [string]
  (-> string
      (str/replace #"[^\w]" "")
      str/lower-case))

(defn square-size [string]
  (-> string
      count
      Math/sqrt
      Math/ceil
      int))

(defn plaintext-segments [sentence]
  (let [normalized-text (normalize-plaintext sentence)
        size (square-size normalized-text)]
    (map (partial apply str) (partition-all size normalized-text))))

(defn ciphertext [] ;; <- arglist goes here
  ;; your code goes here
)

(defn normalize-ciphertext [] ;; <- arglist goes here
  ;; your code goes here
)
