(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
Enum DoubleError
{
  ty_params := [];
  variants :=
    [
      {
        name := "EmptyVec";
        item := StructTuple [];
        discriminant := None;
      };
      {
        name := "Parse";
        item := StructTuple [ Ty.path "core::num::error::ParseIntError" ];
        discriminant := None;
      }
    ];
}
*)

Module Impl_core_fmt_Debug_for_wrapping_errors_DoubleError.
  Definition Self : Ty.t := Ty.path "wrapping_errors::DoubleError".
  
  (* Debug *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let f := M.alloc (| f |) in
        M.read (|
          M.match_operator (|
            self,
            [
              fun γ =>
                ltac:(M.monadic
                  (let γ := M.read (| γ |) in
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "core::fmt::Formatter",
                        "write_str",
                        []
                      |),
                      [ M.read (| f |); M.read (| Value.String "EmptyVec" |) ]
                    |)
                  |)));
              fun γ =>
                ltac:(M.monadic
                  (let γ := M.read (| γ |) in
                  let γ1_0 :=
                    M.SubPointer.get_struct_tuple_field (|
                      γ,
                      "wrapping_errors::DoubleError::Parse",
                      0
                    |) in
                  let __self_0 := M.alloc (| γ1_0 |) in
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "core::fmt::Formatter",
                        "debug_tuple_field1_finish",
                        []
                      |),
                      [
                        M.read (| f |);
                        M.read (| Value.String "Parse" |);
                        (* Unsize *) M.pointer_coercion __self_0
                      ]
                    |)
                  |)))
            ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Debug_for_wrapping_errors_DoubleError.

Axiom Result :
  forall (T : Ty.t),
  (Ty.apply (Ty.path "wrapping_errors::Result") [ T ]) =
    (Ty.apply (Ty.path "core::result::Result") [ T; Ty.path "wrapping_errors::DoubleError" ]).

Module Impl_core_fmt_Display_for_wrapping_errors_DoubleError.
  Definition Self : Ty.t := Ty.path "wrapping_errors::DoubleError".
  
  (*
      fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
          match *self {
              DoubleError::EmptyVec => write!(f, "please use a vector with at least one element"),
              // The wrapped error contains additional information and is available
              // via the source() method.
              DoubleError::Parse(..) => write!(f, "the provided string could not be parsed as int"),
          }
      }
  *)
  Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; f ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let f := M.alloc (| f |) in
        M.read (|
          M.match_operator (|
            M.read (| self |),
            [
              fun γ =>
                ltac:(M.monadic
                  (M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "core::fmt::Formatter",
                        "write_fmt",
                        []
                      |),
                      [
                        M.read (| f |);
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.path "core::fmt::Arguments",
                            "new_const",
                            []
                          |),
                          [
                            (* Unsize *)
                            M.pointer_coercion
                              (M.alloc (|
                                Value.Array
                                  [
                                    M.read (|
                                      Value.String "please use a vector with at least one element"
                                    |)
                                  ]
                              |))
                          ]
                        |)
                      ]
                    |)
                  |)));
              fun γ =>
                ltac:(M.monadic
                  (M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "core::fmt::Formatter",
                        "write_fmt",
                        []
                      |),
                      [
                        M.read (| f |);
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.path "core::fmt::Arguments",
                            "new_const",
                            []
                          |),
                          [
                            (* Unsize *)
                            M.pointer_coercion
                              (M.alloc (|
                                Value.Array
                                  [
                                    M.read (|
                                      Value.String "the provided string could not be parsed as int"
                                    |)
                                  ]
                              |))
                          ]
                        |)
                      ]
                    |)
                  |)))
            ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Display"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
End Impl_core_fmt_Display_for_wrapping_errors_DoubleError.

