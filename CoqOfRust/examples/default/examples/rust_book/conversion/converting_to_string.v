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
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let f := M.alloc (| f |) in
        M.call_closure (|
            M.get_associated_function (| Ty.path "core::fmt::Formatter", "write_fmt", [] |),
            [
              M.read (| f |);
              M.call_closure (|
                  M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                  [
                    (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (| Value.Array [ M.read (| mk_str "Circle of radius " |) ] |));
                    (* Unsize *)
                      M.pointer_coercion
                        (M.alloc (|
                            Value.Array
                              [
                                M.call_closure (|
                                    M.get_associated_function (|
                                        Ty.path "core::fmt::rt::Argument",
                                        "new_display",
                                        [ Ty.path "i32" ]
                                      |),
                                    [
                                      M.get_struct_record_field
                                        (M.read (| self |))
                                        "converting_to_string::Circle"
                                        "radius"
                                    ]
                                  |)
                              ]
                          |))
                  ]
                |)
            ]
          |)))
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
    ltac:(M.monadic
      (M.read (|
          let circle :=
            M.alloc (|
                Value.StructRecord
                  "converting_to_string::Circle"
                  [ ("radius", Value.Integer Integer.I32 6) ]
              |) in
          let _ :=
            M.alloc (|
                M.call_closure (|
                    M.get_trait_method (|
                        "alloc::string::ToString",
                        Ty.path "converting_to_string::Circle",
                        [],
                        "to_string",
                        []
                      |),
                    [ circle ]
                  |)
              |) in
          M.alloc (| Value.Tuple [] |)
        |)))
  | _, _ => M.impossible
  end.
