(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn decode_input<T>() -> Result<T, ()> {
    unimplemented!()
}
*)
Definition decode_input (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [ T ], [] =>
    let* α0 := M.var "core::panicking::panic" in
    let* α1 := M.read (mk_str "not implemented") in
    let* α2 := M.call α0 [ α1 ] in
    never_to_any α2
  | _, _ => M.impossible
  end.

(* Struct WildcardSelector *)

Module Impl_wildcard_selector_WildcardSelector.
  Definition Self : Ty.t := Ty.path "wildcard_selector::WildcardSelector".
  
  (*
      pub fn new() -> Self {
          Self {}
      }
  *)
  Definition new (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] => M.pure wildcard_selector.WildcardSelector.Build
    | _, _ => M.impossible
    end.
  
  (*
      pub fn wildcard(&mut self) {
          let (_selector, _message) = decode_input::<([u8; 4], String)>().unwrap();
          println!("Wildcard selector: {:?}, message: {}", _selector, _message);
      }
  *)
  Definition wildcard (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* α0 := M.var "wildcard_selector::decode_input" in
      let* α1 := M.call α0 [] in
      let* α2 :=
        M.call
          (Ty.apply
              (Ty.path "core::result::Result")
              [
                Ty.tuple
                  [
                    Ty.apply (Ty.path "array") [ Ty.path "u8" ];
                    Ty.path "alloc::string::String"
                  ];
                Ty.tuple []
              ])::["unwrap"]
          [ α1 ] in
      let* α3 := M.alloc α2 in
      let* α4 :=
        match_operator
          α3
          [
            fun γ =>
              (let* α0 := M.read γ in
              match α0 with
              | (_, _) =>
                let γ0_0 := Tuple.Access.left γ in
                let γ0_1 := Tuple.Access.right γ in
                let* _selector := M.copy γ0_0 in
                let* _message := M.copy γ0_1 in
                let* _ :=
                  let* _ :=
                    let* α0 := M.var "std::io::stdio::_print" in
                    let* α1 := M.read (mk_str "Wildcard selector: ") in
                    let* α2 := M.read (mk_str ", message: ") in
                    let* α3 := M.read (mk_str "
") in
                    let* α4 := M.alloc [ α1; α2; α3 ] in
                    let* α5 :=
                      M.call
                        (Ty.path "core::fmt::rt::Argument")::["new_debug"]
                        [ borrow _selector ] in
                    let* α6 :=
                      M.call
                        (Ty.path "core::fmt::rt::Argument")::["new_display"]
                        [ borrow _message ] in
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
                M.alloc tt
              end) :
              Ty.path "unit"
          ] in
      M.read α4
    | _, _ => M.impossible
    end.
  
  (*
      pub fn wildcard_complement(&mut self, _message: String) {
          println!("Wildcard complement message: {}", _message);
      }
  *)
  Definition wildcard_complement (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self; _message ] =>
      let* self := M.alloc self in
      let* _message := M.alloc _message in
      let* _ :=
        let* _ :=
          let* α0 := M.var "std::io::stdio::_print" in
          let* α1 := M.read (mk_str "Wildcard complement message: ") in
          let* α2 := M.read (mk_str "
") in
          let* α3 := M.alloc [ α1; α2 ] in
          let* α4 :=
            M.call
              (Ty.path "core::fmt::rt::Argument")::["new_display"]
              [ borrow _message ] in
          let* α5 := M.alloc [ α4 ] in
          let* α6 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_v1"]
              [
                pointer_coercion "Unsize" (borrow α3);
                pointer_coercion "Unsize" (borrow α5)
              ] in
          let* α7 := M.call α0 [ α6 ] in
          M.alloc α7 in
        M.alloc tt in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
End Impl_wildcard_selector_WildcardSelector.