Module Impl_core_error_Error_for_wrapping_errors_DoubleError.
  Definition Self : Ty.t := Ty.path "wrapping_errors::DoubleError".
  
  (*
      fn source(&self) -> Option<&(dyn error::Error + 'static)> {
          match *self {
              DoubleError::EmptyVec => None,
              // The cause is the underlying implementation error type. Is implicitly
              // cast to the trait object `&error::Error`. This works because the
              // underlying type already implements the `Error` trait.
              DoubleError::Parse(ref e) => Some(e),
          }
      }
  *)
  Definition source (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read (|
          M.match_operator (|
            M.read (| self |),
            [
              fun γ =>
                ltac:(M.monadic (M.alloc (| Value.StructTuple "core::option::Option::None" [] |)));
              fun γ =>
                ltac:(M.monadic
                  (let γ0_0 :=
                    M.SubPointer.get_struct_tuple_field (|
                      γ,
                      "wrapping_errors::DoubleError::Parse",
                      0
                    |) in
                  let e := M.alloc (| γ0_0 |) in
                  M.alloc (|
                    Value.StructTuple
                      "core::option::Option::Some"
                      [ (* Unsize *) M.pointer_coercion (M.read (| e |)) ]
                  |)))
            ]
          |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::error::Error"
      Self
      (* Trait polymorphic types *) []
      (* Instance *) [ ("source", InstanceField.Method source) ].
End Impl_core_error_Error_for_wrapping_errors_DoubleError.

Module Impl_core_convert_From_core_num_error_ParseIntError_for_wrapping_errors_DoubleError.
  Definition Self : Ty.t := Ty.path "wrapping_errors::DoubleError".
  
  (*
      fn from(err: ParseIntError) -> DoubleError {
          DoubleError::Parse(err)
      }
  *)
  Definition from (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ err ] =>
      ltac:(M.monadic
        (let err := M.alloc (| err |) in
        Value.StructTuple "wrapping_errors::DoubleError::Parse" [ M.read (| err |) ]))
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::convert::From"
      Self
      (* Trait polymorphic types *) [ (* T *) Ty.path "core::num::error::ParseIntError" ]
      (* Instance *) [ ("from", InstanceField.Method from) ].
End Impl_core_convert_From_core_num_error_ParseIntError_for_wrapping_errors_DoubleError.

(*
fn double_first(vec: Vec<&str>) -> Result<i32> {
    let first = vec.first().ok_or(DoubleError::EmptyVec)?;
    // Here we implicitly use the `ParseIntError` implementation of `From` (which
    // we defined above) in order to create a `DoubleError`.
    let parsed = first.parse::<i32>()?;

    Ok(2 * parsed)
}
*)
Definition double_first (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [ vec ] =>
    ltac:(M.monadic
      (let vec := M.alloc (| vec |) in
      M.catch_return (|
        ltac:(M.monadic
          (M.read (|
            let first :=
              M.copy (|
                M.match_operator (|
                  M.alloc (|
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::ops::try_trait::Try",
                        Ty.apply
                          (Ty.path "core::result::Result")
                          [
                            Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ];
                            Ty.path "wrapping_errors::DoubleError"
                          ],
                        [],
                        "branch",
                        []
                      |),
                      [
                        M.call_closure (|
                          M.get_associated_function (|
                            Ty.apply
                              (Ty.path "core::option::Option")
                              [ Ty.apply (Ty.path "&") [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ]
                              ],
                            "ok_or",
                            [ Ty.path "wrapping_errors::DoubleError" ]
                          |),
                          [
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.apply
                                  (Ty.path "slice")
                                  [ Ty.apply (Ty.path "&") [ Ty.path "str" ] ],
                                "first",
                                []
                              |),
                              [
                                M.call_closure (|
                                  M.get_trait_method (|
                                    "core::ops::deref::Deref",
                                    Ty.apply
                                      (Ty.path "alloc::vec::Vec")
                                      [
                                        Ty.apply (Ty.path "&") [ Ty.path "str" ];
                                        Ty.path "alloc::alloc::Global"
                                      ],
                                    [],
                                    "deref",
                                    []
                                  |),
                                  [ vec ]
                                |)
                              ]
                            |);
                            Value.StructTuple "wrapping_errors::DoubleError::EmptyVec" []
                          ]
                        |)
                      ]
                    |)
                  |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ0_0 :=
                          M.SubPointer.get_struct_tuple_field (|
                            γ,
                            "core::ops::control_flow::ControlFlow::Break",
                            0
                          |) in
                        let residual := M.copy (| γ0_0 |) in
                        M.alloc (|
                          M.never_to_any (|
                            M.read (|
                              M.return_ (|
                                M.call_closure (|
                                  M.get_trait_method (|
                                    "core::ops::try_trait::FromResidual",
                                    Ty.apply
                                      (Ty.path "core::result::Result")
                                      [ Ty.path "i32"; Ty.path "wrapping_errors::DoubleError" ],
                                    [
                                      Ty.apply
                                        (Ty.path "core::result::Result")
                                        [
                                          Ty.path "core::convert::Infallible";
                                          Ty.path "wrapping_errors::DoubleError"
                                        ]
                                    ],
                                    "from_residual",
                                    []
                                  |),
                                  [ M.read (| residual |) ]
                                |)
                              |)
                            |)
                          |)
                        |)));
                    fun γ =>
                      ltac:(M.monadic
                        (let γ0_0 :=
                          M.SubPointer.get_struct_tuple_field (|
                            γ,
                            "core::ops::control_flow::ControlFlow::Continue",
                            0
                          |) in
                        let val := M.copy (| γ0_0 |) in
                        val))
                  ]
                |)
              |) in
            let parsed :=
              M.copy (|
                M.match_operator (|
                  M.alloc (|
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::ops::try_trait::Try",
                        Ty.apply
                          (Ty.path "core::result::Result")
                          [ Ty.path "i32"; Ty.path "core::num::error::ParseIntError" ],
                        [],
                        "branch",
                        []
                      |),
                      [
                        M.call_closure (|
                          M.get_associated_function (| Ty.path "str", "parse", [ Ty.path "i32" ] |),
                          [ M.read (| M.read (| first |) |) ]
                        |)
                      ]
                    |)
                  |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ0_0 :=
                          M.SubPointer.get_struct_tuple_field (|
                            γ,
                            "core::ops::control_flow::ControlFlow::Break",
                            0
                          |) in
                        let residual := M.copy (| γ0_0 |) in
                        M.alloc (|
                          M.never_to_any (|
                            M.read (|
                              M.return_ (|
                                M.call_closure (|
                                  M.get_trait_method (|
                                    "core::ops::try_trait::FromResidual",
                                    Ty.apply
                                      (Ty.path "core::result::Result")
                                      [ Ty.path "i32"; Ty.path "wrapping_errors::DoubleError" ],
                                    [
                                      Ty.apply
                                        (Ty.path "core::result::Result")
                                        [
                                          Ty.path "core::convert::Infallible";
                                          Ty.path "core::num::error::ParseIntError"
                                        ]
                                    ],
                                    "from_residual",
                                    []
                                  |),
                                  [ M.read (| residual |) ]
                                |)
                              |)
                            |)
                          |)
                        |)));
                    fun γ =>
                      ltac:(M.monadic
                        (let γ0_0 :=
                          M.SubPointer.get_struct_tuple_field (|
                            γ,
                            "core::ops::control_flow::ControlFlow::Continue",
                            0
                          |) in
                        let val := M.copy (| γ0_0 |) in
                        val))
                  ]
                |)
              |) in
            M.alloc (|
              Value.StructTuple
                "core::result::Result::Ok"
                [ BinOp.Panic.mul (| Integer.I32, Value.Integer 2, M.read (| parsed |) |) ]
            |)
          |)))
      |)))
  | _, _ => M.impossible
  end.

