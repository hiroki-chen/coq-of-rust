(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Food *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Apple";
        item := Tuple [];
        discriminant := None;
      };
      {
        name := "Carrot";
        item := Tuple [];
        discriminant := None;
      };
      {
        name := "Potato";
        item := Tuple [];
        discriminant := None;
      }
    ];
} *)

Module Impl_core_fmt_Debug_for_combinators_map_Food.
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "write_str" in
      let* α1 := M.read f in
      let* α2 :=
        match_operator
          self
          [
            fun γ =>
              let* γ := M.read γ in
              let* α0 := M.read (mk_str "Apple") in
              M.alloc α0;
            fun γ =>
              let* γ := M.read γ in
              let* α0 := M.read (mk_str "Carrot") in
              M.alloc α0;
            fun γ =>
              let* γ := M.read γ in
              let* α0 := M.read (mk_str "Potato") in
              M.alloc α0
          ] in
      let* α3 := M.read α2 in
      M.call α0 [ α1; α3 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "combinators_map::Food")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_combinators_map_Food.

(* Struct Peeled *)

Module Impl_core_fmt_Debug_for_combinators_map_Peeled.
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "debug_tuple_field1_finish" in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "Peeled") in
      let* α3 := M.read self in
      let* α4 := M.alloc (M.get_struct_tuple α3 0) in
      M.call α0 [ α1; α2; M.pointer_coercion (* Unsize *) α4 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "combinators_map::Peeled")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_combinators_map_Peeled.

(* Struct Chopped *)

Module Impl_core_fmt_Debug_for_combinators_map_Chopped.
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "debug_tuple_field1_finish" in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "Chopped") in
      let* α3 := M.read self in
      let* α4 := M.alloc (M.get_struct_tuple α3 0) in
      M.call α0 [ α1; α2; M.pointer_coercion (* Unsize *) α4 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "combinators_map::Chopped")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_combinators_map_Chopped.

(* Struct Cooked *)

