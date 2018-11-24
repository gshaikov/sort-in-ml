CM.make "test_sort.cm";

open Quicksort

val testcases_sort =
  [
  ("1", [1,2,3,4,5], [1,2,3,4,5]),
  ("2", [4,5,2,3,1], [1,2,3,4,5]),
  ("3", [4,5,0,~10,1], [~10,0,1,4,5])
  ]

val _ = Tests.run "sort" sort testcases_sort

