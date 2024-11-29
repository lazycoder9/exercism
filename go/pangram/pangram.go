package pangram

import (
	"strings"
	"unicode"
)

func IsPangram(input string) bool {
	input = strings.ToLower(input)
	usedChars := make(map[rune]bool)

	for _, char := range input {
		if unicode.IsLetter(char) {
			usedChars[char] = true
		}
	}

	return len(usedChars) == 26
}
