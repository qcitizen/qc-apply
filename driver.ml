open Compress

let usage_message = "Usage: compress <input_string>"

let input_string = ref ""

let anon_fun str = input_string := str

let speclist = []

(* This is the entrypoint. *)
let () =
  Arg.parse speclist anon_fun usage_message ;

  let str = String.trim !input_string in
  match String.length str with
  | 0 ->
      print_endline usage_message
  | _ ->
      print_endline (compress str)
