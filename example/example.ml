let () =
  let uppercase_string = [%uppercase "hello, world!"] in
  print_endline uppercase_string


let rec fact n =
  if n < 2 then 1
  else n * fact (n-1);;

fact 5 |> print_int;;

List.map (fun x->x+2) [1;2;3;4] |> List.fold_left (+) 0 |> print_int
;;

print_int [%mul10 15]