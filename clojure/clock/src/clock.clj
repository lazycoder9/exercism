(ns clock)

(defn- norm [c] (mod c 1440))

(defn clock [h m] (norm (+ (* 60 h) m)))

(defn add-time [c m] (norm (+ c m)))

(defn clock->string [c]
  (format "%02d:%02d" (quot c 60) (mod c 60)))
