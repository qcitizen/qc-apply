type count =
  | Single
  | Multiple of int

type pair = char * count

let inc = function Single -> Multiple 2 | Multiple n -> Multiple (n + 1)

let cmp (char_1 : char) ((char_2, count) : pair) =
  match char_1 = char_2 with
  | true ->
      `Eq (char_1, count)
  | false ->
      `NonEq char_1


let transform (str : string) : pair list =
  let rec _transform str pos accum =
    if pos = String.length str
    then accum
    else
      let new_accum =
        match cmp str.[pos] (List.hd accum) with
        | `Eq (char, count) ->
            let new_head = (char, inc count) in
            new_head :: List.tl accum
        | `NonEq char ->
            (char, Single) :: accum
      in
      _transform str (pos + 1) new_accum
  in
  (* Bootstrap with the first character taken care of. *)
  _transform str 1 [ (str.[0], Single) ]


let gen_char ((char, count) : pair) : string =
  match count with
  | Single ->
      String.make 1 char
  | Multiple n ->
      String.make 1 char ^ string_of_int n


let generate (lst : pair list) : string =
  lst |> List.rev_map gen_char |> String.concat ""


let compress str : string = str |> transform |> generate
