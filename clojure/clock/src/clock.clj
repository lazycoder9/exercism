(ns clock)

(defn clock->string [[h m]]
  (format "%02d:%02d" h m))

(defn get-clock-from-minutes [m]
  [(- (quot m 60) (if (neg? m) 1 0)) (mod m 60)])

(defn get-hour [n]
  (nth (cycle (range 24)) (+ 24 (mod n 24))))

(defn clock [hours minutes]
  (let [[hm m] (get-clock-from-minutes minutes)
        h (get-hour (+ hours hm))]
    [h m]))

(defn add-time [[h m] time]
  (clock h (+ m time)))
