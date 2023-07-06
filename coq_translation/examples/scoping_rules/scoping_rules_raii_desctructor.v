(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module ToDrop.
  Inductive t : Set := Build.
End ToDrop.
Definition ToDrop := ToDrop.t.

Module Impl_core_ops_drop_Drop_for_scoping_rules_raii_desctructor_ToDrop.
  Definition Self := scoping_rules_raii_desctructor.ToDrop.
  
  Definition drop `{State.Trait} (self : mut_ref Self) : M unit :=
    let* _ :=
      let* _ :=
        let* α0 :=
          format_arguments::["new_const"]
            (addr_of [ "ToDrop is being dropped
" ]) in
        std.io.stdio._print α0 in
      Pure tt in
    Pure tt.
  
  Global Instance Method_drop : Notation.Dot "drop" := {
    Notation.dot := drop;
  }.
  
  Global Instance I : core.ops.drop.Drop.Trait Self := {
    core.ops.drop.Drop.drop := drop;
  }.
End Impl_core_ops_drop_Drop_for_scoping_rules_raii_desctructor_ToDrop.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} (_ : unit) : M unit :=
  let x := scoping_rules_raii_desctructor.ToDrop.Build in
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"] (addr_of [ "Made a ToDrop!
" ]) in
      std.io.stdio._print α0 in
    Pure tt in
  Pure tt.
