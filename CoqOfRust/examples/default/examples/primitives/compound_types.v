(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Variables can be type annotated.
    let logical: bool = true;

    let a_float: f64 = 1.0;  // Regular annotation
    let an_integer   = 5i32; // Suffix annotation

    // Or a default will be used.
    let default_float   = 3.0; // `f64`
    let default_integer = 7;   // `i32`
    
    // A type can also be inferred from context 
    let mut inferred_type = 12; // Type i64 is inferred from another line
    inferred_type = 4294967296i64;
    
    // A mutable variable's value can be changed.
    let mut mutable = 12; // Mutable `i32`
    mutable = 21;
    
    // Error! The type of a variable can't be changed.
    // mutable = true;
    
    // Variables can be overwritten with shadowing.
    let mutable = true;
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M unit :=
  M.function_body
    (let* logical : M.Val bool.t :=
      let* α0 : M.Val bool.t := M.alloc true in
      M.copy α0 in
    let* a_float : M.Val f64.t :=
      let* α0 : M.Val f64.t := M.alloc 1 (* 1.0 *) in
      M.copy α0 in
    let* an_integer : M.Val i32.t :=
      let* α0 : M.Val i32.t := M.alloc 5 in
      M.copy α0 in
    let* default_float : M.Val f64.t :=
      let* α0 : M.Val f64.t := M.alloc 3 (* 3.0 *) in
      M.copy α0 in
    let* default_integer : M.Val i32.t :=
      let* α0 : M.Val i32.t := M.alloc 7 in
      M.copy α0 in
    let* inferred_type : M.Val i64.t :=
      let* α0 : M.Val i64.t := M.alloc 12 in
      M.copy α0 in
    let* _ : M.Val unit :=
      let* α0 : M.Val i64.t := M.alloc 4294967296 in
      let* α1 : i64.t := M.read α0 in
      assign inferred_type α1 in
    let* mutable : M.Val i32.t :=
      let* α0 : M.Val i32.t := M.alloc 12 in
      M.copy α0 in
    let* _ : M.Val unit :=
      let* α0 : M.Val i32.t := M.alloc 21 in
      let* α1 : i32.t := M.read α0 in
      assign mutable α1 in
    let* mutable : M.Val bool.t :=
      let* α0 : M.Val bool.t := M.alloc true in
      M.copy α0 in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0).
