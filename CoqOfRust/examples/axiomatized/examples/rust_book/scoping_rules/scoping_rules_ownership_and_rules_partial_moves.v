(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter main : (list Ty.t) -> (list Value.t) -> M.

Module main.
  (* StructRecord
    {
      name := "Person";
      ty_params := [];
      fields :=
        [
          ("name", Ty.path "alloc::string::String");
          ("age",
            Ty.apply (Ty.path "alloc::boxed::Box") [ Ty.path "u8"; Ty.path "alloc::alloc::Global" ])
        ];
    } *)
  
  Module Impl_core_fmt_Debug_for_scoping_rules_ownership_and_rules_partial_moves_main_Person.
    Definition Self : Ty.t :=
      Ty.path "scoping_rules_ownership_and_rules_partial_moves::main::Person".
    
    Parameter fmt : (list Ty.t) -> (list Value.t) -> M.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::fmt::Debug"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
  End Impl_core_fmt_Debug_for_scoping_rules_ownership_and_rules_partial_moves_main_Person.
End main.
