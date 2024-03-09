(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn multiply<'a>(first: &'a i32, second: &'a i32) -> i32 {
    first * second
}
*)
Definition multiply (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ first; second ] =>
    let* first := M.alloc first in
    let* second := M.alloc second in
    let* α0 :=
      M.get_trait_method
        "core::ops::arith::Mul"
        "mul"
        [
          (* Self *) Ty.apply (Ty.path "&") [ Ty.path "i32" ];
          (* Rhs *) Ty.apply (Ty.path "&") [ Ty.path "i32" ]
        ] in
    let* α1 := M.read first in
    let* α2 := M.read second in
    M.call α0 [ α1; α2 ]
  | _, _ => M.impossible
  end.

(*
fn choose_first<'a: 'b, 'b>(first: &'a i32, _: &'b i32) -> &'b i32 {
    first
}
*)
Definition choose_first (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ first; arg ] =>
    let* first := M.alloc first in
    let* arg := M.alloc arg in
    M.read first
  | _, _ => M.impossible
  end.

(*
fn main() {
    let first = 2; // Longer lifetime

    {
        let second = 3; // Shorter lifetime

        println!("The product is {}", multiply(&first, &second));
        println!("{} is the first", choose_first(&first, &second));
    };
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* first := M.alloc (Value.Integer Integer.I32 2) in
    let* _ :=
      let* second := M.alloc (Value.Integer Integer.I32 3) in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1" in
          let* α2 := M.read (mk_str "The product is ") in
          let* α3 := M.read (mk_str "
") in
          let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
          let* α5 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display" in
          let* α6 :=
            M.get_function "scoping_rules_lifetimes_coercion::multiply" in
          let* α7 := M.call α6 [ first; second ] in
          let* α8 := M.alloc α7 in
          let* α9 := M.call α5 [ α8 ] in
          let* α10 := M.alloc (Value.Array [ α9 ]) in
          let* α11 :=
            M.call
              α1
              [
                M.pointer_coercion (* Unsize *) α4;
                M.pointer_coercion (* Unsize *) α10
              ] in
          let* α12 := M.call α0 [ α11 ] in
          M.alloc α12 in
        M.alloc (Value.Tuple []) in
      let* _ :=
        let* _ :=
          let* α0 := M.get_function "std::io::stdio::_print" in
          let* α1 :=
            M.get_associated_function
              (Ty.path "core::fmt::Arguments")
              "new_v1" in
          let* α2 := M.read (mk_str "") in
          let* α3 := M.read (mk_str " is the first
") in
          let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
          let* α5 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display" in
          let* α6 :=
            M.get_function "scoping_rules_lifetimes_coercion::choose_first" in
          let* α7 := M.call α6 [ first; second ] in
          let* α8 := M.alloc α7 in
          let* α9 := M.call α5 [ α8 ] in
          let* α10 := M.alloc (Value.Array [ α9 ]) in
          let* α11 :=
            M.call
              α1
              [
                M.pointer_coercion (* Unsize *) α4;
                M.pointer_coercion (* Unsize *) α10
              ] in
          let* α12 := M.call α0 [ α11 ] in
          M.alloc α12 in
        M.alloc (Value.Tuple []) in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
