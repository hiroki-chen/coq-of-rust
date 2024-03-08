(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module my.
  (* Struct OpenBox *)
  
  (* Struct ClosedBox *)
  
  Module Impl_struct_visibility_my_ClosedBox_T.
    Definition Self (T : Ty.t) : Ty.t :=
      Ty.apply (Ty.path "struct_visibility::my::ClosedBox") [ T ].
    
    (*
            pub fn new(contents: T) -> ClosedBox<T> {
                ClosedBox { contents: contents }
            }
    *)
    Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
      match 𝜏, α with
      | [ Self; T ], [ contents ] =>
        let* contents := M.alloc contents in
        let* α0 := M.read contents in
        M.pure
          (Value.StructRecord
            "struct_visibility::my::ClosedBox"
            [ ("contents", α0) ])
      | _, _ => M.impossible
      end.
    
    Axiom AssociatedFunction_new :
      forall (T : Ty.t),
      M.IsAssociatedFunction (Self T) "new" new [ T ].
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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* open_box :=
      let* α0 := M.read (mk_str "public information") in
      M.alloc
        (Value.StructRecord
          "struct_visibility::my::OpenBox"
          [ ("contents", α0) ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "The open box contains: ") in
        let* α2 := M.read (mk_str "
") in
        let* α3 := M.alloc [ α1; α2 ] in
        let* α4 :=
          M.call
            (Ty.path "core::fmt::rt::Argument")::["new_display"]
            [ M.get_struct_record open_box "contents" ] in
        let* α5 := M.alloc [ α4 ] in
        let* α6 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_v1"]
            [ M.pointer_coercion "Unsize" α3; M.pointer_coercion "Unsize" α5
            ] in
        let* α7 := M.call α0 [ α6 ] in
        M.alloc α7 in
      M.alloc tt in
    let* _closed_box :=
      let* α0 := M.read (mk_str "classified information") in
      let* α1 :=
        M.call
          (Ty.apply
              (Ty.path "struct_visibility::my::ClosedBox")
              [ Ty.apply (Ty.path "ref") [ Ty.path "str" ] ])::["new"]
          [ α0 ] in
      M.alloc α1 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
