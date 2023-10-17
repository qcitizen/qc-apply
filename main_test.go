package main

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestParseString(t *testing.T) {
	type testCases struct {
		description   string
		initialString string
		parsedString  string
		expectedError error
	}

	for _, test := range []testCases{
		{
			description:   "illegal character",
			initialString: "aaaaafffff,fffffc",
			parsedString:  "",
			expectedError: errIllegalCharacter,
		},
		{
			description:   "success",
			initialString: "aaaaaffffffffffc",
			parsedString:  "a5f10c",
			expectedError: nil,
		},
	} {
		t.Run(test.description, func(t *testing.T) {
			actualParsedString, actualError := parseString(test.initialString)
			assert.Equal(t, test.parsedString, actualParsedString)
			assert.Equal(t, test.expectedError, actualError)
		})
	}
}
