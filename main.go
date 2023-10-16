package main

import (
	"fmt"
	"os"
)

func main() {
	if len(os.Args) != 2 {
		fmt.Println(`USAGE:
	main.go requires one argument which is the name of the file to be parsed.
	main.go only looks for that file in the current directory.

	E.g.:
	$ go run main.go <filename>`)
		return
	}
}
