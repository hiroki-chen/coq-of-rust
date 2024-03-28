(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Food *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Apple";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Carrot";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Potato";
        item := StructTuple [];
        discriminant := None;
      }
    ];
} *)

Module Impl_core_fmt_Debug_for_combinators_map_Food.
  Definition Self : Ty.t := Ty.path "combinators_map::Food".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_combinators_map_Food.

(* StructTuple
  {
    name := "Peeled";
    ty_params := [];
    fields := [ Ty.path "combinators_map::Food" ];
  } *)

Module Impl_core_fmt_Debug_for_combinators_map_Peeled.
  Definition Self : Ty.t := Ty.path "combinators_map::Peeled".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_combinators_map_Peeled.

(* StructTuple
  {
    name := "Chopped";
    ty_params := [];
    fields := [ Ty.path "combinators_map::Food" ];
  } *)

Module Impl_core_fmt_Debug_for_combinators_map_Chopped.
  Definition Self : Ty.t := Ty.path "combinators_map::Chopped".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_combinators_map_Chopped.

(* StructTuple
  {
    name := "Cooked";
    ty_params := [];
    fields := [ Ty.path "combinators_map::Food" ];
  } *)

Module Impl_core_fmt_Debug_for_combinators_map_Cooked.
  Definition Self : Ty.t := Ty.path "combinators_map::Cooked".
  
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_combinators_map_Cooked.

Parameter peel : (list Ty.t) -> (list Value.t) -> M.

Parameter chop : (list Ty.t) -> (list Value.t) -> M.

Parameter cook : (list Ty.t) -> (list Value.t) -> M.

Parameter process : (list Ty.t) -> (list Value.t) -> M.

Parameter eat : (list Ty.t) -> (list Value.t) -> M.

Parameter main : (list Ty.t) -> (list Value.t) -> M.
