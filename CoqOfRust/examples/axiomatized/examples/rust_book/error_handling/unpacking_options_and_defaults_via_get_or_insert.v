(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
Enum Fruit
{
  ty_params := [];
  variants :=
    [
      {
        name := "Apple";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Orange";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Banana";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Kiwi";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Lemon";
        item := StructTuple [];
        discriminant := None;
      }
    ];
}
*)

Module Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_Fruit.
  Definition Self : Ty.t := Ty.path "unpacking_options_and_defaults_via_get_or_insert::Fruit".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_get_or_insert_Fruit.

Parameter main : (list Ty.t) -> (list Value.t) -> M.

Axiom Function_main : M.IsFunction "unpacking_options_and_defaults_via_get_or_insert::main" main.
