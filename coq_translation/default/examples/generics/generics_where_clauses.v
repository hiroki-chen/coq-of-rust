(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  PrintInOption.
Section PrintInOption.
  Context `{ℋ : State.Trait}.
  
  Class Trait (Self : Set) : Type := {
    print_in_option : Self -> M unit;
  }.
  
End PrintInOption.
End PrintInOption.

Module  Impl_generics_where_clauses_PrintInOption_for_T.
Section Impl_generics_where_clauses_PrintInOption_for_T.
  Context `{ℋ : State.Trait}.
  
  Context {T : Set}.
  
  Context {ℋ_0 : core.fmt.Debug.Trait (core.option.Option T)}.
  Definition Self : Set := T.
  
  Definition print_in_option (self : Self) : M unit :=
    M.function_body
      (let* _ : ltac:(refine unit) :=
        let* _ : ltac:(refine unit) :=
          let* α0 : ltac:(refine (array (ref str))) :=
            M.alloc [ mk_str ""; mk_str "
" ] in
          let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
          let* α2 : ltac:(refine (array (ref str))) := deref α1 in
          let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
          let* α4 : ltac:(refine (ref (slice (ref str)))) :=
            pointer_coercion "Unsize" α3 in
          let* α5 : ltac:(refine (core.option.Option T)) :=
            M.alloc (core.option.Option.Some self) in
          let* α6 : ltac:(refine (ref (core.option.Option T))) := borrow α5 in
          let* α7 : ltac:(refine (core.option.Option T)) := deref α6 in
          let* α8 : ltac:(refine (ref (core.option.Option T))) := borrow α7 in
          let* α9 : ltac:(refine core.fmt.rt.Argument) :=
            core.fmt.rt.Argument::["new_debug"] α8 in
          let* α10 : ltac:(refine (array core.fmt.rt.Argument)) :=
            M.alloc [ α9 ] in
          let* α11 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
            borrow α10 in
          let* α12 : ltac:(refine (array core.fmt.rt.Argument)) := deref α11 in
          let* α13 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
            borrow α12 in
          let* α14 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
            pointer_coercion "Unsize" α13 in
          let* α15 : ltac:(refine core.fmt.Arguments) :=
            core.fmt.Arguments::["new_v1"] α4 α14 in
          std.io.stdio._print α15 in
        M.alloc tt in
      M.alloc tt).
  
  Global Instance AssociatedFunction_print_in_option :
    Notation.DoubleColon Self "print_in_option" := {
    Notation.double_colon := print_in_option;
  }.
  
  Global Instance ℐ : generics_where_clauses.PrintInOption.Trait Self := {
    generics_where_clauses.PrintInOption.print_in_option := print_in_option;
  }.
End Impl_generics_where_clauses_PrintInOption_for_T.
End Impl_generics_where_clauses_PrintInOption_for_T.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* vec : ltac:(refine (alloc.vec.Vec i32 alloc.alloc.Global)) :=
      let* α0 : ltac:(refine i32) := M.alloc 1 in
      let* α1 : ltac:(refine i32) := M.alloc 2 in
      let* α2 : ltac:(refine i32) := M.alloc 3 in
      let* α3 : ltac:(refine (array i32)) := M.alloc [ α0; α1; α2 ] in
      let*
          α4 :
          ltac:(refine (alloc.boxed.Box (array i32) alloc.alloc.Global)) :=
        (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α3 in
      let*
          α5 :
          ltac:(refine (alloc.boxed.Box (slice i32) alloc.alloc.Global)) :=
        pointer_coercion "Unsize" α4 in
      (slice i32)::["into_vec"] α5 in
    let* _ : ltac:(refine unit) :=
      (generics_where_clauses.PrintInOption.print_in_option
          (Self := alloc.vec.Vec i32 alloc.alloc.Global)
          (Trait := ltac:(refine _)))
        vec in
    M.alloc tt).