Module Impl_core_fmt_Debug_for_combinators_map_Cooked.
  (*
  Debug
  *)
  Definition fmt (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [ Self ], [ self; f ] =>
      let* self := M.alloc self in
      let* f := M.alloc f in
      let* α0 :=
        M.get_associated_function
          (Ty.path "core::fmt::Formatter")
          "debug_tuple_field1_finish" in
      let* α1 := M.read f in
      let* α2 := M.read (mk_str "Cooked") in
      let* α3 := M.read self in
      let* α4 := M.alloc (M.get_struct_tuple α3 0) in
      M.call α0 [ α1; α2; M.pointer_coercion (* Unsize *) α4 ]
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::fmt::Debug"
      (* Self *) (Ty.path "combinators_map::Cooked")
      (* Trait polymorphic types *) []
      (* Instance *) [ ("fmt", InstanceField.Method fmt) ]
      (* Instance polymorphic types *) [].
End Impl_core_fmt_Debug_for_combinators_map_Cooked.

(*
fn peel(food: Option<Food>) -> Option<Peeled> {
    match food {
        Some(food) => Some(Peeled(food)),
        None => None,
    }
}
*)
Definition peel (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ food ] =>
    let* food := M.alloc food in
    let* α0 :=
      match_operator
        food
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::option::Option::Some"
                0 in
            let* food := M.copy γ0_0 in
            let* α0 := M.read food in
            M.alloc
              (Value.StructTuple
                "core::option::Option::Some"
                [ Value.StructTuple "combinators_map::Peeled" [ α0 ] ]);
          fun γ => M.alloc (Value.StructTuple "core::option::Option::None" [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn chop(peeled: Option<Peeled>) -> Option<Chopped> {
    match peeled {
        Some(Peeled(food)) => Some(Chopped(food)),
        None => None,
    }
}
*)
Definition chop (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ peeled ] =>
    let* peeled := M.alloc peeled in
    let* α0 :=
      match_operator
        peeled
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::option::Option::Some"
                0 in
            let* γ1_0 :=
              M.get_struct_tuple_field_or_break_match
                γ0_0
                "combinators_map::Peeled"
                0 in
            let* food := M.copy γ1_0 in
            let* α0 := M.read food in
            M.alloc
              (Value.StructTuple
                "core::option::Option::Some"
                [ Value.StructTuple "combinators_map::Chopped" [ α0 ] ]);
          fun γ => M.alloc (Value.StructTuple "core::option::Option::None" [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn cook(chopped: Option<Chopped>) -> Option<Cooked> {
    chopped.map(|Chopped(food)| Cooked(food))
}
*)
Definition cook (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ chopped ] =>
    let* chopped := M.alloc chopped in
    let* α0 :=
      M.get_associated_function
        (Ty.apply
          (Ty.path "core::option::Option")
          [ Ty.path "combinators_map::Chopped" ])
        "map" in
    let* α1 := M.read chopped in
    M.call
      α0
      [
        α1;
        M.closure
          (fun γ =>
            match γ with
            | [ α0 ] =>
              let* α0 := M.alloc α0 in
              match_operator
                α0
                [
                  fun γ =>
                    let* γ0_0 :=
                      M.get_struct_tuple_field_or_break_match
                        γ
                        "combinators_map::Chopped"
                        0 in
                    let* food := M.copy γ0_0 in
                    let* α0 := M.read food in
                    M.pure (Value.StructTuple "combinators_map::Cooked" [ α0 ])
                ]
            | _ => M.impossible
            end)
      ]
  | _, _ => M.impossible
  end.

(*
fn process(food: Option<Food>) -> Option<Cooked> {
    food.map(|f| Peeled(f))
        .map(|Peeled(f)| Chopped(f))
        .map(|Chopped(f)| Cooked(f))
}
*)
Definition process (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ food ] =>
    let* food := M.alloc food in
    let* α0 :=
      M.get_associated_function
        (Ty.apply
          (Ty.path "core::option::Option")
          [ Ty.path "combinators_map::Chopped" ])
        "map" in
    let* α1 :=
      M.get_associated_function
        (Ty.apply
          (Ty.path "core::option::Option")
          [ Ty.path "combinators_map::Peeled" ])
        "map" in
    let* α2 :=
      M.get_associated_function
        (Ty.apply
          (Ty.path "core::option::Option")
          [ Ty.path "combinators_map::Food" ])
        "map" in
    let* α3 := M.read food in
    let* α4 :=
      M.call
        α2
        [
          α3;
          M.closure
            (fun γ =>
              match γ with
              | [ α0 ] =>
                let* α0 := M.alloc α0 in
                match_operator
                  α0
                  [
                    fun γ =>
                      let* f := M.copy γ in
                      let* α0 := M.read f in
                      M.pure
                        (Value.StructTuple "combinators_map::Peeled" [ α0 ])
                  ]
              | _ => M.impossible
              end)
        ] in
    let* α5 :=
      M.call
        α1
        [
          α4;
          M.closure
            (fun γ =>
              match γ with
              | [ α0 ] =>
                let* α0 := M.alloc α0 in
                match_operator
                  α0
                  [
                    fun γ =>
                      let* γ0_0 :=
                        M.get_struct_tuple_field_or_break_match
                          γ
                          "combinators_map::Peeled"
                          0 in
                      let* f := M.copy γ0_0 in
                      let* α0 := M.read f in
                      M.pure
                        (Value.StructTuple "combinators_map::Chopped" [ α0 ])
                  ]
              | _ => M.impossible
              end)
        ] in
    M.call
      α0
      [
        α5;
        M.closure
          (fun γ =>
            match γ with
            | [ α0 ] =>
              let* α0 := M.alloc α0 in
              match_operator
                α0
                [
                  fun γ =>
                    let* γ0_0 :=
                      M.get_struct_tuple_field_or_break_match
                        γ
                        "combinators_map::Chopped"
                        0 in
                    let* f := M.copy γ0_0 in
                    let* α0 := M.read f in
                    M.pure (Value.StructTuple "combinators_map::Cooked" [ α0 ])
                ]
            | _ => M.impossible
            end)
      ]
  | _, _ => M.impossible
  end.

(*
fn eat(food: Option<Cooked>) {
    match food {
        Some(food) => println!("Mmm. I love {:?}", food),
        None => println!("Oh no! It wasn't edible."),
    }
}
*)
Definition eat (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ food ] =>
    let* food := M.alloc food in
    let* α0 :=
      match_operator
        food
        [
          fun γ =>
            let* γ0_0 :=
              M.get_struct_tuple_field_or_break_match
                γ
                "core::option::Option::Some"
                0 in
            let* food := M.copy γ0_0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1" in
              let* α2 := M.read (mk_str "Mmm. I love ") in
              let* α3 := M.read (mk_str "
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_debug" in
              let* α6 := M.call α5 [ food ] in
              let* α7 := M.alloc (Value.Array [ α6 ]) in
              let* α8 :=
                M.call
                  α1
                  [
                    M.pointer_coercion (* Unsize *) α4;
                    M.pointer_coercion (* Unsize *) α7
                  ] in
              let* α9 := M.call α0 [ α8 ] in
              M.alloc α9 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_const" in
              let* α2 := M.read (mk_str "Oh no! It wasn't edible.
") in
              let* α3 := M.alloc (Value.Array [ α2 ]) in
              let* α4 := M.call α1 [ M.pointer_coercion (* Unsize *) α3 ] in
              let* α5 := M.call α0 [ α4 ] in
              M.alloc α5 in
            M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.

(*
fn main() {
    let apple = Some(Food::Apple);
    let carrot = Some(Food::Carrot);
    let potato = None;

    let cooked_apple = cook(chop(peel(apple)));
    let cooked_carrot = cook(chop(peel(carrot)));
    // Let's try the simpler looking `process()` now.
    let cooked_potato = process(potato);

    eat(cooked_apple);
    eat(cooked_carrot);
    eat(cooked_potato);
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* apple :=
      M.alloc
        (Value.StructTuple
          "core::option::Option::Some"
          [ Value.StructTuple "combinators_map::Food::Apple" [] ]) in
    let* carrot :=
      M.alloc
        (Value.StructTuple
          "core::option::Option::Some"
          [ Value.StructTuple "combinators_map::Food::Carrot" [] ]) in
    let* potato :=
      M.alloc (Value.StructTuple "core::option::Option::None" []) in
    let* cooked_apple :=
      let* α0 := M.get_function "combinators_map::cook" [] in
      let* α1 := M.get_function "combinators_map::chop" [] in
      let* α2 := M.get_function "combinators_map::peel" [] in
      let* α3 := M.read apple in
      let* α4 := M.call α2 [ α3 ] in
      let* α5 := M.call α1 [ α4 ] in
      let* α6 := M.call α0 [ α5 ] in
      M.alloc α6 in
    let* cooked_carrot :=
      let* α0 := M.get_function "combinators_map::cook" [] in
      let* α1 := M.get_function "combinators_map::chop" [] in
      let* α2 := M.get_function "combinators_map::peel" [] in
      let* α3 := M.read carrot in
      let* α4 := M.call α2 [ α3 ] in
      let* α5 := M.call α1 [ α4 ] in
      let* α6 := M.call α0 [ α5 ] in
      M.alloc α6 in
    let* cooked_potato :=
      let* α0 := M.get_function "combinators_map::process" [] in
      let* α1 := M.read potato in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 := M.get_function "combinators_map::eat" [] in
      let* α1 := M.read cooked_apple in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 := M.get_function "combinators_map::eat" [] in
      let* α1 := M.read cooked_carrot in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* _ :=
      let* α0 := M.get_function "combinators_map::eat" [] in
      let* α1 := M.read cooked_potato in
      let* α2 := M.call α0 [ α1 ] in
      M.alloc α2 in
    let* α0 := M.alloc (Value.Tuple []) in
    M.read α0
  | _, _ => M.impossible
  end.
