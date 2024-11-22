package isogram

import (
	"strings"
	"unicode"
)

func IsIsogram(word string) bool {
	runes := map[rune]bool{}

	for _, v := range strings.ToLower(word) {
		if !unicode.IsLetter(v) {
			continue
		}

		if runes[v] {
			return false
		}

		runes[v] = true
	}

	return true
}
