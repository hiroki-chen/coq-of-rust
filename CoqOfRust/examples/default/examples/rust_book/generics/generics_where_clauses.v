(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Trait *)
(* Empty module 'PrintInOption' *)

Module Impl_generics_where_clauses_PrintInOption_for_T.
  Definition Self (T : Ty.t) : Ty.t := T.
  
  (*
      fn print_in_option(self) {
          println!("{:?}", Some(self));
      }
  *)
  Definition print_in_option (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
    let Self : Ty.t := Self T in
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          let _ :=
            let _ :=
              M.alloc (|
                M.call_closure (|
                  M.get_function (| "std::io::stdio::_print", [] |),
                  [
                    M.call_closure (|
                      M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                      [
                        (* Unsize *)
                        M.pointer_coercion
                          (M.alloc (|
                            Value.Array [ M.read (| mk_str "" |); M.read (| mk_str "
" |) ]
                          |));
                        (* Unsize *)
                        M.pointer_coercion
                          (M.alloc (|
                            Value.Array
                              [
                                M.call_closure (|
                                  M.get_associated_function (|
                                    Ty.path "core::fmt::rt::Argument",
                                    "new_debug",
                                    [ Ty.apply (Ty.path "core::option::Option") [ T ] ]
                                  |),
                                  [
                                    M.alloc (|
                                      Value.StructTuple
                                        "core::option::Option::Some"
                                        [ M.read (| self |) ]
                                    |)
                                  ]
                                |)
                              ]
                          |))
                      ]
                    |)
                  ]
                |)
              |) in
            M.alloc (| Value.Tuple [] |) in
          M.alloc (| Value.Tuple [] |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    forall (T : Ty.t),
    M.IsTraitInstance
      "generics_where_clauses::PrintInOption"
      (Self T)
      (* Trait polymorphic types *) []
      (* Instance *) [ ("print_in_option", InstanceField.Method (print_in_option T)) ].
End Impl_generics_where_clauses_PrintInOption_for_T.

(*
fn main() {
    let vec = vec![1, 2, 3];

    vec.print_in_option();
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let vec :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply (Ty.path "slice") [ Ty.path "i32" ],
                "into_vec",
                [ Ty.path "alloc::alloc::Global" ]
              |),
              [
                (* Unsize *)
                M.pointer_coercion
                  (M.read (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply
                          (Ty.path "alloc::boxed::Box")
                          [
                            Ty.apply (Ty.path "array") [ Ty.path "i32" ];
                            Ty.path "alloc::alloc::Global"
                          ],
                        "new",
                        []
                      |),
                      [
                        M.alloc (|
                          Value.Array
                            [
                              Value.Integer Integer.I32 1;
                              Value.Integer Integer.I32 2;
                              Value.Integer Integer.I32 3
                            ]
                        |)
                      ]
                    |)
                  |))
              ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_trait_method (|
                "generics_where_clauses::PrintInOption",
                Ty.apply
                  (Ty.path "alloc::vec::Vec")
                  [ Ty.path "i32"; Ty.path "alloc::alloc::Global" ],
                [],
                "print_in_option",
                []
              |),
              [ M.read (| vec |) ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.
