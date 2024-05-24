(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Axiom Result :
  forall (T : Ty.t),
  (Ty.apply (Ty.path "boxing_errors::Result") [ T ]) =
    (Ty.apply
      (Ty.path "core::result::Result")
      [
        T;
        Ty.apply
          (Ty.path "alloc::boxed::Box")
          [ Ty.dyn [ ("core::error::Error::Trait", []) ]; Ty.path "alloc::alloc::Global" ]
      ]).

(* StructTuple
  {
    name := "EmptyVec";
    ty_params := [];
    fields := [];
  } *)

Module Impl_core_fmt_Debug_for_boxing_errors_EmptyVec.
  Definition Self : Ty.t := Ty.path "boxing_errors::EmptyVec".
  
  (* Debug *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let f := M.alloc (| f |) in
        M.call_closure (|
          M.get_associated_function (| Ty.path "core::fmt::Formatter", "write_str", [] |),
          [ M.read (| f |); M.read (| Value.String "EmptyVec" |) ]
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_boxing_errors_EmptyVec.

Module Impl_core_clone_Clone_for_boxing_errors_EmptyVec.
  Definition Self : Ty.t := Ty.path "boxing_errors::EmptyVec".
  
  (* Clone *)
  Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        Value.StructTuple "boxing_errors::EmptyVec" []))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ].
End Impl_core_clone_Clone_for_boxing_errors_EmptyVec.

