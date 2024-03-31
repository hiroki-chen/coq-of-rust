(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    test!(1i32 + 1 == 2i32; and 2i32 * 2 == 4i32);
    test!(true; or false);
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α7 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "") in
            let* α3 := M.read (mk_str " and ") in
            let* α4 := M.read (mk_str " is ") in
            let* α5 := M.read (mk_str "
") in
            let* α6 := M.alloc (Value.Array [ α2; α3; α4; α5 ]) in M.pure (M.pointer_coercion α6) in
        let* α18 :=
          (* Unsize *)
            let* α8 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
            let* α9 := M.call_closure α8 [ mk_str "1i32 + 1 == 2i32" ] in
            let* α10 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
            let* α11 := M.call_closure α10 [ mk_str "2i32 * 2 == 4i32" ] in
            let* α12 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [ Ty.path "bool" ] in
            let* α13 :=
              BinOp.Panic.add (Value.Integer Integer.I32 1) (Value.Integer Integer.I32 1) in
            let* α14 :=
              LogicalOp.and
                (BinOp.Pure.eq α13 (Value.Integer Integer.I32 2))
                (let* α13 :=
                  BinOp.Panic.mul (Value.Integer Integer.I32 2) (Value.Integer Integer.I32 2) in
                M.pure (BinOp.Pure.eq α13 (Value.Integer Integer.I32 4))) in
            let* α15 := M.alloc α14 in
            let* α16 := M.call_closure α12 [ α15 ] in
            let* α17 := M.alloc (Value.Array [ α9; α11; α16 ]) in M.pure (M.pointer_coercion α17) in
        let* α19 := M.call_closure α1 [ α7; α18 ] in
        let* α20 := M.call_closure α0 [ α19 ] in M.alloc α20 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
        let* α7 :=
          (* Unsize *)
            let* α2 := M.read (mk_str "") in
            let* α3 := M.read (mk_str " or ") in
            let* α4 := M.read (mk_str " is ") in
            let* α5 := M.read (mk_str "
") in
            let* α6 := M.alloc (Value.Array [ α2; α3; α4; α5 ]) in M.pure (M.pointer_coercion α6) in
        let* α17 :=
          (* Unsize *)
            let* α8 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
            let* α9 := M.call_closure α8 [ mk_str "true" ] in
            let* α10 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
            let* α11 := M.call_closure α10 [ mk_str "false" ] in
            let* α12 :=
              M.get_associated_function
                (Ty.path "core::fmt::rt::Argument")
                "new_debug"
                [ Ty.path "bool" ] in
            let* α13 := LogicalOp.or (Value.Bool true) (M.pure (Value.Bool false)) in
            let* α14 := M.alloc α13 in
            let* α15 := M.call_closure α12 [ α14 ] in
            let* α16 := M.alloc (Value.Array [ α9; α11; α15 ]) in M.pure (M.pointer_coercion α16) in
        let* α18 := M.call_closure α1 [ α7; α17 ] in
        let* α19 := M.call_closure α0 [ α18 ] in M.alloc α19 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in M.read α0
  | _, _ => M.impossible
  end.
