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
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "`print_one`: x is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ] in
        let* α6 := M.call_closure α5 [ x ] in
        let* α7 := M.alloc (Value.Array [ α6 ]) in
        let* α8 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α7
            ] in
        let* α9 := M.call_closure α0 [ α8 ] in
        M.alloc α9 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
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
      let* β := M.read x in
      let* α0 := M.read β in
      let* α1 := BinOp.Panic.add α0 (Value.Integer Integer.I32 1) in
      M.assign β α1 in
    let* α0 := M.alloc (Value.Tuple []) in
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
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "`print_multi`: x is ") in
        let* α3 := M.read (mk_str ", y is ") in
        let* α4 := M.read (mk_str "
") in
        let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
        let* α6 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ] in
        let* α7 := M.call_closure α6 [ x ] in
        let* α8 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display"
            [ Ty.apply (Ty.path "&") [ Ty.path "i32" ] ] in
        let* α9 := M.call_closure α8 [ y ] in
        let* α10 := M.alloc (Value.Array [ α7; α9 ]) in
        let* α11 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α5;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call_closure α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
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
  | [], [ x; β1 ] =>
    let* x := M.alloc x in
    let* β1 := M.alloc β1 in
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
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* x := M.alloc (Value.Integer Integer.I32 7) in
    let* y := M.alloc (Value.Integer Integer.I32 9) in
    let* _ :=
      let* α0 :=
        M.get_function "scoping_rules_lifetimes_functions::print_one" [] in
      let* α1 := M.call_closure α0 [ x ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_function "scoping_rules_lifetimes_functions::print_multi" [] in
      let* α1 := M.call_closure α0 [ x; y ] in
      M.alloc α1 in
    let* z :=
      let* α0 :=
        M.get_function "scoping_rules_lifetimes_functions::pass_x" [] in
      let* α1 := M.call_closure α0 [ x; y ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_function "scoping_rules_lifetimes_functions::print_one" [] in
      let* α1 := M.read z in
      let* α2 := M.call_closure α0 [ α1 ] in
      M.alloc α2 in
    let* t := M.alloc (Value.Integer Integer.I32 3) in
    let* _ :=
      let* α0 :=
        M.get_function "scoping_rules_lifetimes_functions::add_one" [] in
      let* α1 := M.call_closure α0 [ t ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_function "scoping_rules_lifetimes_functions::print_one" [] in
      let* α1 := M.call_closure α0 [ t ] in
      M.alloc α1 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
