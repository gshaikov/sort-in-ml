structure Tests =
struct
  fun run name f lst =
    case List.find (fn (_,input,expected) => not ((f input) = expected)) lst of
      NONE => print (name ^ ": " ^ "\027[32m" ^ "tests PASSED" ^ "\027[0m" ^ "\n")
    | SOME (test,_,_) => print (name ^ ": " ^ "\027[31m" ^ "test No." ^ test ^ " FAILED" ^ "\027[0m" ^ "\n")
end

