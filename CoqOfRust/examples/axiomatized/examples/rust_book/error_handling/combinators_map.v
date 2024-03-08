(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Food *)

Module Impl_core_fmt_Debug_for_combinators_map_Food.
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "combinators_map::Food")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_combinators_map_Food.

(* Struct Peeled *)

Module Impl_core_fmt_Debug_for_combinators_map_Peeled.
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "combinators_map::Peeled")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_combinators_map_Peeled.

(* Struct Chopped *)

Module Impl_core_fmt_Debug_for_combinators_map_Chopped.
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "combinators_map::Chopped")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_combinators_map_Chopped.

(* Struct Cooked *)

Module Impl_core_fmt_Debug_for_combinators_map_Cooked.
  Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "combinators_map::Cooked")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_combinators_map_Cooked.

Parameter peel : (list Ty.t) -> (list Value.t) -> M.

Parameter chop : (list Ty.t) -> (list Value.t) -> M.

Parameter cook : (list Ty.t) -> (list Value.t) -> M.

Parameter process : (list Ty.t) -> (list Value.t) -> M.

Parameter eat : (list Ty.t) -> (list Value.t) -> M.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : (list Ty.t) -> (list Value.t) -> M.
