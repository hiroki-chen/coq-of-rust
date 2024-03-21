(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "SomeType";
    ty_params := [];
    fields := [ Ty.path "u32" ];
  } *)

(* StructTuple
  {
    name := "OtherType";
    ty_params := [];
    fields := [ Ty.path "bool" ];
  } *)

Module Impl_functions_order_SomeType.
  Definition Self : Ty.t := Ty.path "functions_order::SomeType".
  
  (*
      pub fn meth1(self) {
          self.meth2();
      }
  *)
  Definition meth1 (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* _ :=
        let* α0 :=
          M.get_associated_function
            (Ty.path "functions_order::SomeType")
            "meth2"
            [] in
        let* α1 := M.read self in
        let* α2 := M.call_closure α0 [ α1 ] in
        M.alloc α2 in
      let* α0 := M.alloc (Value.Tuple []) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_meth1 : M.IsAssociatedFunction Self "meth1" meth1.
  
  (*
      fn meth2(self) {}
  *)
  Definition meth2 (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      M.pure (Value.Tuple [])
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_meth2 : M.IsAssociatedFunction Self "meth2" meth2.
End Impl_functions_order_SomeType.

(*
fn depends_on_trait_impl(u: u32, b: bool) {
    OtherType(b).some_trait_foo();
    SomeType(u).some_trait_foo();
}
*)
Definition depends_on_trait_impl (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ u; b ] =>
    let* u := M.alloc u in
    let* b := M.alloc b in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "functions_order::SomeTrait"
          (Ty.path "functions_order::OtherType")
          []
          "some_trait_foo"
          [] in
      let* α1 := M.read b in
      let* α2 :=
        M.alloc (Value.StructTuple "functions_order::OtherType" [ α1 ]) in
      let* α3 := M.call_closure α0 [ α2 ] in
      M.alloc α3 in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "functions_order::SomeTrait"
          (Ty.path "functions_order::SomeType")
          []
          "some_trait_foo"
          [] in
      let* α1 := M.read u in
      let* α2 :=
        M.alloc (Value.StructTuple "functions_order::SomeType" [ α1 ]) in
      let* α3 := M.call_closure α0 [ α2 ] in
      M.alloc α3 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.

(* Trait *)
Module SomeTrait.
  
End SomeTrait.

Module Impl_functions_order_SomeTrait_for_functions_order_SomeType.
  Definition Self : Ty.t := Ty.path "functions_order::SomeType".
  
  (*
      fn some_trait_foo(&self) {
          self.some_trait_bar()
      }
  *)
  Definition some_trait_foo (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        M.get_trait_method
          "functions_order::SomeTrait"
          (Ty.path "functions_order::SomeType")
          []
          "some_trait_bar"
          [] in
      let* α1 := M.read self in
      M.call_closure α0 [ α1 ]
    | _, _ => M.impossible
    end.
  
  (*
      fn some_trait_bar(&self) {}
  *)
  Definition some_trait_bar (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      M.pure (Value.Tuple [])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "functions_order::SomeTrait"
      (* Self *) (Ty.path "functions_order::SomeType")
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("some_trait_foo", InstanceField.Method some_trait_foo);
          ("some_trait_bar", InstanceField.Method some_trait_bar)
        ].
End Impl_functions_order_SomeTrait_for_functions_order_SomeType.

Module Impl_functions_order_SomeTrait_for_functions_order_OtherType.
  Definition Self : Ty.t := Ty.path "functions_order::OtherType".
  
  (*
      fn some_trait_foo(&self) {}
  *)
  Definition some_trait_foo (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      M.pure (Value.Tuple [])
    | _, _ => M.impossible
    end.
  
  (*
      fn some_trait_bar(&self) {}
  *)
  Definition some_trait_bar (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      M.pure (Value.Tuple [])
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "functions_order::SomeTrait"
      (* Self *) (Ty.path "functions_order::OtherType")
      (* Trait polymorphic types *) []
      (* Instance *)
        [
          ("some_trait_foo", InstanceField.Method some_trait_foo);
          ("some_trait_bar", InstanceField.Method some_trait_bar)
        ].
End Impl_functions_order_SomeTrait_for_functions_order_OtherType.

Module inner_mod.
  (*
      pub fn bar() {
          // functions_order::inner_mod::bar
          tar();
      }
  *)
  Definition bar (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* _ :=
        let* α0 := M.get_function "functions_order::inner_mod::tar" [] in
        let* α1 := M.call_closure α0 [] in
        M.alloc α1 in
      let* α0 := M.alloc (Value.Tuple []) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  (*
      fn tar() {}
  *)
  Definition tar (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] => M.pure (Value.Tuple [])
    | _, _ => M.impossible
    end.
  
  Module nested_mod.
    (*
            pub fn tick() {
                tack();
            }
    *)
    Definition tick (𝜏 : list Ty.t) (α : list Value.t) : M :=
      match 𝜏, α with
      | [], [] =>
        let* _ :=
          let* α0 :=
            M.get_function "functions_order::inner_mod::nested_mod::tack" [] in
          let* α1 := M.call_closure α0 [] in
          M.alloc α1 in
        let* α0 := M.alloc (Value.Tuple []) in
        M.read α0
      | _, _ => M.impossible
      end.
    
    (*
            fn tack() {}
    *)
    Definition tack (𝜏 : list Ty.t) (α : list Value.t) : M :=
      match 𝜏, α with
      | [], [] => M.pure (Value.Tuple [])
      | _, _ => M.impossible
      end.
  End nested_mod.
End inner_mod.

(*
fn main() {
    // functions_order::main
    foo();
    inner_mod::bar();
    SomeType(0).meth1();
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* α0 := M.get_function "functions_order::foo" [] in
      let* α1 := M.call_closure α0 [] in
      M.alloc α1 in
    let* _ :=
      let* α0 := M.get_function "functions_order::inner_mod::bar" [] in
      let* α1 := M.call_closure α0 [] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_associated_function
          (Ty.path "functions_order::SomeType")
          "meth1"
          [] in
      let* α1 :=
        M.call_closure
          α0
          [
            Value.StructTuple
              "functions_order::SomeType"
              [ Value.Integer Integer.U32 0 ]
          ] in
      M.alloc α1 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn foo() {}
*)
Definition foo (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] => M.pure (Value.Tuple [])
  | _, _ => M.impossible
  end.
