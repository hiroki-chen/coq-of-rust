(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Axiom Result :
  forall (T : Ty.t),
  (Ty.path "boxing_errors::Result") =
    (Ty.apply
      (Ty.path "core::result::Result")
      [
        T;
        Ty.apply
          (Ty.path "alloc::boxed::Box")
          [
            Ty.dyn [ ("core::error::Error::Trait", []) ];
            Ty.path "alloc::alloc::Global"
          ]
      ]).

(* Struct EmptyVec *)

Module Impl_core_fmt_Debug_for_boxing_errors_EmptyVec.
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 := M.read (mk_str "EmptyVec") in
      M.call (Ty.path "core::fmt::Formatter")::["write_str"] [ α0; α1 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "boxing_errors::EmptyVec")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_boxing_errors_EmptyVec.

Module Impl_core_clone_Clone_for_boxing_errors_EmptyVec.
  (*
  Clone
  *)
  Definition clone (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self ] =>
      let* self := M.alloc self in
      M.pure boxing_errors.EmptyVec.Build
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::clone::Clone"
      (* Self *) (Ty.path "boxing_errors::EmptyVec")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("clone", InstanceField.Method clone) ]
      (* Instance polymorphic types *) [].
End Impl_core_clone_Clone_for_boxing_errors_EmptyVec.

