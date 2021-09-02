open Compress
open OUnit2

let test_case input expectation =
  input
  >:: fun _ ->
  let res = compress input in
  assert_equal expectation res


let one = test_case "aaabccccdd" "a3bc4d2"

let two = test_case "aaaaaffffffffffc" "a5f10c"

let three = test_case "abcd" "abcd"

let four = test_case "ccceee12eccceee" "c3e4c3e3"

let five = test_case "effeac01cb65c" "ef2eac2bc"

let suite = "Test Compress" >::: [ one; two; three; four; five ]

let () = run_test_tt_main suite
