(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Val.
  Record t : Set := {
    val : f64;
  }.
  
  Global Instance Get_val : Notation.Dot "val" := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Val.
Definition Val : Set := Val.t.

Module GenVal.
  Record t : Set := {
    gen_val : T;
  }.
  
  Global Instance Get_gen_val : Notation.Dot "gen_val" := {
    Notation.dot '(Build_t x0) := x0;
  }.
End GenVal.
Definition GenVal : Set := GenVal.t.

Module Impl_generics_implementation_Val.
  Definition Self := generics_implementation.Val.
  
  Definition value
      `{H : State.Trait}
      (self : ref Self)
      : M (H := H) (ref f64) :=
    Pure (addr_of self.["val"]).
  
  Global Instance Method_value `{H : State.Trait} : Notation.Dot "value" := {
    Notation.dot := value;
  }.
End Impl_generics_implementation_Val.

Module Impl_generics_implementation_GenVal_T.
  Definition Self := generics_implementation.GenVal T.
  
  Definition value `{H : State.Trait} (self : ref Self) : M (H := H) (ref T) :=
    Pure (addr_of self.["gen_val"]).
  
  Global Instance Method_value `{H : State.Trait} : Notation.Dot "value" := {
    Notation.dot := value;
  }.
End Impl_generics_implementation_GenVal_T.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let x := {| generics_implementation.Val.val := 3 (* 3.0 *); |} in
  let y := {| generics_implementation.GenVal.gen_val := 3; |} in
  let* _ :=
    let* _ :=
      let* α0 := x.["value"] in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 := y.["value"] in
      let* α3 := format_argument::["new_display"] (addr_of α2) in
      let* α4 :=
        format_arguments::["new_v1"]
          (addr_of [ ""; ", "; "
" ])
          (addr_of [ α1; α3 ]) in
      std.io.stdio._print α4 in
    Pure tt in
  Pure tt.
