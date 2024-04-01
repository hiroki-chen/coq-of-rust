(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module my.
  (* StructRecord
    {
      name := "OpenBox";
      ty_params := [ "T" ];
      fields := [ ("contents", T) ];
    } *)
  
  (* StructRecord
    {
      name := "ClosedBox";
      ty_params := [ "T" ];
      fields := [ ("contents", T) ];
    } *)
  
  Module Impl_struct_visibility_my_ClosedBox_T.
    Definition Self (T : Ty.t) : Ty.t :=
      Ty.apply (Ty.path "struct_visibility::my::ClosedBox") [ T ].
    
    (*
            pub fn new(contents: T) -> ClosedBox<T> {
                ClosedBox { contents: contents }
            }
    *)
    Definition new (T : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
      let Self : Ty.t := Self T in
      match τ, α with
      | [], [ contents ] =>
        ltac:(M.monadic
          (let contents := M.alloc (| contents |) in
          Value.StructRecord
            "struct_visibility::my::ClosedBox"
            [ ("contents", M.read (| contents |)) ]))
      | _, _ => M.impossible
      end.
    
    Axiom AssociatedFunction_new : forall (T : Ty.t), M.IsAssociatedFunction (Self T) "new" (new T).
  End Impl_struct_visibility_my_ClosedBox_T.
End my.

(*
fn main() {
    // Public structs with public fields can be constructed as usual
    let open_box = my::OpenBox {
        contents: "public information",
    };

    // and their fields can be normally accessed.
    println!("The open box contains: {}", open_box.contents);

    // Public structs with private fields cannot be constructed using field names.
    // Error! `ClosedBox` has private fields
    //let closed_box = my::ClosedBox { contents: "classified information" };
    // TODO ^ Try uncommenting this line

    // However, structs with private fields can be created using
    // public constructors
    let _closed_box = my::ClosedBox::new("classified information");

    // and the private fields of a public struct cannot be accessed.
    // Error! The `contents` field is private
    //println!("The closed box contains: {}", _closed_box.contents);
    // TODO ^ Try uncommenting this line
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read
        (|
          (let open_box :=
            M.alloc
              (|
                (Value.StructRecord
                  "struct_visibility::my::OpenBox"
                  [ ("contents", M.read (| (mk_str "public information") |)) ])
              |) in
          let _ :=
            let _ :=
              M.alloc
                (|
                  (M.call_closure
                    (|
                      (M.get_function (| "std::io::stdio::_print", [] |)),
                      [
                        M.call_closure
                          (|
                            (M.get_associated_function
                              (| (Ty.path "core::fmt::Arguments"), "new_v1", []
                              |)),
                            [
                              (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc
                                    (|
                                      (Value.Array
                                        [
                                          M.read (| (mk_str "The open box contains: ") |);
                                          M.read (| (mk_str "
") |)
                                        ])
                                    |));
                              (* Unsize *)
                                M.pointer_coercion
                                  (M.alloc
                                    (|
                                      (Value.Array
                                        [
                                          M.call_closure
                                            (|
                                              (M.get_associated_function
                                                (|
                                                  (Ty.path "core::fmt::rt::Argument"),
                                                  "new_display",
                                                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                                                |)),
                                              [
                                                M.get_struct_record_field
                                                  open_box
                                                  "struct_visibility::my::OpenBox"
                                                  "contents"
                                              ]
                                            |)
                                        ])
                                    |))
                            ]
                          |)
                      ]
                    |))
                |) in
            M.alloc (| (Value.Tuple []) |) in
          let _closed_box :=
            M.alloc
              (|
                (M.call_closure
                  (|
                    (M.get_associated_function
                      (|
                        (Ty.apply
                          (Ty.path "struct_visibility::my::ClosedBox")
                          [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]),
                        "new",
                        []
                      |)),
                    [ M.read (| (mk_str "classified information") |) ]
                  |))
              |) in
          M.alloc (| (Value.Tuple []) |))
        |)))
  | _, _ => M.impossible
  end.
