(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Owner.
  Unset Primitive Projections.
  Record t : Set := {
    _ : i32;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Owner.
Definition Owner := @Owner.t.

Module Impl_scoping_rules_lifetimes_methods_Owner.
  Definition Self := scoping_rules_lifetimes_methods.Owner.
  
  Definition add_one
      `{H' : State.Trait}
      (self : mut_ref Self)
      : M (H := H') unit :=
    let* _ :=
      let* α0 := deref self scoping_rules_lifetimes_methods.Owner in
      assign_op add α0.["0"] 1 in
    Pure tt.
  
  Global Instance Method_add_one `{H' : State.Trait} :
    Notation.Dot "add_one" := {
    Notation.dot := add_one;
  }.
  
  Definition print `{H' : State.Trait} (self : ref Self) : M (H := H') unit :=
    let* _ :=
      let* _ :=
        let* α0 := borrow [ "`print`: "; "
" ] (list (ref str)) in
        let* α1 := deref α0 (list (ref str)) in
        let* α2 := borrow α1 (list (ref str)) in
        let* α3 := pointer_coercion "Unsize" α2 in
        let* α4 := deref self scoping_rules_lifetimes_methods.Owner in
        let* α5 := borrow α4.["0"] i32 in
        let* α6 := deref α5 i32 in
        let* α7 := borrow α6 i32 in
        let* α8 := core.fmt.rt.Argument::["new_display"] α7 in
        let* α9 := borrow [ α8 ] (list core.fmt.rt.Argument) in
        let* α10 := deref α9 (list core.fmt.rt.Argument) in
        let* α11 := borrow α10 (list core.fmt.rt.Argument) in
        let* α12 := pointer_coercion "Unsize" α11 in
        let* α13 := core.fmt.Arguments::["new_v1"] α3 α12 in
        std.io.stdio._print α13 in
      Pure tt in
    Pure tt.
  
  Global Instance Method_print `{H' : State.Trait} : Notation.Dot "print" := {
    Notation.dot := print;
  }.
End Impl_scoping_rules_lifetimes_methods_Owner.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H' : State.Trait} : M (H := H') unit :=
  let owner := scoping_rules_lifetimes_methods.Owner.Build_t 18 in
  let* _ :=
    let* α0 := borrow_mut owner scoping_rules_lifetimes_methods.Owner in
    scoping_rules_lifetimes_methods.Owner::["add_one"] α0 in
  let* _ :=
    let* α0 := borrow owner scoping_rules_lifetimes_methods.Owner in
    scoping_rules_lifetimes_methods.Owner::["print"] α0 in
  Pure tt.
