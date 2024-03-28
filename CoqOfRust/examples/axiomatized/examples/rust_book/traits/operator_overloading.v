(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Foo";
    ty_params := [];
  } *)

(* StructTuple
  {
    name := "Bar";
    ty_params := [];
  } *)

(* StructTuple
  {
    name := "FooBar";
    ty_params := [];
  } *)

Module Impl_core_fmt_Debug_for_operator_overloading_FooBar.
  Definition Self : Ty.t := Ty.path "operator_overloading::FooBar".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_operator_overloading_FooBar.

(* StructTuple
  {
    name := "BarFoo";
    ty_params := [];
  } *)

Module Impl_core_fmt_Debug_for_operator_overloading_BarFoo.
  Definition Self : Ty.t := Ty.path "operator_overloading::BarFoo".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_operator_overloading_BarFoo.

Module Impl_core_ops_arith_Add_operator_overloading_Bar_for_operator_overloading_Foo.
  Definition Self : Ty.t := Ty.path "operator_overloading::Foo".
  
  Definition Output : Ty.t := Ty.path "operator_overloading::FooBar".
  
  Parameter add : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::ops::arith::Add"
      Self
      (* Trait polymorphic types *)
        [ (* Rhs *) Ty.path "operator_overloading::Bar" ]
      (* Instance *)
        [ ("Output", InstanceField.Ty Output); ("add", InstanceField.Method add)
        ].
End Impl_core_ops_arith_Add_operator_overloading_Bar_for_operator_overloading_Foo.

Module Impl_core_ops_arith_Add_operator_overloading_Foo_for_operator_overloading_Bar.
  Definition Self : Ty.t := Ty.path "operator_overloading::Bar".
  
  Definition Output : Ty.t := Ty.path "operator_overloading::BarFoo".
  
  Parameter add : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::ops::arith::Add"
      Self
      (* Trait polymorphic types *)
        [ (* Rhs *) Ty.path "operator_overloading::Foo" ]
      (* Instance *)
        [ ("Output", InstanceField.Ty Output); ("add", InstanceField.Method add)
        ].
End Impl_core_ops_arith_Add_operator_overloading_Foo_for_operator_overloading_Bar.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