Module Impl_core_fmt_Display_for_boxing_errors_EmptyVec.
  (*
      fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
          write!(f, "invalid first item to double")
      }
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 := M.read f in
      let* α1 := M.read (mk_str "invalid first item to double") in
      let* α2 := M.alloc [ α1 ] in
      let* α3 :=
        M.call
          (Ty.path "core::fmt::Arguments")::["new_const"]
          [ M.pointer_coercion "Unsize" α2 ] in
      M.call (Ty.path "core::fmt::Formatter")::["write_fmt"] [ α0; α3 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Display"
      (* Self *) (Ty.path "boxing_errors::EmptyVec")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Display_for_boxing_errors_EmptyVec.

Module Impl_core_error_Error_for_boxing_errors_EmptyVec.
  Axiom Implements :
    M.IsTraitInstance
      "core::error::Error"
      (* Self *) (Ty.path "boxing_errors::EmptyVec")
      (* Trait polymorphic types *) []
      (* Instance *) []
      (* Instance polymorphic types *) [].
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
Definition double_first (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ vec ] =>
    let* vec := M.alloc vec in
    let* α0 :=
      M.get_trait_method
        "core::ops::deref::Deref"
        "deref"
        [
          (* Self *)
            Ty.apply
              (Ty.path "alloc::vec::Vec")
              [
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.path "alloc::alloc::Global"
              ]
        ] in
    let* α1 := M.call α0 [ vec ] in
    let* α2 :=
      M.call
        (Ty.apply
            (Ty.path "slice")
            [ Ty.apply (Ty.path "ref") [ Ty.path "str" ] ])::["first"]
        [ α1 ] in
    let* α3 :=
      M.call
        (Ty.apply
            (Ty.path "core::option::Option")
            [
              Ty.apply
                (Ty.path "ref")
                [ Ty.apply (Ty.path "ref") [ Ty.path "str" ] ]
            ])::["ok_or_else"]
        [
          α2;
          fun (α0 : Ty.path "unit") =>
            (let* α0 := M.alloc α0 in
            match_operator
              α0
              [
                fun γ =>
                  (let* α0 :=
                    M.get_trait_method
                      "core::convert::Into"
                      "into"
                      [
                        (* Self *) Ty.path "boxing_errors::EmptyVec";
                        (* T *)
                          Ty.apply
                            (Ty.path "alloc::boxed::Box")
                            [
                              Ty.dyn [ ("core::error::Error::Trait", []) ];
                              Ty.path "alloc::alloc::Global"
                            ]
                      ] in
                  M.call α0 [ boxing_errors.EmptyVec.Build ])
              ])
        ] in
    M.call
      (Ty.apply
          (Ty.path "core::result::Result")
          [
            Ty.apply
              (Ty.path "ref")
              [ Ty.apply (Ty.path "ref") [ Ty.path "str" ] ];
            Ty.apply
              (Ty.path "alloc::boxed::Box")
              [
                Ty.dyn [ ("core::error::Error::Trait", []) ];
                Ty.path "alloc::alloc::Global"
              ]
          ])::["and_then"]
      [
        α3;
        fun
            (α0 :
              Ty.apply
                (Ty.path "ref")
                [ Ty.apply (Ty.path "ref") [ Ty.path "str" ] ]) =>
          (let* α0 := M.alloc α0 in
          match_operator
            α0
            [
              fun γ =>
                (let* s := M.copy γ in
                let* α0 := M.read s in
                let* α1 := M.read α0 in
                let* α2 := M.call (Ty.path "str")::["parse"] [ α1 ] in
                let* α3 :=
                  M.call
                    (Ty.apply
                        (Ty.path "core::result::Result")
                        [
                          Ty.path "i32";
                          Ty.path "core::num::error::ParseIntError"
                        ])::["map_err"]
                    [
                      α2;
                      fun (α0 : Ty.path "core::num::error::ParseIntError") =>
                        (let* α0 := M.alloc α0 in
                        match_operator
                          α0
                          [
                            fun γ =>
                              (let* e := M.copy γ in
                              let* α0 :=
                                M.get_trait_method
                                  "core::convert::Into"
                                  "into"
                                  [
                                    (* Self *)
                                      Ty.path "core::num::error::ParseIntError";
                                    (* T *)
                                      Ty.apply
                                        (Ty.path "alloc::boxed::Box")
                                        [
                                          Ty.dyn
                                            [ ("core::error::Error::Trait", [])
                                            ];
                                          Ty.path "alloc::alloc::Global"
                                        ]
                                  ] in
                              let* α1 := M.read e in
                              M.call α0 [ α1 ])
                          ])
                    ] in
                M.call
                  (Ty.apply
                      (Ty.path "core::result::Result")
                      [
                        Ty.path "i32";
                        Ty.apply
                          (Ty.path "alloc::boxed::Box")
                          [
                            Ty.dyn [ ("core::error::Error::Trait", []) ];
                            Ty.path "alloc::alloc::Global"
                          ]
                      ])::["map"]
                  [
                    α3;
                    fun (α0 : Ty.path "i32") =>
                      (let* α0 := M.alloc α0 in
                      match_operator
                        α0
                        [
                          fun γ =>
                            (let* i := M.copy γ in
                            let* α0 := M.read i in
                            BinOp.Panic.mul (Value.Integer Integer.I32 2) α0)
                        ])
                  ])
            ])
      ]
  | _, _ => M.impossible
  end.

(*
fn print(result: Result<i32>) {
    match result {
        Ok(n) => println!("The first doubled is {}", n),
        Err(e) => println!("Error: {}", e),
    }
}
*)
Definition print (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ result ] =>
    let* result := M.alloc result in
    let* α0 :=
      match_operator
        result
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.result.Result.Ok _ =>
              let* γ0_0 :=
                let* α0 := M.var "core::result::Result::Get_Ok_0" in
                M.pure (α0 γ) in
              let* n := M.copy γ0_0 in
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "The first doubled is ") in
                let* α2 := M.read (mk_str "
") in
                let* α3 := M.alloc [ α1; α2 ] in
                let* α4 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ n ] in
                let* α5 := M.alloc [ α4 ] in
                let* α6 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [
                      M.pointer_coercion "Unsize" α3;
                      M.pointer_coercion "Unsize" α5
                    ] in
                let* α7 := M.call α0 [ α6 ] in
                M.alloc α7 in
              M.alloc tt
            | _ => M.break_match 
            end);
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | core.result.Result.Err _ =>
              let* γ0_0 :=
                let* α0 := M.var "core::result::Result::Get_Err_0" in
                M.pure (α0 γ) in
              let* e := M.copy γ0_0 in
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "Error: ") in
                let* α2 := M.read (mk_str "
") in
                let* α3 := M.alloc [ α1; α2 ] in
                let* α4 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ e ] in
                let* α5 := M.alloc [ α4 ] in
                let* α6 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [
                      M.pointer_coercion "Unsize" α3;
                      M.pointer_coercion "Unsize" α5
                    ] in
                let* α7 := M.call α0 [ α6 ] in
                M.alloc α7 in
              M.alloc tt
            | _ => M.break_match 
            end)
        ] in
    M.read α0
  | _, _ => M.impossible
  end.

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
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* numbers :=
      let* α0 := M.read (mk_str "42") in
      let* α1 := M.read (mk_str "93") in
      let* α2 := M.read (mk_str "18") in
      let* α3 := M.alloc [ α0; α1; α2 ] in
      let* α4 :=
        M.call
          (alloc.boxed.Box.t _ alloc.boxed.Box.Default.A)::["new"]
          [ α3 ] in
      let* α5 := M.read α4 in
      let* α6 :=
        M.call
          (Ty.apply
              (Ty.path "slice")
              [ Ty.apply (Ty.path "ref") [ Ty.path "str" ] ])::["into_vec"]
          [ M.pointer_coercion "Unsize" α5 ] in
      M.alloc α6 in
    let* empty :=
      let* α0 :=
        M.call
          (Ty.apply
              (Ty.path "alloc::vec::Vec")
              [
                Ty.apply (Ty.path "ref") [ Ty.path "str" ];
                Ty.path "alloc::alloc::Global"
              ])::["new"]
          [] in
      M.alloc α0 in
    let* strings :=
      let* α0 := M.read (mk_str "tofu") in
      let* α1 := M.read (mk_str "93") in
      let* α2 := M.read (mk_str "18") in
      let* α3 := M.alloc [ α0; α1; α2 ] in
      let* α4 :=
        M.call
          (alloc.boxed.Box.t _ alloc.boxed.Box.Default.A)::["new"]
          [ α3 ] in
      let* α5 := M.read α4 in
      let* α6 :=
        M.call
          (Ty.apply
              (Ty.path "slice")
              [ Ty.apply (Ty.path "ref") [ Ty.path "str" ] ])::["into_vec"]
          [ M.pointer_coercion "Unsize" α5 ] in
      M.alloc α6 in
    let* _ :=
      let* α0 := M.var "boxing_errors::print" in
      let* α1 := M.var "boxing_errors::double_first" in
      let* α2 := M.read numbers in
      let* α3 := M.call α1 [ α2 ] in
      let* α4 := M.call α0 [ α3 ] in
      M.alloc α4 in
    let* _ :=
      let* α0 := M.var "boxing_errors::print" in
      let* α1 := M.var "boxing_errors::double_first" in
      let* α2 := M.read empty in
      let* α3 := M.call α1 [ α2 ] in
      let* α4 := M.call α0 [ α3 ] in
      M.alloc α4 in
    let* _ :=
      let* α0 := M.var "boxing_errors::print" in
      let* α1 := M.var "boxing_errors::double_first" in
      let* α2 := M.read strings in
      let* α3 := M.call α1 [ α2 ] in
      let* α4 := M.call α0 [ α3 ] in
      M.alloc α4 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
