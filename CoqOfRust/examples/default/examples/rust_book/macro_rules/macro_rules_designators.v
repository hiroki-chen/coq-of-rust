(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
        fn $func_name() {
            // The `stringify!` macro converts an `ident` into a string.
            println!("You called {:?}()", stringify!($func_name));
        }
*)
Definition foo (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "You called ") in
        let* α3 := M.read (mk_str "()
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
        let* α6 := M.call_closure α5 [ mk_str "foo" ] in
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
        fn $func_name() {
            // The `stringify!` macro converts an `ident` into a string.
            println!("You called {:?}()", stringify!($func_name));
        }
*)
Definition bar (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "You called ") in
        let* α3 := M.read (mk_str "()
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
        let* α6 := M.call_closure α5 [ mk_str "bar" ] in
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
fn main() {
    foo();
    bar();

    print_result!(1u32 + 1);

    // Recall that blocks are expressions too!
    print_result!({
        let x = 1u32;

        x * x + 2 * x - 1
    });
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* _ :=
      let* α0 := M.get_function "macro_rules_designators::foo" [] in
      let* α1 := M.call_closure α0 [] in
      M.alloc α1 in
    let* _ :=
      let* α0 := M.get_function "macro_rules_designators::bar" [] in
      let* α1 := M.call_closure α0 [] in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "") in
        let* α3 := M.read (mk_str " = ") in
        let* α4 := M.read (mk_str "
") in
        let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
        let* α6 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
        let* α7 := M.call_closure α6 [ mk_str "1u32 + 1" ] in
        let* α8 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.path "u32" ] in
        let* α9 :=
          BinOp.Panic.add
            (Value.Integer Integer.U32 1)
            (Value.Integer Integer.U32 1) in
        let* α10 := M.alloc α9 in
        let* α11 := M.call_closure α8 [ α10 ] in
        let* α12 := M.alloc (Value.Array [ α7; α11 ]) in
        let* α13 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α5;
              M.pointer_coercion (* Unsize *) α12
            ] in
        let* α14 := M.call_closure α0 [ α13 ] in
        M.alloc α14 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "") in
        let* α3 := M.read (mk_str " = ") in
        let* α4 := M.read (mk_str "
") in
        let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
        let* α6 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] in
        let* α7 :=
          M.call_closure α6 [ mk_str "{ let x = 1u32; x * x + 2 * x - 1 }" ] in
        let* α8 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.path "u32" ] in
        let* x := M.alloc (Value.Integer Integer.U32 1) in
        let* α0 := M.read x in
        let* α1 := M.read x in
        let* α2 := BinOp.Panic.mul α0 α1 in
        let* α3 := M.read x in
        let* α4 := BinOp.Panic.mul (Value.Integer Integer.U32 2) α3 in
        let* α5 := BinOp.Panic.add α2 α4 in
        let* α6 := BinOp.Panic.sub α5 (Value.Integer Integer.U32 1) in
        let* α9 := M.alloc α6 in
        let* α10 := M.call_closure α8 [ α9 ] in
        let* α11 := M.alloc (Value.Array [ α7; α10 ]) in
        let* α12 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α5;
              M.pointer_coercion (* Unsize *) α11
            ] in
        let* α13 := M.call_closure α0 [ α12 ] in
        M.alloc α13 in
      M.alloc (Value.Tuple []) in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
