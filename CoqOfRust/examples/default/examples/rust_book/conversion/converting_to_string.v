(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Circle *)

Module Impl_core_fmt_Display_for_converting_to_string_Circle.
  (*
      fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
          write!(f, "Circle of radius {}", self.radius)
      }
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 := M.read (mk_str "Circle of radius ") in
      let* α2 := M.alloc [ α1 ] in
      let* α3 := M.var "converting_to_string::Circle::Get_radius" in
      let* α4 := M.read self in
      let* α5 :=
        M.call
          (Ty.path "core::fmt::rt::Argument")::["new_display"]
          [ borrow (α3 (deref α4)) ] in
      let* α6 := M.alloc [ α5 ] in
      let* α7 :=
        M.call
          (Ty.path "core::fmt::Arguments")::["new_v1"]
          [
            pointer_coercion "Unsize" (borrow α2);
            pointer_coercion "Unsize" (borrow α6)
          ] in
      M.call (Ty.path "core::fmt::Formatter")::["write_fmt"] [ α0; α7 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    let Self := Ty.path "converting_to_string::Circle" in
    M.IsTraitInstance
      "core::fmt::Display"
      Self
      []
      [ ("fmt", InstanceField.Method fmt [ Self ]) ].
End Impl_core_fmt_Display_for_converting_to_string_Circle.

(*
fn main() {
    let circle = Circle { radius: 6 };
    circle.to_string();
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* circle :=
      M.alloc
        (Value.StructRecord
          "converting_to_string::Circle"
          [ ("radius", (Integer.of_Z 6) : Ty.path "i32") ]) in
    let* _ :=
      let* α0 :=
        M.get_method
          "alloc::string::ToString"
          "to_string"
          [ (* Self *) Ty.path "converting_to_string::Circle" ] in
      let* α1 := M.call α0 [ borrow circle ] in
      M.alloc α1 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
