(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "ToDrop";
    ty_params := [];
    fields := [];
  } *)

Module Impl_core_ops_drop_Drop_for_scoping_rules_raii_desctructor_ToDrop.
  Definition Self : Ty.t := Ty.path "scoping_rules_raii_desctructor::ToDrop".
  
  (*
      fn drop(&mut self) {
          println!("ToDrop is being dropped");
      }
  *)
  Definition drop (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          let~ _ :=
            let~ _ :=
              M.alloc (|
                M.call_closure (|
                  M.get_function (| "std::io::stdio::_print", [] |),
                  [
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "core::fmt::Arguments",
                        "new_const",
                        []
                      |),
                      [
                        (* Unsize *)
                        M.pointer_coercion
                          (M.alloc (|
                            Value.Array [ M.read (| Value.String "ToDrop is being dropped
" |) ]
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
    M.IsTraitInstance
      "core::ops::drop::Drop"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("drop", InstanceField.Method drop) ].
End Impl_core_ops_drop_Drop_for_scoping_rules_raii_desctructor_ToDrop.

(*
fn main() {
    let x = ToDrop;
    println!("Made a ToDrop!");
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let~ x := M.alloc (| Value.StructTuple "scoping_rules_raii_desctructor::ToDrop" [] |) in
        let~ _ :=
          let~ _ :=
            M.alloc (|
              M.call_closure (|
                M.get_function (| "std::io::stdio::_print", [] |),
                [
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_const", [] |),
                    [
                      (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (| Value.Array [ M.read (| Value.String "Made a ToDrop!
" |) ] |))
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

Axiom Function_main : M.IsFunction "scoping_rules_raii_desctructor::main" main.
