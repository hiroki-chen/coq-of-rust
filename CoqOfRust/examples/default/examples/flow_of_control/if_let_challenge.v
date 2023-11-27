(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Foo.
  Inductive t : Set :=
  | Bar.
End Foo.

(*
fn main() {
    let a = Foo::Bar;

    // Variable a matches Foo::Bar
    if let Foo::Bar = a {
        // ^-- this causes a compile-time error. Use `if let` instead.
        println!("a is foobar");
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  let* a : M.Val if_let_challenge.Foo.t := M.alloc if_let_challenge.Foo.Bar in
  let* α0 : M.Val bool.t := let_if if_let_challenge.Foo.Bar  := a in
  let* α1 : bool.t := M.read α0 in
  let* α0 : M.Val unit :=
    if (α1 : bool) then
      let* _ : M.Val unit :=
        let* _ : M.Val unit :=
          let* α0 : M.Val (array (ref str.t)) :=
            M.alloc [ mk_str "a is foobar
" ] in
          let* α1 : ref (array (ref str.t)) := borrow α0 in
          let* α2 : M.Val (ref (array (ref str.t))) := M.alloc α1 in
          let* α3 : M.Val (ref (slice (ref str.t))) :=
            pointer_coercion "Unsize" α2 in
          let* α4 : ref (slice (ref str.t)) := M.read α3 in
          let* α5 : core.fmt.Arguments.t :=
            core.fmt.Arguments.t::["new_const"] α4 in
          let* α6 : unit := std.io.stdio._print α5 in
          M.alloc α6 in
        M.alloc tt in
      M.alloc tt
    else
      M.alloc tt in
  M.read α0.
