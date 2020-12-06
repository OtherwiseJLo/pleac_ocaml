(* Where do string and offset get defined????? *)
(* get a 5-byte string, skip 3, then grab 2 8-byte strings, then the rest  *)
(* Three implementations??? *)
let value = String.sub string offset count 
let value = String.sub string offset (String.length - offset)
(* or *)
let value = sub_end string offset
(* using *)
let sub_end string offset = String.sub string offset (String.length string - offset)


(* Split at 'sz' byte boundaries *)
let rec split_every_n_chars sz = function
  | "" -> []
  | s ->
      try
        let (beg, rest) = String.sub s 0 sz, sub_end s sz in
        beg :: split_every_n_chars sz rest
      with _ -> [s]

let fivers = split_every_n_chars 5 string


(* chop string into individual characters *)
let chars = List.map(fun x -> x.[0]) (split_every_n_chars 1 string)


(*------------------------------*)
let string = "This is what you have";;
(* Indexes are left to right, with no negative indices like Python *)
(* "T" *)
let first = String.sub string 0 1
(* "is" *)
let start = String.sub string 5 2

