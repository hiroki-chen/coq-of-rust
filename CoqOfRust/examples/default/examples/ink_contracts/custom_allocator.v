(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "CustomAllocator";
    ty_params := [];
    fields :=
      [
        ("value",
          Ty.apply
            (Ty.path "alloc::vec::Vec")
            [ Ty.path "bool"; Ty.path "alloc::alloc::Global" ])
      ];
  } *)

Module Impl_custom_allocator_CustomAllocator.
  Definition Self : Ty.t := Ty.path "custom_allocator::CustomAllocator".
  
  (*
      pub fn new(init_value: bool) -> Self {
          Self {
              value: vec![init_value],
          }
      }
  *)
  Definition new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ init_value ] =>
      let* init_value := M.alloc init_value in
      let* α0 :=
        M.get_associated_function
          (Ty.apply (Ty.path "slice") [ Ty.path "bool" ])
          "into_vec"
          [ Ty.path "alloc::alloc::Global" ] in
      let* α1 :=
        M.get_associated_function
          (Ty.apply
            (Ty.path "alloc::boxed::Box")
            [
              Ty.apply (Ty.path "array") [ Ty.path "bool" ];
              Ty.path "alloc::alloc::Global"
            ])
          "new"
          [] in
      let* α2 := M.read init_value in
      let* α3 := M.alloc (Value.Array [ α2 ]) in
      let* α4 := M.call_closure α1 [ α3 ] in
      let* α5 := M.read α4 in
      let* α6 := M.call_closure α0 [ M.pointer_coercion (* Unsize *) α5 ] in
      M.pure
        (Value.StructRecord
          "custom_allocator::CustomAllocator"
          [ ("value", α6) ])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      pub fn default() -> Self {
          Self::new(Default::default())
      }
  *)
  Definition default (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      let* α0 :=
        M.get_associated_function
          (Ty.path "custom_allocator::CustomAllocator")
          "new"
          [] in
      let* α1 :=
        M.get_trait_method
          "core::default::Default"
          (Ty.path "bool")
          []
          "default"
          [] in
      let* α2 := M.call_closure α1 [] in
      M.call_closure α0 [ α2 ]
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_default :
    M.IsAssociatedFunction Self "default" default.
  
  (*
      pub fn flip(&mut self) {
          self.value[0] = !self.value[0];
      }
  *)
  Definition flip (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* α0 :=
          M.get_trait_method
            "core::ops::index::IndexMut"
            (Ty.apply
              (Ty.path "alloc::vec::Vec")
              [ Ty.path "bool"; Ty.path "alloc::alloc::Global" ])
            [ Ty.path "usize" ]
            "index_mut"
            [] in
        let* α1 := M.read self in
        let* α2 :=
          M.call_closure
            α0
            [
              M.get_struct_record_field
                α1
                "custom_allocator::CustomAllocator"
                "value";
              Value.Integer Integer.Usize 0
            ] in
        let* α3 :=
          M.get_trait_method
            "core::ops::index::Index"
            (Ty.apply
              (Ty.path "alloc::vec::Vec")
              [ Ty.path "bool"; Ty.path "alloc::alloc::Global" ])
            [ Ty.path "usize" ]
            "index"
            [] in
        let* α4 := M.read self in
        let* α5 :=
          M.call_closure
            α3
            [
              M.get_struct_record_field
                α4
                "custom_allocator::CustomAllocator"
                "value";
              Value.Integer Integer.Usize 0
            ] in
        let* α6 := M.read α5 in
        M.assign α2 (UnOp.Pure.not α6) in
      let* α0 := M.alloc (Value.Tuple []) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_flip : M.IsAssociatedFunction Self "flip" flip.
  
  (*
      pub fn get(&self) -> bool {
          self.value[0]
      }
  *)
  Definition get (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        M.get_trait_method
          "core::ops::index::Index"
          (Ty.apply
            (Ty.path "alloc::vec::Vec")
            [ Ty.path "bool"; Ty.path "alloc::alloc::Global" ])
          [ Ty.path "usize" ]
          "index"
          [] in
      let* α1 := M.read self in
      let* α2 :=
        M.call_closure
          α0
          [
            M.get_struct_record_field
              α1
              "custom_allocator::CustomAllocator"
              "value";
            Value.Integer Integer.Usize 0
          ] in
      M.read α2
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_get : M.IsAssociatedFunction Self "get" get.
End Impl_custom_allocator_CustomAllocator.
