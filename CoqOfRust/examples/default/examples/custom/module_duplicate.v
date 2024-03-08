(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module foo.
  Module gre.
    (*
            pub fn f_foo_gre() {
                println!("foo::gre::bar");
            }
    *)
    Definition f_foo_gre (𝜏 : list Ty.t) (α : list Value.t) : M :=
      match 𝜏, α with
      | [], [] =>
        let* _ :=
          let* _ :=
            let* α0 := M.var "std::io::stdio::_print" in
            let* α1 := M.read (mk_str "foo::gre::bar
") in
            let* α2 := M.alloc [ α1 ] in
            let* α3 :=
              M.call
                (Ty.path "core::fmt::Arguments")::["new_const"]
                [ M.pointer_coercion "Unsize" α2 ] in
            let* α4 := M.call α0 [ α3 ] in
            M.alloc α4 in
          M.alloc tt in
        let* α0 := M.alloc tt in
        M.read α0
      | _, _ => M.impossible
      end.
  End gre.
  
  (*
      pub fn f_foo() {
          println!("foo::bar");
          gre::f_foo_gre();
      }
  *)
  Definition f_foo (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* _ :=
        let* _ :=
          let* α0 := M.var "std::io::stdio::_print" in
          let* α1 := M.read (mk_str "foo::bar
") in
          let* α2 := M.alloc [ α1 ] in
          let* α3 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_const"]
              [ M.pointer_coercion "Unsize" α2 ] in
          let* α4 := M.call α0 [ α3 ] in
          M.alloc α4 in
        M.alloc tt in
      let* _ :=
        let* α0 := M.var "module_duplicate::foo::gre::f_foo_gre" in
        let* α1 := M.call α0 [] in
        M.alloc α1 in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
End foo.

(*
fn f() {
    foo::f_foo();
}
*)
Definition f (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* α0 := M.var "module_duplicate::foo::f_foo" in
      let* α1 := M.call α0 [] in
      M.alloc α1 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
