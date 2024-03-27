(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Error *)
(* {
  ty_params := [];
  variants := [];
} *)

(*
fn set_code_hash<E>(code_hash: &E) -> Result<(), Error> {
    unimplemented!()
}
*)
Parameter set_code_hash : (list Ty.t) -> (list Value.t) -> M.

(* StructRecord
  {
    name := "Incrementer";
    ty_params := [];
    fields := [ ("count", Ty.path "u32") ];
  } *)

Module Impl_core_default_Default_for_set_code_hash_Incrementer.
  Definition Self : Ty.t := Ty.path "set_code_hash::Incrementer".
  
  (*
  Default
  *)
  Definition default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      let* α0 :=
        M.get_trait_method
          "core::default::Default"
          (Ty.path "u32")
          []
          "default"
          [] in
      let* α1 := M.call_closure α0 [] in
      M.pure (Value.StructRecord "set_code_hash::Incrementer" [ ("count", α1) ])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::default::Default"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("default", InstanceField.Method default) ].
End Impl_core_default_Default_for_set_code_hash_Incrementer.

Module Impl_set_code_hash_Incrementer.
  Definition Self : Ty.t := Ty.path "set_code_hash::Incrementer".
  
  (*
      pub fn new() -> Self {
          Default::default()
      }
  *)
  Definition new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      let* α0 :=
        M.get_trait_method
          "core::default::Default"
          (Ty.path "set_code_hash::Incrementer")
          []
          "default"
          [] in
      M.call_closure α0 []
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      pub fn inc(&mut self) {
          self.count += 1;
          println!(
              "The new count is {}, it was modified using the original contract code.",
              self.count
          );
      }
  *)
  Definition inc (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* β :=
          let* α0 := M.read self in
          M.pure
            (M.get_struct_record_field
              α0
              "set_code_hash::Incrementer"
              "count") in
        let* α0 := M.read β in
        let* α1 := BinOp.Panic.add α0 (Value.Integer Integer.U32 1) in
        M.assign β α1 in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1"
              [] in
          let* α2 := M.read (mk_str "The new count is ") in
          let* α3 :=
            M.read
              (mk_str ", it was modified using the original contract code.
") in
          let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
          let* α5 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display"
              [ Ty.path "u32" ] in
          let* α6 := M.read self in
          let* α7 :=
            M.call_closure
              α5
              [
                M.get_struct_record_field
                  α6
                  "set_code_hash::Incrementer"
                  "count"
              ] in
          let* α8 := M.alloc (Value.Array [ α7 ]) in
          let* α9 :=
            M.call_closure
              α1
              [
                M.pointer_coercion (* Unsize *) α4;
                M.pointer_coercion (* Unsize *) α8
              ] in
          let* α10 := M.call_closure α0 [ α9 ] in
          M.alloc α10 in
        M.alloc (Value.Tuple []) in
      let* α0 := M.alloc (Value.Tuple []) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_inc : M.IsAssociatedFunction Self "inc" inc.
  
  (*
      pub fn get(&self) -> u32 {
          self.count
      }
  *)
  Definition get (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.read self in
      M.read (M.get_struct_record_field α0 "set_code_hash::Incrementer" "count")
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get : M.IsAssociatedFunction Self "get" get.
  
  (*
      pub fn set_code(&mut self, code_hash: [u8; 32]) {
          set_code_hash(&code_hash).unwrap_or_else(|err| {
              panic!("Failed to `set_code_hash` to {code_hash:?} due to {err:?}")
          });
          println!("Switched code hash to {:?}.", code_hash);
      }
  *)
  Definition set_code (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; code_hash ] =>
      let* self := M.alloc self in
      let* code_hash := M.alloc code_hash in
      let* _ :=
        let* α0 :=
          M.get_associated_function
            (Ty.apply
              (Ty.path "core::result::Result")
              [ Ty.tuple []; Ty.path "set_code_hash::Error" ])
            "unwrap_or_else"
            [
              Ty.function
                [ Ty.tuple [ Ty.path "set_code_hash::Error" ] ]
                (Ty.tuple [])
            ] in
        let* α1 :=
          M.get_function
            "set_code_hash::set_code_hash"
            [ Ty.apply (Ty.path "array") [ Ty.path "u8" ] ] in
        let* α2 := M.call_closure α1 [ code_hash ] in
        let* α3 :=
          M.call_closure
            α0
            [
              α2;
              M.closure
                (fun γ =>
                  match γ with
                  | [ α0 ] =>
                    let* α0 := M.alloc α0 in
                    match_operator
                      α0
                      [
                        fun γ =>
                          let* err := M.copy γ in
                          let* α0 :=
                            M.get_function
                              "std::panicking::begin_panic"
                              [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
                          let* α1 :=
                            M.read
                              (mk_str
                                "Failed to `set_code_hash` to {code_hash:?} due to {err:?}") in
                          let* α2 := M.call_closure α0 [ α1 ] in
                          M.never_to_any α2
                      ]
                  | _ => M.impossible
                  end)
            ] in
        M.alloc α3 in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1"
              [] in
          let* α2 := M.read (mk_str "Switched code hash to ") in
          let* α3 := M.read (mk_str ".
") in
          let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
          let* α5 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_debug"
              [ Ty.apply (Ty.path "array") [ Ty.path "u8" ] ] in
          let* α6 := M.call_closure α5 [ code_hash ] in
          let* α7 := M.alloc (Value.Array [ α6 ]) in
          let* α8 :=
            M.call_closure
              α1
              [
                M.pointer_coercion (* Unsize *) α4;
                M.pointer_coercion (* Unsize *) α7
              ] in
          let* α9 := M.call_closure α0 [ α8 ] in
          M.alloc α9 in
        M.alloc (Value.Tuple []) in
      let* α0 := M.alloc (Value.Tuple []) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_set_code :
    M.IsAssociatedFunction Self "set_code" set_code.
End Impl_set_code_hash_Incrementer.
