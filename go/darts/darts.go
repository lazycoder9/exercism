package darts

import "math"

func Score(x, y float64) int {
	d := math.Sqrt(x*x + y*y)
	switch {
	case d > 10:
		return 0
	case d <= 10 && d > 5:
		return 1
	case d <= 5 && d > 1:
		return 5
	default:
		return 10
	}
}
