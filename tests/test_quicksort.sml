CM.make "../import_sort.cm";

open Quicksort

val test_list =
  [
  ("1", sort [1,2,3,4,5] = [1,2,3,4,5]),
  ("2", sort [4,5,2,3,1] = [1,2,3,4,5]),
  ("3", sort [4,5,0,~10,1] = [~10,0,1,4,5])
  ]

fun check_tests lst =
  case List.find (fn (name,result) => not result) lst of
    NONE => "Tests passed"
  | SOME (test,_) => "Test No." ^ test ^ " FAILED"

val result = check_tests test_list

