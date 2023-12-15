(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn decode_input<T>() -> Result<T, ()> {
    unimplemented!()
}
*)
Definition decode_input {T : Set} : M (core.result.Result.t T unit) :=
  let* α0 : ref str.t := M.read (mk_str "not implemented") in
  let* α1 : never.t := M.call (core.panicking.panic α0) in
  never_to_any α1.

Module  WildcardSelector.
Section WildcardSelector.
  Record t : Set := { }.
End WildcardSelector.
End WildcardSelector.

Module  Impl_wildcard_selector_WildcardSelector_t.
Section Impl_wildcard_selector_WildcardSelector_t.
  Ltac Self := exact wildcard_selector.WildcardSelector.t.
  
  (*
      pub fn new() -> Self {
          Self {}
      }
  *)
  Definition new : M ltac:(Self) :=
    M.pure wildcard_selector.WildcardSelector.Build_t.
  
  Global Instance AssociatedFunction_new :
    Notations.DoubleColon ltac:(Self) "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn wildcard(&mut self) {
          let (_selector, _message) = decode_input::<([u8; 4], String)>().unwrap();
          println!("Wildcard selector: {:?}, message: {}", _selector, _message);
      }
  *)
  Definition wildcard (self : mut_ref ltac:(Self)) : M unit :=
    let* self : M.Val (mut_ref ltac:(Self)) := M.alloc self in
    let* '(_selector, _message) :
        M.Val ((array u8.t) * alloc.string.String.t) :=
      let* α0 :
          core.result.Result.t ((array u8.t) * alloc.string.String.t) unit :=
        M.call wildcard_selector.decode_input in
      let* α1 : (array u8.t) * alloc.string.String.t :=
        M.call
          ((core.result.Result.t
                ((array u8.t) * alloc.string.String.t)
                unit)::["unwrap"]
            α0) in
      M.alloc α1 in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc
            [ mk_str "Wildcard selector: "; mk_str ", message: "; mk_str "
"
            ] in
        let* α1 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α0) in
        let* α2 : ref (slice (ref str.t)) :=
          M.read (pointer_coercion "Unsize" α1) in
        let* α3 : core.fmt.rt.Argument.t :=
          M.call (core.fmt.rt.Argument.t::["new_debug"] (borrow _selector)) in
        let* α4 : M.Val core.fmt.rt.Argument.t := M.alloc α3 in
        let* α5 : core.fmt.rt.Argument.t :=
          M.call (core.fmt.rt.Argument.t::["new_display"] (borrow _message)) in
        let* α6 : M.Val core.fmt.rt.Argument.t := M.alloc α5 in
        let* α7 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α4; α6 ] in
        let* α8 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
          M.alloc (borrow α7) in
        let* α9 : ref (slice core.fmt.rt.Argument.t) :=
          M.read (pointer_coercion "Unsize" α8) in
        let* α10 : core.fmt.Arguments.t :=
          M.call (core.fmt.Arguments.t::["new_v1"] α2 α9) in
        let* α11 : unit := M.call (std.io.stdio._print α10) in
        M.alloc α11 in
      M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_wildcard :
    Notations.DoubleColon ltac:(Self) "wildcard" := {
    Notations.double_colon := wildcard;
  }.
  
  (*
      pub fn wildcard_complement(&mut self, _message: String) {
          println!("Wildcard complement message: {}", _message);
      }
  *)
  Definition wildcard_complement
      (self : mut_ref ltac:(Self))
      (_message : alloc.string.String.t)
      : M unit :=
    let* self : M.Val (mut_ref ltac:(Self)) := M.alloc self in
    let* _message : M.Val alloc.string.String.t := M.alloc _message in
    let* _ : M.Val unit :=
      let* _ : M.Val unit :=
        let* α0 : M.Val (array (ref str.t)) :=
          M.alloc [ mk_str "Wildcard complement message: "; mk_str "
" ] in
        let* α1 : M.Val (ref (array (ref str.t))) := M.alloc (borrow α0) in
        let* α2 : ref (slice (ref str.t)) :=
          M.read (pointer_coercion "Unsize" α1) in
        let* α3 : core.fmt.rt.Argument.t :=
          M.call (core.fmt.rt.Argument.t::["new_display"] (borrow _message)) in
        let* α4 : M.Val core.fmt.rt.Argument.t := M.alloc α3 in
        let* α5 : M.Val (array core.fmt.rt.Argument.t) := M.alloc [ α4 ] in
        let* α6 : M.Val (ref (array core.fmt.rt.Argument.t)) :=
          M.alloc (borrow α5) in
        let* α7 : ref (slice core.fmt.rt.Argument.t) :=
          M.read (pointer_coercion "Unsize" α6) in
        let* α8 : core.fmt.Arguments.t :=
          M.call (core.fmt.Arguments.t::["new_v1"] α2 α7) in
        let* α9 : unit := M.call (std.io.stdio._print α8) in
        M.alloc α9 in
      M.alloc tt in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_wildcard_complement :
    Notations.DoubleColon ltac:(Self) "wildcard_complement" := {
    Notations.double_colon := wildcard_complement;
  }.
End Impl_wildcard_selector_WildcardSelector_t.
End Impl_wildcard_selector_WildcardSelector_t.