Axiom Function_double_first : M.IsFunction "wrapping_errors::double_first" double_first.

(*
fn print(result: Result<i32>) {
    match result {
        Ok(n) => println!("The first doubled is {}", n),
        Err(e) => {
            println!("Error: {}", e);
            if let Some(source) = e.source() {
                println!("  Caused by: {}", source);
            }
        }
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
                                          [ Ty.path "wrapping_errors::DoubleError" ]
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
                  M.alloc (| Value.Tuple [] |) in
                M.match_operator (|
                  M.alloc (| Value.Tuple [] |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ :=
                          M.alloc (|
                            M.call_closure (|
                              M.get_trait_method (|
                                "core::error::Error",
                                Ty.path "wrapping_errors::DoubleError",
                                [],
                                "source",
                                []
                              |),
                              [ e ]
                            |)
                          |) in
                        let γ0_0 :=
                          M.SubPointer.get_struct_tuple_field (|
                            γ,
                            "core::option::Option::Some",
                            0
                          |) in
                        let source := M.copy (| γ0_0 |) in
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
                                              M.read (| Value.String "  Caused by: " |);
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
                                                      (Ty.path "&")
                                                      [ Ty.dyn [ ("core::error::Error::Trait", []) ]
                                                      ]
                                                  ]
                                                |),
                                                [ source ]
                                              |)
                                            ]
                                        |))
                                    ]
                                  |)
                                ]
                              |)
                            |) in
                          M.alloc (| Value.Tuple [] |) in
                        M.alloc (| Value.Tuple [] |)));
                    fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                  ]
                |)))
          ]
        |)
      |)))
  | _, _ => M.impossible
  end.

Axiom Function_print : M.IsFunction "wrapping_errors::print" print.

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
              M.get_function (| "wrapping_errors::print", [] |),
              [
                M.call_closure (|
                  M.get_function (| "wrapping_errors::double_first", [] |),
                  [ M.read (| numbers |) ]
                |)
              ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "wrapping_errors::print", [] |),
              [
                M.call_closure (|
                  M.get_function (| "wrapping_errors::double_first", [] |),
                  [ M.read (| empty |) ]
                |)
              ]
            |)
          |) in
        let _ :=
          M.alloc (|
            M.call_closure (|
              M.get_function (| "wrapping_errors::print", [] |),
              [
                M.call_closure (|
                  M.get_function (| "wrapping_errors::double_first", [] |),
                  [ M.read (| strings |) ]
                |)
              ]
            |)
          |) in
        M.alloc (| Value.Tuple [] |)
      |)))
  | _, _ => M.impossible
  end.

Axiom Function_main : M.IsFunction "wrapping_errors::main" main.
