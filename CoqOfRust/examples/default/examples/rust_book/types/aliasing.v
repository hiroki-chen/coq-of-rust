(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Axiom NanoSecond : (Ty.path "aliasing::NanoSecond") = (Ty.path "u64").

Axiom Inch : (Ty.path "aliasing::Inch") = (Ty.path "u64").

Axiom U64 : (Ty.path "aliasing::U64") = (Ty.path "u64").

(*
fn main() {
    // `NanoSecond` = `Inch` = `U64` = `u64`.
    let nanoseconds: NanoSecond = 5 as U64;
    let inches: Inch = 2 as U64;

    // Note that type aliases *don't* provide any extra type safety, because
    // aliases are *not* new types
    println!(
        "{} nanoseconds + {} inches = {} unit?",
        nanoseconds,
        inches,
        nanoseconds + inches
    );
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* nanoseconds :=
      let* α0 := M.alloc (Value.Integer Integer.U64 5) in
      M.copy (M.use α0) in
    let* inches :=
      let* α0 := M.alloc (Value.Integer Integer.U64 2) in
      M.copy (M.use α0) in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "") in
        let* α2 := M.read (mk_str " nanoseconds + ") in
        let* α3 := M.read (mk_str " inches = ") in
        let* α4 := M.read (mk_str " unit?
") in
        let* α5 := M.alloc [ α1; α2; α3; α4 ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ nanoseconds ] in
        let* α7 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ inches ] in
        let* α8 := M.read nanoseconds in
        let* α9 := M.read inches in
        let* α10 := BinOp.Panic.add α8 α9 in
        let* α11 := M.alloc α10 in
        let* α12 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_display"] [ α11 ] in
        let* α13 := M.alloc [ α6; α7; α12 ] in
        let* α14 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ M.pointer_coercion "Unsize" α5; M.pointer_coercion "Unsize" α13
            ] in
        let* α15 := M.call α0 [ α14 ] in
        M.alloc α15 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
