(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructTuple
  {
    name := "A";
    ty_params := [];
  } *)

(* StructTuple
  {
    name := "Single";
    ty_params := [];
    fields := [ Ty.path "generics::A" ];
  } *)

(* StructTuple
  {
    name := "SingleGen";
    ty_params := [ "T" ];
    fields := [ T ];
  } *)

(*
fn main() {
    // `Single` is concrete and explicitly takes `A`.
    let _s = Single(A);

    // Create a variable `_char` of type `SingleGen<char>`
    // and give it the value `SingleGen('a')`.
    // Here, `SingleGen` has a type parameter explicitly specified.
    let _char: SingleGen<char> = SingleGen('a');

    // `SingleGen` can also have a type parameter implicitly specified:
    let _t = SingleGen(A); // Uses `A` defined at the top.
    let _i32 = SingleGen(6); // Uses `i32`.
    let _char = SingleGen('a'); // Uses `char`.
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* _s :=
      M.alloc (Value.StructTuple "generics::Single" [ Value.StructTuple "generics::A" [] ]) in
    let* _char := M.alloc (Value.StructTuple "generics::SingleGen" [ Value.UnicodeChar 97 ]) in
    let* _t :=
      M.alloc (Value.StructTuple "generics::SingleGen" [ Value.StructTuple "generics::A" [] ]) in
    let* _i32 :=
      M.alloc (Value.StructTuple "generics::SingleGen" [ Value.Integer Integer.I32 6 ]) in
    let* _char := M.alloc (Value.StructTuple "generics::SingleGen" [ Value.UnicodeChar 97 ]) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
