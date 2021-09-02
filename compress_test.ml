open Compress
open OUnit2

let test_case input expectation _ =
  let res = compress input in
  assert_equal expectation res

let one = "first case" >:: test_case "aaabccccdd" "a3bc4d2"

let suite = "Test Compress" >::: [ one ]

let () = run_test_tt_main suite
