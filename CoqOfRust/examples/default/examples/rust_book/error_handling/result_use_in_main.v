(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() -> Result<(), ParseIntError> {
    let number_str = "10";
    let number = match number_str.parse::<i32>() {
        Ok(number) => number,
        Err(e) => return Err(e),
    };
    println!("{}", number);
    Ok(())
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* number_str := M.copy (mk_str "10") in
    let* number :=
      let* α0 := M.get_associated_function (Ty.path "str") "parse" [ Ty.path "i32" ] in
      let* α1 := M.read number_str in
      let* α2 := M.call_closure α0 [ α1 ] in
      let* α3 := M.alloc α2 in
      let* α4 :=
        M.match_operator
          α3
          [
            fun γ =>
              let* γ0_0 := M.get_struct_tuple_field_or_break_match γ "core::result::Result::Ok" 0 in
              let* number := M.copy γ0_0 in
              M.pure number;
            fun γ =>
              let* γ0_0 :=
                M.get_struct_tuple_field_or_break_match γ "core::result::Result::Err" 0 in
              let* e := M.copy γ0_0 in
              let* α0 := M.read e in
              let* α1 := M.return_ (Value.StructTuple "core::result::Result::Err" [ α0 ]) in
              let* α2 := M.read α1 in
              let* α3 := M.never_to_any α2 in
              M.alloc α3
          ] in
      M.copy α4 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α5 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "") in
            let* α3 := M.read (mk_str "
") in
            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
            M.pure (M.pointer_coercion α4) in
        let* α9 :=
          (* Unsize *)
            let* α6 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_display"
                [ Ty.path "i32" ] in
            let* α7 := M.call_closure α6 [ number ] in
            let* α8 := M.alloc (Value.Array [ α7 ]) in
            M.pure (M.pointer_coercion α8) in
        let* α10 := M.call_closure α1 [ α5; α9 ] in
        let* α11 := M.call_closure α0 [ α10 ] in
        M.alloc α11 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.StructTuple "core::result::Result::Ok" [ Value.Tuple [] ]) in
    M.read α0
  | _, _ => M.impossible
  end.
