open Compress

let usage_message = "compress <input_string>"

let input_string = ref ""

let anon_fun str = input_string := str

let speclist = []

(* This is the entrypoint. *)
let () =
  Arg.parse speclist anon_fun usage_message;

  print_endline (compress !input_string)
