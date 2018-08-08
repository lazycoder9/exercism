(ns rna-transcription)

(defn to-rna [dna]
  {:pre [(every? #{\A \C \G \T} (seq dna))]}
  (let [pairs { \G "C" \C "G" \T "A" \A "U"}]
    (->> dna
         seq
         (map #(get pairs %))
         (apply str))))
