(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "Empty";
    ty_params := [];
    fields := [];
  } *)

(* StructTuple
  {
    name := "Null";
    ty_params := [];
    fields := [];
  } *)

(* Trait *)
(* Empty module 'DoubleDrop' *)

Module Impl_generics_traits_DoubleDrop_T_for_U.
  Definition Self (T U : Ty.t) : Ty.t := U.
  
  (*     fn double_drop(self, _: T) {} *)
  Definition double_drop (T U : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
    let Self : Ty.t := Self T U in
    match τ, α with
    | [], [ self; β1 ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let β1 := M.alloc (| β1 |) in
        M.match_operator (| β1, [ fun γ => ltac:(M.monadic (Value.Tuple [])) ] |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (T U : Ty.t),
    M.IsTraitInstance
      "generics_traits::DoubleDrop"
      (Self T U)
      (* Trait polymorphic types *) [ (* T *) T ]
      (* Instance *) [ ("double_drop", InstanceField.Method (double_drop T U)) ].
End Impl_generics_traits_DoubleDrop_T_for_U.

(*
fn main() {
    let empty = Empty;
    let null = Null;

    // Deallocate `empty` and `null`.
    empty.double_drop(null);

    //empty;
    //null;
    // ^ TODO: Try uncommenting these lines.
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let empty := M.alloc (| Value.StructTuple "generics_traits::Empty" [] |) in
        let null := M.alloc (| Value.StructTuple "generics_traits::Null" [] |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "generics_traits::DoubleDrop",
                Ty.path "generics_traits::Empty",
                [ Ty.path "generics_traits::Null" ],
                "double_drop",
                []
              |),
              [ M.read (| empty |); M.read (| null |) ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
