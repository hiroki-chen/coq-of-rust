(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum List *)
(* {
  ty_params := [];
  variants :=
    [
      {
        name := "Cons";
        item :=
          StructTuple
            [
              Ty.path "u32";
              Ty.apply
                (Ty.path "alloc::boxed::Box")
                [ Ty.path "enums_testcase_linked_list::List"; Ty.path "alloc::alloc::Global" ]
            ];
        discriminant := None;
      };
      {
        name := "Nil";
        item := StructTuple [];
        discriminant := None;
      }
    ];
} *)

Module Impl_enums_testcase_linked_list_List.
  Definition Self : Ty.t := Ty.path "enums_testcase_linked_list::List".
  
  (*
      fn new() -> List {
          // `Nil` has type `List`
          Nil
      }
  *)
  Definition new (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [] => ltac:(M.monadic (Value.StructTuple "enums_testcase_linked_list::List::Nil" []))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
  
  (*
      fn prepend(self, elem: u32) -> List {
          // `Cons` also has type List
          Cons(elem, Box::new(self))
      }
  *)
  Definition prepend (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self; elem ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        let elem := M.alloc (| elem |) in
        Value.StructTuple
          "enums_testcase_linked_list::List::Cons"
          [
            M.read (| elem |);
            M.call_closure
              (|
                (M.get_associated_function
                  (|
                    (Ty.apply
                      (Ty.path "alloc::boxed::Box")
                      [ Ty.path "enums_testcase_linked_list::List"; Ty.path "alloc::alloc::Global"
                      ]),
                    "new",
                    []
                  |)),
                [ M.read (| self |) ]
              |)
          ]))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_prepend : M.IsAssociatedFunction Self "prepend" prepend.
  
  (*
      fn len(&self) -> u32 {
          // `self` has to be matched, because the behavior of this method
          // depends on the variant of `self`
          // `self` has type `&List`, and `*self` has type `List`, matching on a
          // concrete type `T` is preferred over a match on a reference `&T`
          // after Rust 2018 you can use self here and tail (with no ref) below as well,
          // rust will infer &s and ref tail.
          // See https://doc.rust-lang.org/edition-guide/rust-2018/ownership-and-lifetimes/default-match-bindings.html
          match *self {
              // Can't take ownership of the tail, because `self` is borrowed;
              // instead take a reference to the tail
              Cons(_, ref tail) => 1 + tail.len(),
              // Base Case: An empty list has zero length
              Nil => 0,
          }
      }
  *)
  Definition len (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read
          (|
            (M.match_operator
              (|
                (M.read (| self |)),
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ0_0 :=
                        M.get_struct_tuple_field_or_break_match
                          (| γ, "enums_testcase_linked_list::List::Cons", 0
                          |) in
                      let γ0_1 :=
                        M.get_struct_tuple_field_or_break_match
                          (| γ, "enums_testcase_linked_list::List::Cons", 1
                          |) in
                      let tail := M.alloc (| γ0_1 |) in
                      M.alloc
                        (|
                          (BinOp.Panic.add
                            (|
                              (Value.Integer Integer.U32 1),
                              (M.call_closure
                                (|
                                  (M.get_associated_function
                                    (| (Ty.path "enums_testcase_linked_list::List"), "len", []
                                    |)),
                                  [ M.read (| (M.read (| tail |)) |) ]
                                |))
                            |))
                        |)));
                  fun γ => ltac:(M.monadic (M.alloc (| (Value.Integer Integer.U32 0) |)))
                ]
              |))
          |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_len : M.IsAssociatedFunction Self "len" len.
  
  (*
      fn stringify(&self) -> String {
          match *self {
              Cons(head, ref tail) => {
                  // `format!` is similar to `print!`, but returns a heap
                  // allocated string instead of printing to the console
                  format!("{}, {}", head, tail.stringify())
              }
              Nil => {
                  format!("Nil")
              }
          }
      }
  *)
  Definition stringify (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      ltac:(M.monadic
        (let self := M.alloc (| self |) in
        M.read
          (|
            (M.match_operator
              (|
                (M.read (| self |)),
                [
                  fun γ =>
                    ltac:(M.monadic
                      (let γ0_0 :=
                        M.get_struct_tuple_field_or_break_match
                          (| γ, "enums_testcase_linked_list::List::Cons", 0
                          |) in
                      let γ0_1 :=
                        M.get_struct_tuple_field_or_break_match
                          (| γ, "enums_testcase_linked_list::List::Cons", 1
                          |) in
                      let head := M.copy (| γ0_0 |) in
                      let tail := M.alloc (| γ0_1 |) in
                      let res :=
                        M.alloc
                          (|
                            (M.call_closure
                              (|
                                (M.get_function (| "alloc::fmt::format", [] |)),
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
                                                    M.read (| (mk_str "") |);
                                                    M.read (| (mk_str ", ") |)
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
                                                            [ Ty.path "u32" ]
                                                          |)),
                                                        [ head ]
                                                      |);
                                                    M.call_closure
                                                      (|
                                                        (M.get_associated_function
                                                          (|
                                                            (Ty.path "core::fmt::rt::Argument"),
                                                            "new_display",
                                                            [ Ty.path "alloc::string::String" ]
                                                          |)),
                                                        [
                                                          M.alloc
                                                            (|
                                                              (M.call_closure
                                                                (|
                                                                  (M.get_associated_function
                                                                    (|
                                                                      (Ty.path
                                                                        "enums_testcase_linked_list::List"),
                                                                      "stringify",
                                                                      []
                                                                    |)),
                                                                  [ M.read (| (M.read (| tail |)) |)
                                                                  ]
                                                                |))
                                                            |)
                                                        ]
                                                      |)
                                                  ])
                                              |))
                                      ]
                                    |)
                                ]
                              |))
                          |) in
                      res));
                  fun γ =>
                    ltac:(M.monadic
                      (let res :=
                        M.alloc
                          (|
                            (M.call_closure
                              (|
                                (M.get_function (| "alloc::fmt::format", [] |)),
                                [
                                  M.call_closure
                                    (|
                                      (M.get_associated_function
                                        (| (Ty.path "core::fmt::Arguments"), "new_const", []
                                        |)),
                                      [
                                        (* Unsize *)
                                          M.pointer_coercion
                                            (M.alloc
                                              (| (Value.Array [ M.read (| (mk_str "Nil") |) ])
                                              |))
                                      ]
                                    |)
                                ]
                              |))
                          |) in
                      res))
                ]
              |))
          |)))
    | _, _ => M.impossible
    end.
  
  Axiom AssociatedFunction_stringify : M.IsAssociatedFunction Self "stringify" stringify.
