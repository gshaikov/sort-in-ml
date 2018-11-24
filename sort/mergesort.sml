structure Mergesort :> SORT =
struct
  exception WrongOrder

  fun partition lst =
    let
      fun aux lst left right = 
        case lst of
          [] => (left, right)
        | x::[] => (x::left, right)
        | x::y::zs => aux zs (x::left) (y::right)
    in
      aux lst [] []
    end

  fun zipfn (left, right, order) =
    let
      val append_first =
        if order = "asc"
        then (fn (x,y) => x < y)
        else (fn (x,y) => x > y) 
      fun zip_in_order acc left right =
        case (left, right) of
          ([], []) => (acc, if order = "asc" then "desc" else "asc")
        | (x::xs, []) => zip_in_order (x::acc) xs []
        | ([], x::xs) => zip_in_order (x::acc) [] xs
        | (x::xs, y::ys) => if append_first (x,y)
                            then zip_in_order (x::acc) xs (y::ys)
                            else zip_in_order (y::acc) (x::xs) ys
    in
      zip_in_order [] left right
    end

  fun sort lst =
    let
      fun sort_with_order lst =
        case lst of
          [] => ([], "asc")
        | x::[] => ([x], "asc")
        | _ =>
            let
              val (left, right) = partition lst
              val (left, order_left) = sort_with_order left
              val (right, order_right) = sort_with_order right
            in
              if order_left = order_right
              then zipfn (left, right, order_left)
              else zipfn (left, List.rev right, order_left)
            end
    in
      case sort_with_order lst of
        (l, "asc") => l
      | (l, "desc") => List.rev l
      | _ => raise WrongOrder
    end
end
