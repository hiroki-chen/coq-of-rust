(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Fruit.
  Inductive t : Set :=
  | Apple
  | Orange
  | Banana
  | Kiwi
  | Lemon.
End Fruit.
Definition Fruit : Set := M.Val Fruit.t.

Module  Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_Fruit_t.
Section Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_Fruit_t.
  Ltac Self := exact unpacking_options_and_defaults_via_get_or_insert.Fruit.t.
  
  Definition fmt
      (self : M.Val (ref ltac:(Self)))
      (f : M.Val (mut_ref core.fmt.Formatter.t))
      : M (M.Val ltac:(core.fmt.Result)) :=
    M.function_body
      (let* α0 : ltac:(refine (M.Val core.fmt.Formatter.t)) := deref f in
      let* α1 : ltac:(refine (M.Val (mut_ref core.fmt.Formatter.t))) :=
        borrow_mut α0 in
      let* α2 := M.read self in
      let* α3 : ltac:(refine (M.Val (ref str))) :=
        match α2 with
        | unpacking_options_and_defaults_via_get_or_insert.Fruit.Apple  =>
          let* α0 : ltac:(refine (M.Val str)) := deref (mk_str "Apple") in
          borrow α0
        | unpacking_options_and_defaults_via_get_or_insert.Fruit.Orange  =>
          let* α0 : ltac:(refine (M.Val str)) := deref (mk_str "Orange") in
          borrow α0
        | unpacking_options_and_defaults_via_get_or_insert.Fruit.Banana  =>
          let* α0 : ltac:(refine (M.Val str)) := deref (mk_str "Banana") in
          borrow α0
        | unpacking_options_and_defaults_via_get_or_insert.Fruit.Kiwi  =>
          let* α0 : ltac:(refine (M.Val str)) := deref (mk_str "Kiwi") in
          borrow α0
        | unpacking_options_and_defaults_via_get_or_insert.Fruit.Lemon  =>
          let* α0 : ltac:(refine (M.Val str)) := deref (mk_str "Lemon") in
          borrow α0
        end in
      core.fmt.Formatter.t::["write_str"] α1 α3).
  
  Global Instance AssociatedFunction_fmt :
    Notation.DoubleColon ltac:(Self) "fmt" := {
    Notation.double_colon := fmt;
  }.
  
  Global Instance ℐ : core.fmt.Debug.Trait ltac:(Self) := {
    core.fmt.Debug.fmt := fmt;
  }.
End Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_Fruit_t.
End Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_Fruit_t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let* my_fruit :
        ltac:(refine
          (M.Val
            (core.option.Option.t
              unpacking_options_and_defaults_via_get_or_insert.Fruit.t))) :=
      M.alloc core.option.Option.None in
    let* apple :
        ltac:(refine
          (M.Val unpacking_options_and_defaults_via_get_or_insert.Fruit.t)) :=
      M.alloc unpacking_options_and_defaults_via_get_or_insert.Fruit.Apple in
    let* first_available_fruit :
        ltac:(refine
          (M.Val
            (mut_ref
              unpacking_options_and_defaults_via_get_or_insert.Fruit.t))) :=
      let* α0 :
          ltac:(refine
            (M.Val
              (mut_ref
                (core.option.Option.t
                  unpacking_options_and_defaults_via_get_or_insert.Fruit.t)))) :=
        borrow_mut my_fruit in
      (core.option.Option.t
            unpacking_options_and_defaults_via_get_or_insert.Fruit.t)::["get_or_insert"]
        α0
        apple in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "my_fruit is: "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine
              (M.Val
                (ref
                  (mut_ref
                    unpacking_options_and_defaults_via_get_or_insert.Fruit.t)))) :=
          borrow first_available_fruit in
        let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_debug"] α3 in
        let* α5 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α5 in
        let* α7 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α7 in
        std.io.stdio._print α8 in
      M.alloc tt in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "first_available_fruit is: "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 :
            ltac:(refine
              (M.Val
                (ref
                  (mut_ref
                    unpacking_options_and_defaults_via_get_or_insert.Fruit.t)))) :=
          borrow first_available_fruit in
        let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_debug"] α3 in
        let* α5 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α5 in
        let* α7 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α7 in
        std.io.stdio._print α8 in
      M.alloc tt in
    M.alloc tt).
