(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} (_ : unit) : M unit := Pure tt.

Definition foo `{State.Trait} (arg : i32) : M i32 :=
  let* _ :=
    let* _ :=
      let* α0 := format_argument::["new_display"] (addr_of arg) in
      let* α1 :=
        format_arguments::["new_v1"]
          (addr_of [ "arg = "; "
" ])
          (addr_of [ α0 ]) in
      std.io.stdio._print α1 in
    Pure tt in
  arg.["mul"] 2.

Definition call_foo `{State.Trait} (arg : i32) : M i32 :=
  let result := tt in
  let _ := InlineAsm in
  Pure result.
