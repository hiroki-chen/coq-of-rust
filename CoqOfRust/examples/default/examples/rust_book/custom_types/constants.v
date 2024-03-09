(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition LANGUAGE
    : Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] :=
  M.run (M.alloc (mk_str "Rust")).

Definition THRESHOLD : Ty.path "i32" :=
  M.run (M.alloc (Value.Integer Integer.I32 10)).

(*
fn is_big(n: i32) -> bool {
    // Access constant in some function
    n > THRESHOLD
}
*)
Definition is_big (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ n ] =>
    let* n := M.alloc n in
    let* α0 := M.read n in
    let* α1 := M.var "constants::THRESHOLD" in
    let* α2 := M.read α1 in
    M.pure (BinOp.Pure.gt α0 α2)
  | _, _ => M.impossible
  end.

(*
fn main() {
    let n = 16;

    // Access constant in the main thread
    println!("This is {}", LANGUAGE);
    println!("The threshold is {}", THRESHOLD);
    println!("{} is {}", n, if is_big(n) { "big" } else { "small" });

    // Error! Cannot modify a `const`.
    // THRESHOLD = 5;
    // FIXME ^ Comment out this line
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* n := M.alloc (Value.Integer Integer.I32 16) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "This is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 := M.var "constants::LANGUAGE" in
        let* α7 := M.read α6 in
        let* α8 := M.call α5 [ α7 ] in
        let* α9 := M.alloc (Value.Array [ α8 ]) in
        let* α10 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α9
            ] in
        let* α11 := M.call α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "The threshold is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α6 := M.var "constants::THRESHOLD" in
        let* α7 := M.call α5 [ α6 ] in
        let* α8 := M.alloc (Value.Array [ α7 ]) in
        let* α9 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α8
            ] in
        let* α10 := M.call α0 [ α9 ] in
        M.alloc α10 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" in
        let* α1 :=
          M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" in
        let* α2 := M.read (mk_str "") in
        let* α3 := M.read (mk_str " is ") in
        let* α4 := M.read (mk_str "
") in
        let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
        let* α6 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α7 := M.call α6 [ n ] in
        let* α8 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_display" in
        let* α9 := M.get_function "constants::is_big" in
        let* α10 := M.read n in
        let* α11 := M.call α9 [ α10 ] in
        let* α12 := M.alloc α11 in
        let* α13 := M.read (M.use α12) in
        let* α14 :=
          if Value.is_true α13 then
            M.pure (mk_str "big")
          else
            let* α0 := M.read (mk_str "small") in
            M.alloc α0 in
        let* α15 := M.call α8 [ α14 ] in
        let* α16 := M.alloc (Value.Array [ α7; α15 ]) in
        let* α17 :=
          M.call
            α1
            [
              M.pointer_coercion (* Unsize *) α5;
              M.pointer_coercion (* Unsize *) α16
            ] in
        let* α18 := M.call α0 [ α17 ] in
        M.alloc α18 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
