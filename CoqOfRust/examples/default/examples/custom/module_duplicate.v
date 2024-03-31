(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module foo.
  Module gre.
    (*
            pub fn f_foo_gre() {
                println!("foo::gre::bar");
            }
    *)
    Definition f_foo_gre (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [] =>
        let* _ :=
          let* _ :=
            let* α0 := M.get_function "std::io::stdio::_print" [] in
            let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
            let* α4 :=
              (* Unsize *)
                let* α2 := M.read (mk_str "foo::gre::bar
") in
                let* α3 := M.alloc (Value.Array [ α2 ]) in M.pure (M.pointer_coercion α3) in
            let* α5 := M.call_closure α1 [ α4 ] in
            let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
          M.alloc (Value.Tuple []) in
        let* α0 := M.alloc (Value.Tuple []) in M.read α0
      | _, _ => M.impossible
      end.
  End gre.
  
  (*
      pub fn f_foo() {
          println!("foo::bar");
          gre::f_foo_gre();
      }
  *)
  Definition f_foo (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] =>
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" [] in
          let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_const" [] in
          let* α4 :=
            (* Unsize *)
              let* α2 := M.read (mk_str "foo::bar
") in
              let* α3 := M.alloc (Value.Array [ α2 ]) in M.pure (M.pointer_coercion α3) in
          let* α5 := M.call_closure α1 [ α4 ] in
          let* α6 := M.call_closure α0 [ α5 ] in M.alloc α6 in
        M.alloc (Value.Tuple []) in
      let* _ :=
        let* α0 := M.get_function "module_duplicate::foo::gre::f_foo_gre" [] in
        let* α1 := M.call_closure α0 [] in M.alloc α1 in
      let* α0 := M.alloc (Value.Tuple []) in M.read α0
    | _, _ => M.impossible
    end.
End foo.

(*
fn f() {
    foo::f_foo();
}
*)
Definition f (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* _ :=
      let* α0 := M.get_function "module_duplicate::foo::f_foo" [] in
      let* α1 := M.call_closure α0 [] in M.alloc α1 in
    let* α0 := M.alloc (Value.Tuple []) in M.read α0
  | _, _ => M.impossible
  end.
