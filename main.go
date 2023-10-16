package main

import (
	"bufio"
	"errors"
	"fmt"
	"log"
	"os"
	"regexp"
	"strconv"
	"strings"
	"unicode"
)

var errUsage = errors.New("Usage error")
var errIllegalCharacter = errors.New("Illegal character")
var errFile = errors.New("Error opening file")

func main() {
	err := compressStrings()
	if err != nil {
		log.Fatal(err)
	}
}

func compressStrings() error {
	// make sure the command has been run properly and a file to parse has been provided
	if len(os.Args) != 2 {
		fmt.Println(`USAGE:
		main.go requires one argument which is the name of the file to be parsed.
		main.go only looks for that file in the current directory.

		E.g.:
		$ go run main.go <filename>`)
		return errUsage
	}

	filename := os.Args[1]
	file, err := os.Open(filename)
	if err != nil {
		// could output a cleaner error message here but default output is sufficient for now
		fmt.Println(err.Error())
		return errFile
	}

	defer file.Close()

	scanner := bufio.NewScanner(file)

	for scanner.Scan() {
		initialString := scanner.Text()

		parsedString, err := parseString(initialString)
		if err != nil {
			return err
		}

		fmt.Println(initialString + " → " + parsedString)
	}

	return nil
}

func parseString(initialString string) (string, error) {
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
			fmt.Println("Illegal character \"" + string(c) + "\" found. (alphanumeric characters only)")
			return "", errIllegalCharacter
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

	return builder.String(), nil
}

func buildString(builder strings.Builder, r rune, count int) strings.Builder {
	if unicode.IsPrint(r) { // prevents string builder from inserting null characters like "\x00"
		builder.WriteRune(r)
		if count > 1 {
			builder.WriteString(strconv.Itoa(count))
		}
	}
	return builder
}
