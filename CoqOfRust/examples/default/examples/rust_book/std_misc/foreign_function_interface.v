(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Error ForeignMod.

(*
fn cos(z: Complex) -> Complex {
    unsafe { ccosf(z) }
}
*)
Definition cos (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ z ] =>
    let* z := M.alloc z in
    let* α0 := M.var "foreign_function_interface::ccosf" in
    let* α1 := M.read z in
    M.call α0 [ α1 ]
  | _, _ => M.impossible
  end.

(*
fn main() {
    // z = -1 + 0i
    let z = Complex { re: -1., im: 0. };

    // calling a foreign function is an unsafe operation
    let z_sqrt = unsafe { csqrtf(z) };

    println!("the square root of {:?} is {:?}", z, z_sqrt);

    // calling safe API wrapped around unsafe operation
    println!("cos({:?}) = {:?}", z, cos(z));
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* z :=
      let* α0 := M.read (UnsupportedLiteral : Ty.path "f32") in
      let* α1 := M.read (UnsupportedLiteral : Ty.path "f32") in
      M.alloc
        (Value.StructRecord
          "foreign_function_interface::Complex"
          [ ("re", α0); ("im", α1) ]) in
    let* z_sqrt :=
      let* α0 := M.var "foreign_function_interface::csqrtf" in
      let* α1 := M.read z in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "the square root of ") in
        let* α2 := M.read (mk_str " is ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc [ α1; α2; α3 ] in
        let* α5 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_debug"]
            [ borrow z ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_debug"]
            [ borrow z_sqrt ] in
        let* α7 := M.alloc [ α5; α6 ] in
        let* α8 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α4);
              pointer_coercion "Unsize" (borrow α7)
            ] in
        let* α9 := M.call α0 [ α8 ] in
        M.alloc α9 in
      M.alloc tt in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "cos(") in
        let* α2 := M.read (mk_str ") = ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc [ α1; α2; α3 ] in
        let* α5 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_debug"]
            [ borrow z ] in
        let* α6 := M.var "foreign_function_interface::cos" in
        let* α7 := M.read z in
        let* α8 := M.call α6 [ α7 ] in
        let* α9 := M.alloc α8 in
        let* α10 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_debug"]
            [ borrow α9 ] in
        let* α11 := M.alloc [ α5; α10 ] in
        let* α12 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [
              pointer_coercion "Unsize" (borrow α4);
              pointer_coercion "Unsize" (borrow α11)
            ] in
        let* α13 := M.call α0 [ α12 ] in
        M.alloc α13 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.

(* Enum Complex *)

Module Impl_core_clone_Clone_for_foreign_function_interface_Complex.
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      let* α0 :=
        match_operator
          (DeclaredButUndefinedVariable
            (A :=
              Ty.apply
                (Ty.path "core::clone::AssertParamIsClone")
                [ Ty.path "f32" ]))
          [
            fun γ =>
              (let* α0 := M.read self in
              M.pure (deref α0)) :
              Ty.path "foreign_function_interface::Complex"
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    let Self := Ty.path "foreign_function_interface::Complex" in
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      []
      [ ("clone", InstanceField.Method clone [ Self ]) ].
End Impl_core_clone_Clone_for_foreign_function_interface_Complex.

Module Impl_core_marker_Copy_for_foreign_function_interface_Complex.
  Axiom Implements :
    let Self := Ty.path "foreign_function_interface::Complex" in
    M.IsTraitInstance "core::marker::Copy" Self [] [].
End Impl_core_marker_Copy_for_foreign_function_interface_Complex.

Module Impl_core_fmt_Debug_for_foreign_function_interface_Complex.
  (*
      fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
          if self.im < 0. {
              write!(f, "{}-{}i", self.re, -self.im)
          } else {
              write!(f, "{}+{}i", self.re, self.im)
          }
      }
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.var "BinOp::Pure::lt" in
      let* α1 := M.var "foreign_function_interface::Complex::Get_im" in
      let* α2 := M.read self in
      let* α3 := M.read (α1 (deref α2)) in
      let* α4 := M.read (UnsupportedLiteral : Ty.path "f32") in
      let* α5 := M.alloc (α0 α3 α4) in
      let* α6 := M.read (use α5) in
      let* α7 :=
        if α6 then
          let* α0 := M.read f in
          let* α1 := M.read (mk_str "") in
          let* α2 := M.read (mk_str "-") in
          let* α3 := M.read (mk_str "i") in
          let* α4 := M.alloc [ α1; α2; α3 ] in
          let* α5 := M.var "foreign_function_interface::Complex::Get_re" in
          let* α6 := M.read self in
          let* α7 :=
            M.call
              (Ty.path "core::fmt::rt::Argument")::["new_display"]
              [ borrow (α5 (deref α6)) ] in
          let* α8 := M.var "UnOp::neg" in
          let* α9 := M.var "foreign_function_interface::Complex::Get_im" in
          let* α10 := M.read self in
          let* α11 := M.read (α9 (deref α10)) in
          let* α12 := α8 α11 in
          let* α13 := M.alloc α12 in
          let* α14 :=
            M.call
              (Ty.path "core::fmt::rt::Argument")::["new_display"]
              [ borrow α13 ] in
          let* α15 := M.alloc [ α7; α14 ] in
          let* α16 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_v1"]
              [
                pointer_coercion "Unsize" (borrow α4);
                pointer_coercion "Unsize" (borrow α15)
              ] in
          let* α17 :=
            M.call
              (Ty.path "core::fmt::Formatter")::["write_fmt"]
              [ α0; α16 ] in
          M.alloc α17
        else
          let* α0 := M.read f in
          let* α1 := M.read (mk_str "") in
          let* α2 := M.read (mk_str "+") in
          let* α3 := M.read (mk_str "i") in
          let* α4 := M.alloc [ α1; α2; α3 ] in
          let* α5 := M.var "foreign_function_interface::Complex::Get_re" in
          let* α6 := M.read self in
          let* α7 :=
            M.call
              (Ty.path "core::fmt::rt::Argument")::["new_display"]
              [ borrow (α5 (deref α6)) ] in
          let* α8 := M.var "foreign_function_interface::Complex::Get_im" in
          let* α9 := M.read self in
          let* α10 :=
            M.call
              (Ty.path "core::fmt::rt::Argument")::["new_display"]
              [ borrow (α8 (deref α9)) ] in
          let* α11 := M.alloc [ α7; α10 ] in
          let* α12 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_v1"]
              [
                pointer_coercion "Unsize" (borrow α4);
                pointer_coercion "Unsize" (borrow α11)
              ] in
          let* α13 :=
            M.call
              (Ty.path "core::fmt::Formatter")::["write_fmt"]
              [ α0; α12 ] in
          M.alloc α13 in
      M.read α7
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    let Self := Ty.path "foreign_function_interface::Complex" in
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      []
      [ ("fmt", InstanceField.Method fmt [ Self ]) ].
End Impl_core_fmt_Debug_for_foreign_function_interface_Complex.
