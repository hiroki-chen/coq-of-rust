(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Fruit *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Apple";
        item := Tuple [];
        discriminant := None;
      };
      {
        name := "Orange";
        item := Tuple [];
        discriminant := None;
      };
      {
        name := "Banana";
        item := Tuple [];
        discriminant := None;
      };
      {
        name := "Kiwi";
        item := Tuple [];
        discriminant := None;
      };
      {
        name := "Lemon";
        item := Tuple [];
        discriminant := None;
      }
    ];
} *)

Module Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_else_Fruit.
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "unpacking_options_and_defaults_via_or_else::Fruit")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_unpacking_options_and_defaults_via_or_else_Fruit.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
