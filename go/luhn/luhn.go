package luhn

import (
	"strings"
	"unicode"
)

func Valid(id string) bool {
	id = strings.ReplaceAll(id, " ", "")
	if len(id) < 2 {
		return false
	}

	sum := 0
	currentNumberIdx := 1

	for i := len(id) - 1; i >= 0; i-- {
		value := rune(id[i])

		if !unicode.IsDigit(value) {
			return false
		}

		number := int(value - '0')

		if currentNumberIdx%2 == 0 {
			number *= 2
		}
		if number > 9 {
			number -= 9
		}

		sum += number
		currentNumberIdx++
	}

	return sum%10 == 0
}