Module Impl_core_fmt_Display_for_boxing_errors_EmptyVec.
  Definition Self : Ty.t := Ty.path "boxing_errors::EmptyVec".
  
  (*
      fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
          write!(f, "invalid first item to double")
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
              M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_const", [] |),
              [
                (* Unsize *)
                M.pointer_coercion
                  (M.alloc (|
                    Value.Array [ M.read (| Value.String "invalid first item to double" |) ]
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
End Impl_core_fmt_Display_for_boxing_errors_EmptyVec.

Module Impl_core_error_Error_for_boxing_errors_EmptyVec.
  Definition Self : Ty.t := Ty.path "boxing_errors::EmptyVec".
  
  Axiom Implements :
    M.IsTraitInstance "core::error::Error" Self (* Trait polymorphic types *) [] (* Instance *) [].
End Impl_core_error_Error_for_boxing_errors_EmptyVec.

(*
fn double_first(vec: Vec<&str>) -> Result<i32> {
    vec.first()
        .ok_or_else(|| EmptyVec.into()) // Converts to Box
        .and_then(|s| {
            s.parse::<i32>()
                .map_err(|e| e.into()) // Converts to Box
                .map(|i| 2 * i)
        })
}
*)
Definition double_first (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ vec ] =>
    ltac:(M.monadic
      (let vec := M.alloc (| vec |) in
      M.call_closure (|
        M.get_associated_function (|
          Ty.apply
            (Ty.path "core::result::Result")
            [
              Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ];
              Ty.apply
                (Ty.path "alloc::boxed::Box")
                [ Ty.dyn [ ("core::error::Error::Trait", []) ]; Ty.path "alloc::alloc::Global" ]
            ],
          "and_then",
          [
            Ty.path "i32";
            Ty.function
              [ Ty.tuple [ Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] ] ]
              (Ty.apply
                (Ty.path "core::result::Result")
                [
                  Ty.path "i32";
                  Ty.apply
                    (Ty.path "alloc::boxed::Box")
                    [ Ty.dyn [ ("core::error::Error::Trait", []) ]; Ty.path "alloc::alloc::Global" ]
                ])
          ]
        |),
        [
          M.call_closure (|
            M.get_associated_function (|
              Ty.apply
                (Ty.path "core::option::Option")
                [ Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ] ],
              "ok_or_else",
              [
                Ty.apply
                  (Ty.path "alloc::boxed::Box")
                  [ Ty.dyn [ ("core::error::Error::Trait", []) ]; Ty.path "alloc::alloc::Global" ];
                Ty.function
                  [ Ty.tuple [] ]
                  (Ty.apply
                    (Ty.path "alloc::boxed::Box")
                    [ Ty.dyn [ ("core::error::Error::Trait", []) ]; Ty.path "alloc::alloc::Global"
                    ])
              ]
            |),
            [
              M.call_closure (|
                M.get_associated_function (|
                  Ty.apply (Ty.path "slice") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ],
                  "first",
                  []
                |),
                [
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::ops::deref::Deref",
                      Ty.apply
                        (Ty.path "alloc::vec::Vec")
                        [ Ty.apply (Ty.path "&") [ Ty.path "str" ]; Ty.path "alloc::alloc::Global"
                        ],
                      [],
                      "deref",
                      []
                    |),
                    [ vec ]
                  |)
                ]
              |);
              M.closure
                (fun γ =>
                  ltac:(M.monadic
                    match γ with
                    | [ α0 ] =>
                      M.match_operator (|
                        M.alloc (| α0 |),
                        [
                          fun γ =>
                            ltac:(M.monadic
                              (M.call_closure (|
                                M.get_trait_method (|
                                  "core::convert::Into",
                                  Ty.path "boxing_errors::EmptyVec",
                                  [
                                    Ty.apply
                                      (Ty.path "alloc::boxed::Box")
                                      [
                                        Ty.dyn [ ("core::error::Error::Trait", []) ];
                                        Ty.path "alloc::alloc::Global"
                                      ]
                                  ],
                                  "into",
                                  []
                                |),
                                [ Value.StructTuple "boxing_errors::EmptyVec" [] ]
                              |)))
                        ]
                      |)
                    | _ => M.impossible (||)
                    end))
            ]
          |);
          M.closure
            (fun γ =>
              ltac:(M.monadic
                match γ with
                | [ α0 ] =>
                  M.match_operator (|
                    M.alloc (| α0 |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let s := M.copy (| γ |) in
                          M.call_closure (|
                            M.get_associated_function (|
                              Ty.apply
                                (Ty.path "core::result::Result")
                                [
                                  Ty.path "i32";
                                  Ty.apply
                                    (Ty.path "alloc::boxed::Box")
                                    [
                                      Ty.dyn [ ("core::error::Error::Trait", []) ];
                                      Ty.path "alloc::alloc::Global"
                                    ]
                                ],
                              "map",
                              [
                                Ty.path "i32";
                                Ty.function [ Ty.tuple [ Ty.path "i32" ] ] (Ty.path "i32")
                              ]
                            |),
                            [
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.apply
                                    (Ty.path "core::result::Result")
                                    [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ],
                                  "map_err",
                                  [
                                    Ty.apply
                                      (Ty.path "alloc::boxed::Box")
                                      [
                                        Ty.dyn [ ("core::error::Error::Trait", []) ];
                                        Ty.path "alloc::alloc::Global"
                                      ];
                                    Ty.function
                                      [ Ty.tuple [ Ty.path "core::num::error::ParseIntError" ] ]
                                      (Ty.apply
                                        (Ty.path "alloc::boxed::Box")
                                        [
                                          Ty.dyn [ ("core::error::Error::Trait", []) ];
                                          Ty.path "alloc::alloc::Global"
                                        ])
                                  ]
                                |),
                                [
                                  M.call_closure (|
                                    M.get_associated_function (|
                                      Ty.path "str",
                                      "parse",
                                      [ Ty.path "i32" ]
                                    |),
                                    [ M.read (| M.read (| s |) |) ]
                                  |);
                                  M.closure
                                    (fun γ =>
                                      ltac:(M.monadic
                                        match γ with
                                        | [ α0 ] =>
                                          M.match_operator (|
                                            M.alloc (| α0 |),
                                            [
                                              fun γ =>
                                                ltac:(M.monadic
                                                  (let e := M.copy (| γ |) in
                                                  M.call_closure (|
                                                    M.get_trait_method (|
                                                      "core::convert::Into",
                                                      Ty.path "core::num::error::ParseIntError",
                                                      [
                                                        Ty.apply
                                                          (Ty.path "alloc::boxed::Box")
                                                          [
                                                            Ty.dyn
                                                              [ ("core::error::Error::Trait", []) ];
                                                            Ty.path "alloc::alloc::Global"
                                                          ]
                                                      ],
                                                      "into",
                                                      []
                                                    |),
                                                    [ M.read (| e |) ]
                                                  |)))
                                            ]
                                          |)
                                        | _ => M.impossible (||)
                                        end))
                                ]
                              |);
                              M.closure
                                (fun γ =>
                                  ltac:(M.monadic
                                    match γ with
                                    | [ α0 ] =>
                                      M.match_operator (|
                                        M.alloc (| α0 |),
                                        [
                                          fun γ =>
                                            ltac:(M.monadic
                                              (let i := M.copy (| γ |) in
                                              BinOp.Panic.mul (|
                                                Integer.I32,
                                                Value.Integer 2,
                                                M.read (| i |)
                                              |)))
                                        ]
                                      |)
                                    | _ => M.impossible (||)
                                    end))
                            ]
                          |)))
                    ]
                  |)
                | _ => M.impossible (||)
                end))
        ]
      |)))
  | _, _ => M.impossible
  end.

