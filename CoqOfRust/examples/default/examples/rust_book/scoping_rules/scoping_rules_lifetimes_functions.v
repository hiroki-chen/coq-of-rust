(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn print_one<'a>(x: &'a i32) {
    println!("`print_one`: x is {}", x);
}
*)
Definition print_one (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ x ] =>
    let* x := M.alloc x in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "`print_one`: x is ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ borrow x ] in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α3);
              pointer_coercion "Unsize" (borrow α5)
            ] in
        let* α7 := M.call α0 [ α6 ] in
        M.alloc α7 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn add_one<'a>(x: &'a mut i32) {
    *x += 1;
}
*)
Definition add_one (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ x ] =>
    let* x := M.alloc x in
    let* _ :=
      let* β :=
        let* α0 := M.read x in
        M.pure (deref α0) in
      let* α0 := M.var "assign" in
      let* α1 := M.var "BinOp::Panic::add" in
      let* α2 := M.read β in
      let* α3 := α1 α2 ((Integer.of_Z 1) : Ty.path "i32") in
      α0 β α3 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn print_multi<'a, 'b>(x: &'a i32, y: &'b i32) {
    println!("`print_multi`: x is {}, y is {}", x, y);
}
*)
Definition print_multi (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ x; y ] =>
    let* x := M.alloc x in
    let* y := M.alloc y in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "`print_multi`: x is ") in
        let* α2 := M.read (mk_str ", y is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc [ α1; α2; α3 ] in
        let* α5 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ borrow x ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ borrow y ] in
        let* α7 := M.alloc [ α5; α6 ] in
        let* α8 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α4);
              pointer_coercion "Unsize" (borrow α7)
            ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn pass_x<'a, 'b>(x: &'a i32, _: &'b i32) -> &'a i32 {
    x
}
*)
Definition pass_x (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ x; arg ] =>
    let* x := M.alloc x in
    let* arg := M.alloc arg in
    M.read x
  | _, _ => M.impossible
  end.

(*
fn main() {
    let x = 7;
    let y = 9;

    print_one(&x);
    print_multi(&x, &y);

    let z = pass_x(&x, &y);
    print_one(z);

    let mut t = 3;
    add_one(&mut t);
    print_one(&t);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* x := M.alloc ((Integer.of_Z 7) : Ty.path "i32") in
    let* y := M.alloc ((Integer.of_Z 9) : Ty.path "i32") in
    let* _ :=
      let* α0 := M.var "scoping_rules_lifetimes_functions::print_one" in
      let* α1 := M.call α0 [ borrow x ] in
      M.alloc α1 in
    let* _ :=
      let* α0 := M.var "scoping_rules_lifetimes_functions::print_multi" in
      let* α1 := M.call α0 [ borrow x; borrow y ] in
      M.alloc α1 in
    let* z :=
      let* α0 := M.var "scoping_rules_lifetimes_functions::pass_x" in
      let* α1 := M.call α0 [ borrow x; borrow y ] in
      M.alloc α1 in
    let* _ :=
      let* α0 := M.var "scoping_rules_lifetimes_functions::print_one" in
      let* α1 := M.read z in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* t := M.alloc ((Integer.of_Z 3) : Ty.path "i32") in
    let* _ :=
      let* α0 := M.var "scoping_rules_lifetimes_functions::add_one" in
      let* α1 := M.call α0 [ borrow_mut t ] in
      M.alloc α1 in
    let* _ :=
      let* α0 := M.var "scoping_rules_lifetimes_functions::print_one" in
      let* α1 := M.call α0 [ borrow t ] in
      M.alloc α1 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
