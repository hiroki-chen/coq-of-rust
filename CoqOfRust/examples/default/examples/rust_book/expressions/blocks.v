(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    let x = 5u32;

    let y = {
        let x_squared = x * x;
        let x_cube = x_squared * x;

        // This expression will be assigned to `y`
        x_cube + x_squared + x
    };

    let z = {
        // The semicolon suppresses this expression and `()` is assigned to `z`
        2 * x;
    };

    println!("x is {:?}", x);
    println!("y is {:?}", y);
    println!("z is {:?}", z);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* x := M.alloc (Value.Integer Integer.U32 5) in
    let* y :=
      let* x_squared :=
        let* α0 := M.read x in
        let* α1 := M.read x in
        let* α2 := BinOp.Panic.mul α0 α1 in
        M.alloc α2 in
      let* x_cube :=
        let* α0 := M.read x_squared in
        let* α1 := M.read x in
        let* α2 := BinOp.Panic.mul α0 α1 in
        M.alloc α2 in
      let* α0 := M.read x_cube in
      let* α1 := M.read x_squared in
      let* α2 := BinOp.Panic.add α0 α1 in
      let* α3 := M.read x in
      let* α4 := BinOp.Panic.add α2 α3 in
      let* α0 := M.alloc α4 in
      M.copy α0 in
    let* z :=
      let* _ :=
        let* α0 := M.read x in
        let* α1 := BinOp.Panic.mul (Value.Integer Integer.U32 2) α0 in
        M.alloc α1 in
      let* α0 := M.alloc tt in
      M.copy α0 in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "x is ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_debug"] [ x ] in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ M.pointer_coercion "Unsize" α3; M.pointer_coercion "Unsize" α5
            ] in
        let* α7 := M.call α0 [ α6 ] in
        M.alloc α7 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "y is ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_debug"] [ y ] in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ M.pointer_coercion "Unsize" α3; M.pointer_coercion "Unsize" α5
            ] in
        let* α7 := M.call α0 [ α6 ] in
        M.alloc α7 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "z is ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call (Ty.path "core::fmt::rt::Argument")::["new_debug"] [ z ] in
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
