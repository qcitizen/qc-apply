package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"regexp"
	"strconv"
	"strings"
	"unicode"
)

func main() {
	// make sure the command has been run properly and a file to parse has been provided
	if len(os.Args) != 2 {
		fmt.Println(`USAGE:
	main.go requires one argument which is the name of the file to be parsed.
	main.go only looks for that file in the current directory.

	E.g.:
	$ go run main.go <filename>`)
		return
	}

	filename := os.Args[1]
	file, err := os.Open(filename)
	if err != nil {
		// could output a cleaner error message here but console output is sufficient for now
		log.Fatal(err)
	}
	defer file.Close()

	scanner := bufio.NewScanner(file)

	for scanner.Scan() {
		initialString := scanner.Text()

		// remove digits
		regex := regexp.MustCompile("[0-9]+")
		parsedString := regex.ReplaceAllString(initialString, "")

		// count repeated characters
		var builder strings.Builder
		var character rune
		var charCount = 0
		for _, c := range parsedString {
			// ensure the character is alphabetic as expected
			if !unicode.IsLetter(c) {
				log.Fatal("Illegal character detected in " + filename + " (alphanumeric characters only)")
				return
			}

			if c == character {
				charCount++
			} else {
				builder = buildString(builder, character, charCount)

				character = c
				charCount = 1
			}
		}
		builder = buildString(builder, character, charCount)
		parsedString = builder.String()

		fmt.Println(initialString + " → " + parsedString)
	}
}

func buildString(builder strings.Builder, r rune, count int) strings.Builder {
	builder.WriteRune(r)
	if count > 1 {
		builder.WriteString(strconv.Itoa(count))
	}
	return builder
}
