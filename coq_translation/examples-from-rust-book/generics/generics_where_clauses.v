(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module Debug := std.fmt.Debug.

Module PrintInOption.
  Class Class (Self : Set) : Set := {
    print_in_option : Self -> _;
  }.
  
  Global Instance M_print_in_option `(Class) : Method "print_in_option" _ := {|
    method := print_in_option;
  |}.
  Class AssociatedFunction (name : string) (T : Set) : Set := {
    associated_function : T;
  }.
  Arguments associated_function name {T AssociatedFunction}.
End PrintInOption.

Module Impl_PrintInOption_for_T.
  Definition Self := T.
  
  Definition print_in_option (self : Self) :=
    _crate.io._print
      (_crate.fmt.ImplArguments.new_v1
        [ ""; "\n" ]
        [ _crate.fmt.ImplArgumentV1.new_debug (Some self) ]) ;;
    tt ;;
    tt.
  
  Global Instance M_print_in_option : Method "print_in_option" _ := {|
    method := print_in_option;
  |}.
  Global Instance
    AF_print_in_option
    :
    T.AssociatedFunction
    "print_in_option"
    _
    :=
    {|
    T.associated_function := print_in_option;
  |}.
  Global Instance
    AFT_print_in_option
    :
    PrintInOption.AssociatedFunction
    "print_in_option"
    _
    :=
    {|
    PrintInOption.associated_function := print_in_option;
  |}.
  
  Global Instance I T : PrintInOption.Class Self := {|
    PrintInOption.print_in_option := print_in_option;
  |}.
End Impl_PrintInOption_for_T.

Definition main (_ : unit) : unit :=
  let vec := ComplexTypePath.into_vec [ 1; 2; 3 ] in
  method "print_in_option" vec ;;
  tt.
