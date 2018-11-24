CM.make "test_sort.cm";

open Quicksort

val test_list =
  [
  ("1", sort [1,2,3,4,5] = [1,2,3,4,5]),
  ("2", sort [4,5,2,3,1] = [1,2,3,4,5]),
  ("3", sort [4,5,0,~10,1] = [~10,0,1,4,5])
  ]

fun check_tests lst =
  case List.find (fn (name,result) => not result) lst of
    NONE => print ("\027[32m" ^ "Tests PASSED\n\n" ^ "\027[0m")
  | SOME (test,_) => print ("\027[31m" ^ "Test No." ^ test ^ " FAILED\n\n" ^ "\027[0m")

val _ = check_tests test_list

