structure Quicksort :> SORT =
struct
  exception WrongList

  fun partition i lst lo hi =
    case lst of
      [] => (lo,i,hi)
    | x::xs => if i > x
               then partition i xs (x::lo) hi
               else partition i xs lo (x::hi)

  fun sort lst = 
    let
      fun aux (lo,i,hi) =
        (sort lo) @ (i::(sort hi))
    in
      case lst of
        [] => []
      | x::[] => [x]
      | x::xs => aux (partition x xs [] [])
    end

end

