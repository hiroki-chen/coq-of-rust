(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn decode_input<T>() -> Result<T, ()> {
    unimplemented!()
}
*)
Parameter decode_input : (list Ty.t) -> (list Value.t) -> M.

(* StructTuple
  {
    name := "WildcardSelector";
    ty_params := [];
  } *)

Module Impl_wildcard_selector_WildcardSelector.
  Definition Self : Ty.t := Ty.path "wildcard_selector::WildcardSelector".
  
  (*
      pub fn new() -> Self {
          Self {}
      }
  *)
  Definition new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] => ltac:(M.monadic (Value.StructTuple "wildcard_selector::WildcardSelector" []))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      pub fn wildcard(&mut self) {
          let (_selector, _message) = decode_input::<([u8; 4], String)>().unwrap();
          println!("Wildcard selector: {:?}, message: {}", _selector, _message);
      }
  *)
  Definition wildcard (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
            M.match_operator (|
                M.alloc (|
                    M.call_closure (|
                        M.get_associated_function (|
                            Ty.apply
                              (Ty.path "core::result::Result")
                              [
                                Ty.tuple
                                  [
                                    Ty.apply (Ty.path "array") [ Ty.path "u8" ];
                                    Ty.path "alloc::string::String"
                                  ];
                                Ty.tuple []
                              ],
                            "unwrap",
                            []
                          |),
                        [
                          M.call_closure (|
                              M.get_function (|
                                  "wildcard_selector::decode_input",
                                  [
                                    Ty.tuple
                                      [
                                        Ty.apply (Ty.path "array") [ Ty.path "u8" ];
                                        Ty.path "alloc::string::String"
                                      ]
                                  ]
                                |),
                              []
                            |)
                        ]
                      |)
                  |),
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ0_0 := M.get_tuple_field γ 0 in
                      let γ0_1 := M.get_tuple_field γ 1 in
                      let _selector := M.copy (| γ0_0 |) in
                      let _message := M.copy (| γ0_1 |) in
                      let _ :=
                        let _ :=
                          M.alloc (|
                              M.call_closure (|
                                  M.get_function (| "std::io::stdio::_print", [] |),
                                  [
                                    M.call_closure (|
                                        M.get_associated_function (|
                                            Ty.path "core::fmt::Arguments",
                                            "new_v1",
                                            []
                                          |),
                                        [
                                          (* Unsize *)
                                            M.pointer_coercion
                                              (M.alloc (|
                                                  Value.Array
                                                    [
                                                      M.read (| mk_str "Wildcard selector: " |);
                                                      M.read (| mk_str ", message: " |);
                                                      M.read (| mk_str "
" |)
                                                    ]
                                                |));
                                          (* Unsize *)
                                            M.pointer_coercion
                                              (M.alloc (|
                                                  Value.Array
                                                    [
                                                      M.call_closure (|
                                                          M.get_associated_function (|
                                                              Ty.path "core::fmt::rt::Argument",
                                                              "new_debug",
                                                              [
                                                                Ty.apply
                                                                  (Ty.path "array")
                                                                  [ Ty.path "u8" ]
                                                              ]
                                                            |),
                                                          [ _selector ]
                                                        |);
                                                      M.call_closure (|
                                                          M.get_associated_function (|
                                                              Ty.path "core::fmt::rt::Argument",
                                                              "new_display",
                                                              [ Ty.path "alloc::string::String" ]
                                                            |),
                                                          [ _message ]
                                                        |)
                                                    ]
                                                |))
                                        ]
                                      |)
                                  ]
                                |)
                            |) in
                        M.alloc (| Value.Tuple [] |) in
                      M.alloc (| Value.Tuple [] |)))
                ]
              |)
          |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_wildcard : M.IsAssociatedFunction Self "wildcard" wildcard.
  
  (*
      pub fn wildcard_complement(&mut self, _message: String) {
          println!("Wildcard complement message: {}", _message);
      }
  *)
  Definition wildcard_complement (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; _message ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let _message := M.alloc (| _message |) in
        M.read (|
            let _ :=
              let _ :=
                M.alloc (|
                    M.call_closure (|
                        M.get_function (| "std::io::stdio::_print", [] |),
                        [
                          M.call_closure (|
                              M.get_associated_function (|
                                  Ty.path "core::fmt::Arguments",
                                  "new_v1",
                                  []
                                |),
                              [
                                (* Unsize *)
                                  M.pointer_coercion
                                    (M.alloc (|
                                        Value.Array
                                          [
                                            M.read (| mk_str "Wildcard complement message: " |);
                                            M.read (| mk_str "
" |)
                                          ]
                                      |));
                                (* Unsize *)
                                  M.pointer_coercion
                                    (M.alloc (|
                                        Value.Array
                                          [
                                            M.call_closure (|
                                                M.get_associated_function (|
                                                    Ty.path "core::fmt::rt::Argument",
                                                    "new_display",
                                                    [ Ty.path "alloc::string::String" ]
                                                  |),
                                                [ _message ]
                                              |)
                                          ]
                                      |))
                              ]
                            |)
                        ]
                      |)
                  |) in
              M.alloc (| Value.Tuple [] |) in
            M.alloc (| Value.Tuple [] |)
          |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_wildcard_complement :
    M.IsAssociatedFunction Self "wildcard_complement" wildcard_complement.
End Impl_wildcard_selector_WildcardSelector.