End Impl_enums_testcase_linked_list_List.

(*
fn main() {
    // Create an empty linked list
    let mut list = List::new();

    // Prepend some elements
    list = list.prepend(1);
    list = list.prepend(2);
    list = list.prepend(3);

    // Show the final state of the list
    println!("linked list has length: {}", list.len());
    println!("{}", list.stringify());
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    ltac:(M.monadic
      (M.read
        (|
          (let list :=
            M.alloc
              (|
                (M.call_closure
                  (|
                    (M.get_associated_function
                      (| (Ty.path "enums_testcase_linked_list::List"), "new", []
                      |)),
                    []
                  |))
              |) in
          let _ :=
            M.assign
              (|
                list,
                (M.call_closure
                  (|
                    (M.get_associated_function
                      (| (Ty.path "enums_testcase_linked_list::List"), "prepend", []
                      |)),
                    [ M.read (| list |); Value.Integer Integer.U32 1 ]
                  |))
              |) in
          let _ :=
            M.assign
              (|
                list,
                (M.call_closure
                  (|
                    (M.get_associated_function
                      (| (Ty.path "enums_testcase_linked_list::List"), "prepend", []
                      |)),
                    [ M.read (| list |); Value.Integer Integer.U32 2 ]
                  |))
              |) in
          let _ :=
            M.assign
              (|
                list,
                (M.call_closure
                  (|
                    (M.get_associated_function
                      (| (Ty.path "enums_testcase_linked_list::List"), "prepend", []
                      |)),
                    [ M.read (| list |); Value.Integer Integer.U32 3 ]
                  |))
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
                                          M.read (| (mk_str "linked list has length: ") |);
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
                                                  [ Ty.path "u32" ]
                                                |)),
                                              [
                                                M.alloc
                                                  (|
                                                    (M.call_closure
                                                      (|
                                                        (M.get_associated_function
                                                          (|
                                                            (Ty.path
                                                              "enums_testcase_linked_list::List"),
                                                            "len",
                                                            []
                                                          |)),
                                                        [ list ]
                                                      |))
                                                  |)
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
                                        [ M.read (| (mk_str "") |); M.read (| (mk_str "
") |) ])
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
                                                  [ Ty.path "alloc::string::String" ]
                                                |)),
                                              [
                                                M.alloc
                                                  (|
                                                    (M.call_closure
                                                      (|
                                                        (M.get_associated_function
                                                          (|
                                                            (Ty.path
                                                              "enums_testcase_linked_list::List"),
                                                            "stringify",
                                                            []
                                                          |)),
                                                        [ list ]
                                                      |))
                                                  |)
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
          M.alloc (| (Value.Tuple []) |))
        |)))
  | _, _ => M.impossible
  end.
