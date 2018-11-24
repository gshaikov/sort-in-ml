(* Efficient quick sort.
* The list is sorted and represented as a tree.
* Then it is folded with accumulator.
* No lists are traversed multiple times. *)

structure Quicksort :> SORT =
struct
  exception WrongTree

  datatype tree = End of int option
                | Col of int list
                | Node of tree * int option * tree

  fun partition i lst lo hi =
    case lst of
      [] => Node (Col lo, SOME i, Col hi)
    | x::xs => if i > x
               then partition i xs (x::lo) hi
               else partition i xs lo (x::hi)

  fun fold tree acc =
        case tree of
          End NONE => acc
        | End (SOME x) => x::acc
        | Node (a, SOME i, b) => fold a (i::(fold b acc))
        | _ => raise WrongTree

  fun sort_tree lst = 
    let
      fun assemble tree =
        case tree of
          Node (Col a, i, Col b) => Node (sort_tree a, i, sort_tree b)
        | _ => raise WrongTree
    in
      case lst of
        [] => End NONE
      | x::[] => End (SOME x)
      | x::xs => assemble (partition x xs [] [])
    end

  fun sort lst =
    fold (sort_tree lst) []

end

