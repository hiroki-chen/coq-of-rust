(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Circle";
    ty_params := [];
    fields := [ ("radius", Ty.path "i32") ];
  } *)

Module Impl_core_fmt_Display_for_converting_to_string_Circle.
  Definition Self : Ty.t := Ty.path "converting_to_string::Circle".
  
  (*
      fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
          write!(f, "Circle of radius {}", self.radius)
      }
  *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.get_associated_function (Ty.path "core::fmt::Formatter") "write_fmt" [] in
      let* α1 := M.read f in
      let* α2 := M.get_associated_function (Ty.path "core::fmt::Arguments") "new_v1" [] in
      let* α5 :=
        (* Unsize *)
          let* α3 := M.read (mk_str "Circle of radius ") in
          let* α4 := M.alloc (Value.Array [ α3 ]) in
          M.pure (M.pointer_coercion α4) in
      let* α10 :=
        (* Unsize *)
          let* α6 :=
            M.get_associated_function
              (Ty.path "core::fmt::rt::Argument")
              "new_display"
              [ Ty.path "i32" ] in
          let* α7 := M.read self in
          let* α8 :=
            M.call_closure
              α6
              [ M.get_struct_record_field α7 "converting_to_string::Circle" "radius" ] in
          let* α9 := M.alloc (Value.Array [ α8 ]) in
          M.pure (M.pointer_coercion α9) in
      let* α11 := M.call_closure α2 [ α5; α10 ] in
      M.call_closure α0 [ α1; α11 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Display"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Display_for_converting_to_string_Circle.

(*
fn main() {
    let circle = Circle { radius: 6 };
    circle.to_string();
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* circle :=
      M.alloc
        (Value.StructRecord
          "converting_to_string::Circle"
          [ ("radius", Value.Integer Integer.I32 6) ]) in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "alloc::string::ToString"
          (Ty.path "converting_to_string::Circle")
          []
          "to_string"
          [] in
      let* α1 := M.call_closure α0 [ circle ] in
      M.alloc α1 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
