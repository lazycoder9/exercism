package strain

// Implement the "Keep" and "Discard" function in this file.

func Keep[T any](list []T, filter func(T) bool) []T {
	var result []T

	for _, item := range list {
		if filter(item) {
			result = append(result, item)
		}
	}
	return result
}

func Discard[T any](list []T, filter func(T) bool) []T {
	return Keep(list, func(item T) bool { return !filter(item) })
}

// You will need typed parameters (aka "Generics") to solve this exercise.
// They are not part of the Exercism syllabus yet but you can learn about
// them here: https://go.dev/tour/generics/1
