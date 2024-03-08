(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
        fn $func_name() {
            // The `stringify!` macro converts an `ident` into a string.
            println!("You called {:?}()", stringify!($func_name));
        }
*)
Definition foo (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "You called ") in
        let* α2 := M.read (mk_str "()
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_debug"]
            [ mk_str "foo" ] in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ M.pointer_coercion "Unsize" α3; M.pointer_coercion "Unsize" α5
            ] in
        let* α7 := M.call α0 [ α6 ] in
        M.alloc α7 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.

(*
        fn $func_name() {
            // The `stringify!` macro converts an `ident` into a string.
            println!("You called {:?}()", stringify!($func_name));
        }
*)
Definition bar (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "You called ") in
        let* α2 := M.read (mk_str "()
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_debug"]
            [ mk_str "bar" ] in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ M.pointer_coercion "Unsize" α3; M.pointer_coercion "Unsize" α5
            ] in
        let* α7 := M.call α0 [ α6 ] in
        M.alloc α7 in
      M.alloc tt in
    let* α0 := M.alloc tt in
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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* α0 := M.var "macro_rules_designators::foo" in
      let* α1 := M.call α0 [] in
      M.alloc α1 in
    let* _ :=
      let* α0 := M.var "macro_rules_designators::bar" in
      let* α1 := M.call α0 [] in
      M.alloc α1 in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "") in
        let* α2 := M.read (mk_str " = ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc [ α1; α2; α3 ] in
        let* α5 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_debug"]
            [ mk_str "1u32 + 1" ] in
        let* α6 :=
          BinOp.Panic.add
            (Value.Integer Integer.U32 1)
            (Value.Integer Integer.U32 1) in
        let* α7 := M.alloc α6 in
        let* α8 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_debug"] [ α7 ] in
        let* α9 := M.alloc [ α5; α8 ] in
        let* α10 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ M.pointer_coercion "Unsize" α4; M.pointer_coercion "Unsize" α9
            ] in
        let* α11 := M.call α0 [ α10 ] in
        M.alloc α11 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "") in
        let* α2 := M.read (mk_str " = ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc [ α1; α2; α3 ] in
        let* α5 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_debug"]
            [ mk_str "{ let x = 1u32; x * x + 2 * x - 1 }" ] in
        let* x := M.alloc (Value.Integer Integer.U32 1) in
        let* α0 := M.read x in
        let* α1 := M.read x in
        let* α2 := BinOp.Panic.mul α0 α1 in
        let* α3 := M.read x in
        let* α4 := BinOp.Panic.mul (Value.Integer Integer.U32 2) α3 in
        let* α5 := BinOp.Panic.add α2 α4 in
        let* α6 := BinOp.Panic.sub α5 (Value.Integer Integer.U32 1) in
        let* α6 := M.alloc α6 in
        let* α7 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_debug"] [ α6 ] in
        let* α8 := M.alloc [ α5; α7 ] in
        let* α9 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ M.pointer_coercion "Unsize" α4; M.pointer_coercion "Unsize" α8
            ] in
        let* α10 := M.call α0 [ α9 ] in
        M.alloc α10 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
