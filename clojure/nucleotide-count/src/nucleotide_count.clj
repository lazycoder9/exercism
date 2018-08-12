(ns nucleotide-count)

(defn nucleotide-counts [strand]
  (merge {\A 0 \T 0 \C 0 \G 0} (frequencies strand)))

(defn count [nucleotide strand]
  {:pre [(#{\A \C \G \T} nucleotide)]}
  ((nucleotide-counts strand) nucleotide))
