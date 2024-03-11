(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn some_fn() {
    ()
}
*)
Definition some_fn (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] => M.pure (Value.Tuple [])
  | _, _ => M.impossible
  end.

(*
fn main() {
    let a: () = some_fn();
    println!("This function returns and you can see this line.")
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* a :=
      let* α0 :=
        M.get_function
          "diverging_functions_no_info_in_return_type::some_fn"
          [] in
      let* α1 := M.call α0 [] in
      M.alloc α1 in
    let* _ :=
      let* α0 := M.get_function "std::io::stdio::_print" [] in
      let* α1 :=
        M.get_associated_function
          (Ty.path "core::fmt::Arguments")
          "new_const" in
      let* α2 :=
        M.read (mk_str "This function returns and you can see this line.
") in
      let* α3 := M.alloc (Value.Array [ α2 ]) in
      let* α4 := M.call α1 [ M.pointer_coercion (* Unsize *) α3 ] in
      let* α5 := M.call α0 [ α4 ] in
      M.alloc α5 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
