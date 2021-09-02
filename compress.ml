type count = Single | Multiple of int

type pair = char * count

let transform (str : string) : pair list = []

let generate (lst : pair list) : string = ""

let compress str : string = str |> transform |> generate
