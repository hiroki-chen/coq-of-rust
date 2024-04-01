(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Axiom NanoSecond : (Ty.path "aliasing::NanoSecond") = (Ty.path "u64").

Axiom Inch : (Ty.path "aliasing::Inch") = (Ty.path "u64").

Axiom U64 : (Ty.path "aliasing::U64") = (Ty.path "u64").

(*
fn main() {
    // `NanoSecond` = `Inch` = `U64` = `u64`.
    let nanoseconds: NanoSecond = 5 as U64;
    let inches: Inch = 2 as U64;

    // Note that type aliases *don't* provide any extra type safety, because
    // aliases are *not* new types
    println!(
        "{} nanoseconds + {} inches = {} unit?",
        nanoseconds,
        inches,
        nanoseconds + inches
    );
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
          let nanoseconds := M.copy (| M.use (M.alloc (| Value.Integer Integer.U64 5 |)) |) in
          let inches := M.copy (| M.use (M.alloc (| Value.Integer Integer.U64 2 |)) |) in
          let _ :=
            let _ :=
              M.alloc (|
                  M.call_closure (|
                      M.get_function (| "std::io::stdio::_print", [] |),
                      [
                        M.call_closure (|
                            M.get_associated_function (|
                                Ty.path "core::fmt::Arguments",
                                "new_v1",
                                []
                              |),
                            [
                              (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc (|
                                      Value.Array
                                        [
                                          M.read (| mk_str "" |);
                                          M.read (| mk_str " nanoseconds + " |);
                                          M.read (| mk_str " inches = " |);
                                          M.read (| mk_str " unit?
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
                                                  [ Ty.path "u64" ]
                                                |),
                                              [ nanoseconds ]
                                            |);
                                          M.call_closure (|
                                              M.get_associated_function (|
                                                  Ty.path "core::fmt::rt::Argument",
                                                  "new_display",
                                                  [ Ty.path "u64" ]
                                                |),
                                              [ inches ]
                                            |);
                                          M.call_closure (|
                                              M.get_associated_function (|
                                                  Ty.path "core::fmt::rt::Argument",
                                                  "new_display",
                                                  [ Ty.path "u64" ]
                                                |),
                                              [
                                                M.alloc (|
                                                    BinOp.Panic.add (|
                                                        M.read (| nanoseconds |),
                                                        M.read (| inches |)
                                                      |)
                                                  |)
                                              ]
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