Axiom Function_double_first : M.IsFunction "boxing_errors::double_first" double_first.

(*
fn print(result: Result<i32>) {
    match result {
        Ok(n) => println!("The first doubled is {}", n),
        Err(e) => println!("Error: {}", e),
    }
}
*)
Definition print (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ result ] =>
    ltac:(M.monadic
      (let result := M.alloc (| result |) in
      M.read (|
        M.match_operator (|
          result,
          [
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 :=
                  M.SubPointer.get_struct_tuple_field (| γ, "core::result::Result::Ok", 0 |) in
                let n := M.copy (| γ0_0 |) in
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
                                    M.read (| Value.String "The first doubled is " |);
                                    M.read (| Value.String "
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
                                        [ Ty.path "i32" ]
                                      |),
                                      [ n ]
                                    |)
                                  ]
                              |))
                          ]
                        |)
                      ]
                    |)
                  |) in
                M.alloc (| Value.Tuple [] |)));
            fun γ =>
              ltac:(M.monadic
                (let γ0_0 :=
                  M.SubPointer.get_struct_tuple_field (| γ, "core::result::Result::Err", 0 |) in
                let e := M.copy (| γ0_0 |) in
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
                                    M.read (| Value.String "Error: " |);
                                    M.read (| Value.String "
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
                                        [
                                          Ty.apply
                                            (Ty.path "alloc::boxed::Box")
                                            [
                                              Ty.dyn [ ("core::error::Error::Trait", []) ];
                                              Ty.path "alloc::alloc::Global"
                                            ]
                                        ]
                                      |),
                                      [ e ]
                                    |)
                                  ]
                              |))
                          ]
                        |)
                      ]
                    |)
                  |) in
                M.alloc (| Value.Tuple [] |)))
          ]
        |)
      |)))
  | _, _ => M.impossible
  end.

Axiom Function_print : M.IsFunction "boxing_errors::print" print.

(*
fn main() {
    let numbers = vec!["42", "93", "18"];
    let empty = vec![];
    let strings = vec!["tofu", "93", "18"];

    print(double_first(numbers));
    print(double_first(empty));
    print(double_first(strings));
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read (|
        let numbers :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply (Ty.path "slice") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ],
                "into_vec",
                [ Ty.path "alloc::alloc::Global" ]
              |),
              [
                (* Unsize *)
                M.pointer_coercion
                  (M.read (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply
                          (Ty.path "alloc::boxed::Box")
                          [
                            Ty.apply (Ty.path "array") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ];
                            Ty.path "alloc::alloc::Global"
                          ],
                        "new",
                        []
                      |),
                      [
                        M.alloc (|
                          Value.Array
                            [
                              M.read (| Value.String "42" |);
                              M.read (| Value.String "93" |);
                              M.read (| Value.String "18" |)
                            ]
                        |)
                      ]
                    |)
                  |))
              ]
            |)
          |) in
        let empty :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply
                  (Ty.path "alloc::vec::Vec")
                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ]; Ty.path "alloc::alloc::Global" ],
                "new",
                []
              |),
              []
            |)
          |) in
        let strings :=
          M.alloc (|
            M.call_closure (|
              M.get_associated_function (|
                Ty.apply (Ty.path "slice") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ],
                "into_vec",
                [ Ty.path "alloc::alloc::Global" ]
              |),
              [
                (* Unsize *)
                M.pointer_coercion
                  (M.read (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply
                          (Ty.path "alloc::boxed::Box")
                          [
                            Ty.apply (Ty.path "array") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ];
                            Ty.path "alloc::alloc::Global"
                          ],
                        "new",
                        []
                      |),
                      [
                        M.alloc (|
                          Value.Array
                            [
                              M.read (| Value.String "tofu" |);
                              M.read (| Value.String "93" |);
                              M.read (| Value.String "18" |)
                            ]
                        |)
                      ]
                    |)
                  |))
              ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "boxing_errors::print", [] |),
              [
                M.call_closure (|
                  M.get_function (| "boxing_errors::double_first", [] |),
                  [ M.read (| numbers |) ]
                |)
              ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "boxing_errors::print", [] |),
              [
                M.call_closure (|
                  M.get_function (| "boxing_errors::double_first", [] |),
                  [ M.read (| empty |) ]
                |)
              ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "boxing_errors::print", [] |),
              [
                M.call_closure (|
                  M.get_function (| "boxing_errors::double_first", [] |),
                  [ M.read (| strings |) ]
                |)
              ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.

Axiom Function_main : M.IsFunction "boxing_errors::main" main.
