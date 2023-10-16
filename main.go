package main

import (
	"bufio"
	"fmt"
	"log"
	"os"
	"regexp"
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

		fmt.Println(initialString + " → " + parsedString)
	}
}
