(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Flipper";
    ty_params := [];
    fields := [ ("value", Ty.path "bool") ];
  } *)

(* StructTuple
  {
    name := "FlipperError";
    ty_params := [];
    fields := [];
  } *)

Module Impl_core_fmt_Debug_for_integration_flipper_FlipperError.
  Definition Self : Ty.t := Ty.path "integration_flipper::FlipperError".
  
  (* Debug *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let f := M.alloc (| f |) in
        M.call_closure (|
          M.get_associated_function (| Ty.path "core::fmt::Formatter", "write_str", [] |),
          [ M.read (| f |); M.read (| Value.String "FlipperError" |) ]
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_integration_flipper_FlipperError.

Module Impl_integration_flipper_Flipper.
  Definition Self : Ty.t := Ty.path "integration_flipper::Flipper".
  
  (*
      pub fn new(init_value: bool) -> Self {
          Self { value: init_value }
      }
  *)
  Definition new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ init_value ] =>
      ltac:(M.monadic
        (let init_value := M.alloc (| init_value |) in
        Value.StructRecord "integration_flipper::Flipper" [ ("value", M.read (| init_value |)) ]))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      pub fn new_default() -> Self {
          Self::new(Default::default())
      }
  *)
  Definition new_default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      ltac:(M.monadic
        (M.call_closure (|
          M.get_associated_function (| Ty.path "integration_flipper::Flipper", "new", [] |),
          [
            M.call_closure (|
              M.get_trait_method (| "core::default::Default", Ty.path "bool", [], "default", [] |),
              []
            |)
          ]
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new_default : M.IsAssociatedFunction Self "new_default" new_default.
  
  (*
      pub fn try_new(succeed: bool) -> Result<Self, FlipperError> {
          if succeed {
              Ok(Self::new(true))
          } else {
              Err(FlipperError)
          }
      }
  *)
  Definition try_new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ succeed ] =>
      ltac:(M.monadic
        (let succeed := M.alloc (| succeed |) in
        M.read (|
          M.match_operator (|
            M.alloc (| Value.Tuple [] |),
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ := M.use succeed in
                  let _ := M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                  M.alloc (|
                    Value.StructTuple
                      "core::result::Result::Ok"
                      [
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.path "integration_flipper::Flipper",
                            "new",
                            []
                          |),
                          [ Value.Bool true ]
                        |)
                      ]
                  |)));
              fun γ =>
                ltac:(M.monadic
                  (M.alloc (|
                    Value.StructTuple
                      "core::result::Result::Err"
                      [ Value.StructTuple "integration_flipper::FlipperError" [] ]
                  |)))
            ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_try_new : M.IsAssociatedFunction Self "try_new" try_new.
  
  (*
      pub fn flip(&mut self) {
          self.value = !self.value;
      }
  *)
  Definition flip (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          let _ :=
            M.write (|
              M.get_struct_record_field (M.read (| self |)) "integration_flipper::Flipper" "value",
              UnOp.Pure.not
                (M.read (|
                  M.get_struct_record_field
                    (M.read (| self |))
                    "integration_flipper::Flipper"
                    "value"
                |))
            |) in
          M.alloc (| Value.Tuple [] |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_flip : M.IsAssociatedFunction Self "flip" flip.
  
  (*
      pub fn get(&self) -> bool {
          self.value
      }
  *)
  Definition get (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.get_struct_record_field (M.read (| self |)) "integration_flipper::Flipper" "value"
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get : M.IsAssociatedFunction Self "get" get.
  
  (*
      pub fn err_flip(&mut self) -> Result<(), ()> {
          self.flip();
          Err(())
      }
  *)
  Definition err_flip (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          let _ :=
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (| Ty.path "integration_flipper::Flipper", "flip", [] |),
                [ M.read (| self |) ]
              |)
            |) in
          M.alloc (| Value.StructTuple "core::result::Result::Err" [ Value.Tuple [] ] |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_err_flip : M.IsAssociatedFunction Self "err_flip" err_flip.
End Impl_integration_flipper_Flipper.
