(ns run-length-encoding)

(defn run-length-encode [plain-text]
  (->> plain-text
        (partition-by identity)
        (mapcat #(if (= 1 (count %))
                    [(first %)]
                    [(count %) (first %)]))
        (apply str)))

(defn run-length-decode [cipher-text]
  (->> cipher-text
       (re-seq #"[1-9]*[a-zA-Z ]")
       (mapcat #(if (= 1 (count %))
                    %
                    (repeat (->> % drop-last (apply str) Integer.) (last %))))
       (apply str)))
