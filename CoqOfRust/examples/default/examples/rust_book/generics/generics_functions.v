(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Struct A *)

(* Struct S *)

(* Struct SGen *)

(*
fn reg_fn(_s: S) {}
*)
Definition reg_fn (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ _s ] =>
    let* _s := M.alloc _s in
    M.pure (Value.Tuple [])
  | _, _ => M.impossible
  end.

(*
fn gen_spec_t(_s: SGen<A>) {}
*)
Definition gen_spec_t (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ _s ] =>
    let* _s := M.alloc _s in
    M.pure (Value.Tuple [])
  | _, _ => M.impossible
  end.

(*
fn gen_spec_i32(_s: SGen<i32>) {}
*)
Definition gen_spec_i32 (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ _s ] =>
    let* _s := M.alloc _s in
    M.pure (Value.Tuple [])
  | _, _ => M.impossible
  end.

(*
fn generic<T>(_s: SGen<T>) {}
*)
Definition generic (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [ T ], [ _s ] =>
    let* _s := M.alloc _s in
    M.pure (Value.Tuple [])
  | _, _ => M.impossible
  end.

(*
fn main() {
    // Using the non-generic functions
    reg_fn(S(A)); // Concrete type.
    gen_spec_t(SGen(A)); // Implicitly specified type parameter `A`.
    gen_spec_i32(SGen(6)); // Implicitly specified type parameter `i32`.

    // Explicitly specified type parameter `char` to `generic()`.
    generic::<char>(SGen('a'));

    // Implicitly specified type parameter `char` to `generic()`.
    generic(SGen('c'));
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* α0 := M.get_function "generics_functions::reg_fn" [] in
      let* α1 :=
        M.call
          α0
          [
            Value.StructTuple
              "generics_functions::S"
              [ Value.StructTuple "generics_functions::A" [] ]
          ] in
      M.alloc α1 in
    let* _ :=
      let* α0 := M.get_function "generics_functions::gen_spec_t" [] in
      let* α1 :=
        M.call
          α0
          [
            Value.StructTuple
              "generics_functions::SGen"
              [ Value.StructTuple "generics_functions::A" [] ]
          ] in
      M.alloc α1 in
    let* _ :=
      let* α0 := M.get_function "generics_functions::gen_spec_i32" [] in
      let* α1 :=
        M.call
          α0
          [
            Value.StructTuple
              "generics_functions::SGen"
              [ Value.Integer Integer.I32 6 ]
          ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_function "generics_functions::generic" [ Ty.path "char" ] in
      let* α1 :=
        M.call
          α0
          [
            Value.StructTuple
              "generics_functions::SGen"
              [ Value.UnicodeChar 97 ]
          ] in
      M.alloc α1 in
    let* _ :=
      let* α0 :=
        M.get_function "generics_functions::generic" [ Ty.path "char" ] in
      let* α1 :=
        M.call
          α0
          [
            Value.StructTuple
              "generics_functions::SGen"
              [ Value.UnicodeChar 99 ]
          ] in
      M.alloc α1 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
