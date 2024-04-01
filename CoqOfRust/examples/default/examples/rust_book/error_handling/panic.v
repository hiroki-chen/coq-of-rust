(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn drink(beverage: &str) {
    // You shouldn't drink too much sugary beverages.
    if beverage == "lemonade" {
        panic!("AAAaaaaa!!!!");
    }

    println!("Some refreshing {} is all I need.", beverage);
}
*)
Definition drink (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ beverage ] =>
    ltac:(M.monadic
      (let beverage := M.alloc (| beverage |) in
      M.read (|
        let _ :=
          M.match_operator (|
            M.alloc (| Value.Tuple [] |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ :=
                    M.use
                      (M.alloc (|
                        M.call_closure (|
                          M.get_trait_method (|
                            "core::cmp::PartialEq",
                            Ty.apply (Ty.path "&") [ Ty.path "str" ],
                            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ],
                            "eq",
                            []
                          |),
                          [ beverage; mk_str "lemonade" ]
                        |)
                      |)) in
                  let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                  M.alloc (|
                    M.never_to_any (|
                      M.call_closure (|
                        M.get_function (|
                          "std::panicking::begin_panic",
                          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                        |),
                        [ M.read (| mk_str "AAAaaaaa!!!!" |) ]
                      |)
                    |)
                  |)));
              fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
            ]
          |) in
        let _ :=
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [
                              M.read (| mk_str "Some refreshing " |);
                              M.read (| mk_str " is all I need.
" |)
                            ]
                        |));
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                          Value.Array
                            [
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.path "core::fmt::rt::Argument",
                                  "new_display",
                                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                |),
                                [ beverage ]
                              |)
                            ]
                        |))
                    ]
                  |)
                ]
              |)
            |) in
          M.alloc (| Value.Tuple [] |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.

(*
fn main() {
    drink("water");
    drink("lemonade");
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "panic::drink", [] |),
              [ M.read (| mk_str "water" |) ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "panic::drink", [] |),
              [ M.read (| mk_str "lemonade" |) ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
