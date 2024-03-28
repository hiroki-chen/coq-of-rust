(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Fibonacci";
    ty_params := [];
    fields := [ ("curr", Ty.path "u32"); ("next", Ty.path "u32") ];
  } *)

Module Impl_core_iter_traits_iterator_Iterator_for_iterators_Fibonacci.
  Definition Self : Ty.t := Ty.path "iterators::Fibonacci".
  
  (*
      type Item = u32;
  *)
  Definition Item : Ty.t := Ty.path "u32".
  
  (*
      fn next(&mut self) -> Option<Self::Item> {
          let current = self.curr;
  
          self.curr = self.next;
          self.next = current + self.next;
  
          // Since there's no endpoint to a Fibonacci sequence, the `Iterator`
          // will never return `None`, and `Some` is always returned.
          Some(current)
      }
  *)
  Definition next (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ self ] =>
      let* self := M.alloc self in
      let* current :=
        let* α0 := M.read self in
        M.copy (M.get_struct_record_field α0 "iterators::Fibonacci" "curr") in
      let* _ :=
        let* α0 := M.read self in
        let* α1 := M.read self in
        let* α2 :=
          M.read (M.get_struct_record_field α1 "iterators::Fibonacci" "next") in
        M.assign
          (M.get_struct_record_field α0 "iterators::Fibonacci" "curr")
          α2 in
      let* _ :=
        let* α0 := M.read self in
        let* α1 := M.read current in
        let* α2 := M.read self in
        let* α3 :=
          M.read (M.get_struct_record_field α2 "iterators::Fibonacci" "next") in
        let* α4 := BinOp.Panic.add α1 α3 in
        M.assign
          (M.get_struct_record_field α0 "iterators::Fibonacci" "next")
          α4 in
      let* α0 := M.read current in
      let* α0 :=
        M.alloc (Value.StructTuple "core::option::Option::Some" [ α0 ]) in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Axiom Implements :
    M.IsTraitInstance
      "core::iter::traits::iterator::Iterator"
      Self
      (* Trait polymorphic types *) []
      (* Instance *)
        [ ("Item", InstanceField.Ty Item); ("next", InstanceField.Method next)
        ].
End Impl_core_iter_traits_iterator_Iterator_for_iterators_Fibonacci.

(*
fn fibonacci() -> Fibonacci {
    Fibonacci { curr: 0, next: 1 }
}
*)
Definition fibonacci (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    M.pure
      (Value.StructRecord
        "iterators::Fibonacci"
        [
          ("curr", Value.Integer Integer.U32 0);
          ("next", Value.Integer Integer.U32 1)
        ])
  | _, _ => M.impossible
  end.

(*
fn main() {
    // `0..3` is an `Iterator` that generates: 0, 1, and 2.
    let mut sequence = 0..3;

    println!("Four consecutive `next` calls on 0..3");
    println!("> {:?}", sequence.next());
    println!("> {:?}", sequence.next());
    println!("> {:?}", sequence.next());
    println!("> {:?}", sequence.next());

    // `for` works through an `Iterator` until it returns `None`.
    // Each `Some` value is unwrapped and bound to a variable (here, `i`).
    println!("Iterate through 0..3 using `for`");
    for i in 0..3 {
        println!("> {}", i);
    }

    // The `take(n)` method reduces an `Iterator` to its first `n` terms.
    println!("The first four terms of the Fibonacci sequence are: ");
    for i in fibonacci().take(4) {
        println!("> {}", i);
    }

    // The `skip(n)` method shortens an `Iterator` by dropping its first `n` terms.
    println!("The next four terms of the Fibonacci sequence are: ");
    for i in fibonacci().skip(4).take(4) {
        println!("> {}", i);
    }

    let array = [1u32, 3, 3, 7];

    // The `iter` method produces an `Iterator` over an array/slice.
    println!("Iterate the following array {:?}", &array);
    for i in array.iter() {
        println!("> {}", i);
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with
  | [], [] =>
    let* sequence :=
      M.alloc
        (Value.StructRecord
          "core::ops::range::Range"
          [
            ("start", Value.Integer Integer.I32 0);
            ("end_", Value.Integer Integer.I32 3)
          ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_const"
            [] in
        let* α2 := M.read (mk_str "Four consecutive `next` calls on 0..3
") in
        let* α3 := M.alloc (Value.Array [ α2 ]) in
        let* α4 := M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
        let* α5 := M.call_closure α0 [ α4 ] in
        M.alloc α5 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "> ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ] ] in
        let* α6 :=
          M.get_trait_method
            "core::iter::traits::iterator::Iterator"
            (Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "i32" ])
            []
            "next"
            [] in
        let* α7 := M.call_closure α6 [ sequence ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call_closure α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call_closure α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "> ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ] ] in
        let* α6 :=
          M.get_trait_method
            "core::iter::traits::iterator::Iterator"
            (Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "i32" ])
            []
            "next"
            [] in
        let* α7 := M.call_closure α6 [ sequence ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call_closure α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call_closure α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "> ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ] ] in
        let* α6 :=
          M.get_trait_method
            "core::iter::traits::iterator::Iterator"
            (Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "i32" ])
            []
            "next"
            [] in
        let* α7 := M.call_closure α6 [ sequence ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call_closure α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call_closure α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "> ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [ Ty.apply (Ty.path "core::option::Option") [ Ty.path "i32" ] ] in
        let* α6 :=
          M.get_trait_method
            "core::iter::traits::iterator::Iterator"
            (Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "i32" ])
            []
            "next"
            [] in
        let* α7 := M.call_closure α6 [ sequence ] in
        let* α8 := M.alloc α7 in
        let* α9 := M.call_closure α5 [ α8 ] in
        let* α10 := M.alloc (Value.Array [ α9 ]) in
        let* α11 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α10
            ] in
        let* α12 := M.call_closure α0 [ α11 ] in
        M.alloc α12 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_const"
            [] in
        let* α2 := M.read (mk_str "Iterate through 0..3 using `for`
") in
        let* α3 := M.alloc (Value.Array [ α2 ]) in
        let* α4 := M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
        let* α5 := M.call_closure α0 [ α4 ] in
        M.alloc α5 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::collect::IntoIterator"
          (Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "i32" ])
          []
          "into_iter"
          [] in
      let* α1 :=
        M.call_closure
          α0
          [
            Value.StructRecord
              "core::ops::range::Range"
              [
                ("start", Value.Integer Integer.I32 0);
                ("end_", Value.Integer Integer.I32 3)
              ]
          ] in
      let* α2 := M.alloc α1 in
      let* α3 :=
        match_operator
          α2
          [
            fun γ =>
              let* iter := M.copy γ in
              M.loop
                (let* _ :=
                  let* α0 :=
                    M.get_trait_method
                      "core::iter::traits::iterator::Iterator"
                      (Ty.apply
                        (Ty.path "core::ops::range::Range")
                        [ Ty.path "i32" ])
                      []
                      "next"
                      [] in
                  let* α1 := M.call_closure α0 [ iter ] in
                  let* α2 := M.alloc α1 in
                  match_operator
                    α2
                    [
                      fun γ =>
                        let* α0 := M.break in
                        let* α1 := M.read α0 in
                        let* α2 := M.never_to_any α1 in
                        M.alloc α2;
                      fun γ =>
                        let* γ0_0 :=
                          M.get_struct_tuple_field_or_break_match
                            γ
                            "core::option::Option::Some"
                            0 in
                        let* i := M.copy γ0_0 in
                        let* _ :=
                          let* _ :=
                            let* α0 :=
                              M.get_function "std::io::stdio::_print" [] in
                            let* α1 :=
                              M.get_associated_function
                                (Ty.path "core::fmt::Arguments")
                                "new_v1"
                                [] in
                            let* α2 := M.read (mk_str "> ") in
                            let* α3 := M.read (mk_str "
") in
                            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                            let* α5 :=
                              M.get_associated_function
                                (Ty.path "core::fmt::rt::Argument")
                                "new_display"
                                [ Ty.path "i32" ] in
                            let* α6 := M.call_closure α5 [ i ] in
                            let* α7 := M.alloc (Value.Array [ α6 ]) in
                            let* α8 :=
                              M.call_closure
                                α1
                                [
                                  M.pointer_coercion (* Unsize *) α4;
                                  M.pointer_coercion (* Unsize *) α7
                                ] in
                            let* α9 := M.call_closure α0 [ α8 ] in
                            M.alloc α9 in
                          M.alloc (Value.Tuple []) in
                        M.alloc (Value.Tuple [])
                    ] in
                M.alloc (Value.Tuple []))
          ] in
      M.pure (M.use α3) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_const"
            [] in
        let* α2 :=
          M.read
            (mk_str "The first four terms of the Fibonacci sequence are: 
") in
        let* α3 := M.alloc (Value.Array [ α2 ]) in
        let* α4 := M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
        let* α5 := M.call_closure α0 [ α4 ] in
        M.alloc α5 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::collect::IntoIterator"
          (Ty.apply
            (Ty.path "core::iter::adapters::take::Take")
            [ Ty.path "iterators::Fibonacci" ])
          []
          "into_iter"
          [] in
      let* α1 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          (Ty.path "iterators::Fibonacci")
          []
          "take"
          [] in
      let* α2 := M.get_function "iterators::fibonacci" [] in
      let* α3 := M.call_closure α2 [] in
      let* α4 := M.call_closure α1 [ α3; Value.Integer Integer.Usize 4 ] in
      let* α5 := M.call_closure α0 [ α4 ] in
      let* α6 := M.alloc α5 in
      let* α7 :=
        match_operator
          α6
          [
            fun γ =>
              let* iter := M.copy γ in
              M.loop
                (let* _ :=
                  let* α0 :=
                    M.get_trait_method
                      "core::iter::traits::iterator::Iterator"
                      (Ty.apply
                        (Ty.path "core::iter::adapters::take::Take")
                        [ Ty.path "iterators::Fibonacci" ])
                      []
                      "next"
                      [] in
                  let* α1 := M.call_closure α0 [ iter ] in
                  let* α2 := M.alloc α1 in
                  match_operator
                    α2
                    [
                      fun γ =>
                        let* α0 := M.break in
                        let* α1 := M.read α0 in
                        let* α2 := M.never_to_any α1 in
                        M.alloc α2;
                      fun γ =>
                        let* γ0_0 :=
                          M.get_struct_tuple_field_or_break_match
                            γ
                            "core::option::Option::Some"
                            0 in
                        let* i := M.copy γ0_0 in
                        let* _ :=
                          let* _ :=
                            let* α0 :=
                              M.get_function "std::io::stdio::_print" [] in
                            let* α1 :=
                              M.get_associated_function
                                (Ty.path "core::fmt::Arguments")
                                "new_v1"
                                [] in
                            let* α2 := M.read (mk_str "> ") in
                            let* α3 := M.read (mk_str "
") in
                            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                            let* α5 :=
                              M.get_associated_function
                                (Ty.path "core::fmt::rt::Argument")
                                "new_display"
                                [ Ty.path "u32" ] in
                            let* α6 := M.call_closure α5 [ i ] in
                            let* α7 := M.alloc (Value.Array [ α6 ]) in
                            let* α8 :=
                              M.call_closure
                                α1
                                [
                                  M.pointer_coercion (* Unsize *) α4;
                                  M.pointer_coercion (* Unsize *) α7
                                ] in
                            let* α9 := M.call_closure α0 [ α8 ] in
                            M.alloc α9 in
                          M.alloc (Value.Tuple []) in
                        M.alloc (Value.Tuple [])
                    ] in
                M.alloc (Value.Tuple []))
          ] in
      M.pure (M.use α7) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_const"
            [] in
        let* α2 :=
          M.read
            (mk_str "The next four terms of the Fibonacci sequence are: 
") in
        let* α3 := M.alloc (Value.Array [ α2 ]) in
        let* α4 := M.call_closure α1 [ M.pointer_coercion (* Unsize *) α3 ] in
        let* α5 := M.call_closure α0 [ α4 ] in
        M.alloc α5 in
      M.alloc (Value.Tuple []) in
    let* _ :=
      let* α0 :=
        M.get_trait_method
          "core::iter::traits::collect::IntoIterator"
          (Ty.apply
            (Ty.path "core::iter::adapters::take::Take")
            [
              Ty.apply
                (Ty.path "core::iter::adapters::skip::Skip")
                [ Ty.path "iterators::Fibonacci" ]
            ])
          []
          "into_iter"
          [] in
      let* α1 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          (Ty.apply
            (Ty.path "core::iter::adapters::skip::Skip")
            [ Ty.path "iterators::Fibonacci" ])
          []
          "take"
          [] in
      let* α2 :=
        M.get_trait_method
          "core::iter::traits::iterator::Iterator"
          (Ty.path "iterators::Fibonacci")
          []
          "skip"
          [] in
      let* α3 := M.get_function "iterators::fibonacci" [] in
      let* α4 := M.call_closure α3 [] in
      let* α5 := M.call_closure α2 [ α4; Value.Integer Integer.Usize 4 ] in
      let* α6 := M.call_closure α1 [ α5; Value.Integer Integer.Usize 4 ] in
      let* α7 := M.call_closure α0 [ α6 ] in
      let* α8 := M.alloc α7 in
      let* α9 :=
        match_operator
          α8
          [
            fun γ =>
              let* iter := M.copy γ in
              M.loop
                (let* _ :=
                  let* α0 :=
                    M.get_trait_method
                      "core::iter::traits::iterator::Iterator"
                      (Ty.apply
                        (Ty.path "core::iter::adapters::take::Take")
                        [
                          Ty.apply
                            (Ty.path "core::iter::adapters::skip::Skip")
                            [ Ty.path "iterators::Fibonacci" ]
                        ])
                      []
                      "next"
                      [] in
                  let* α1 := M.call_closure α0 [ iter ] in
                  let* α2 := M.alloc α1 in
                  match_operator
                    α2
                    [
                      fun γ =>
                        let* α0 := M.break in
                        let* α1 := M.read α0 in
                        let* α2 := M.never_to_any α1 in
                        M.alloc α2;
                      fun γ =>
                        let* γ0_0 :=
                          M.get_struct_tuple_field_or_break_match
                            γ
                            "core::option::Option::Some"
                            0 in
                        let* i := M.copy γ0_0 in
                        let* _ :=
                          let* _ :=
                            let* α0 :=
                              M.get_function "std::io::stdio::_print" [] in
                            let* α1 :=
                              M.get_associated_function
                                (Ty.path "core::fmt::Arguments")
                                "new_v1"
                                [] in
                            let* α2 := M.read (mk_str "> ") in
                            let* α3 := M.read (mk_str "
") in
                            let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                            let* α5 :=
                              M.get_associated_function
                                (Ty.path "core::fmt::rt::Argument")
                                "new_display"
                                [ Ty.path "u32" ] in
                            let* α6 := M.call_closure α5 [ i ] in
                            let* α7 := M.alloc (Value.Array [ α6 ]) in
                            let* α8 :=
                              M.call_closure
                                α1
                                [
                                  M.pointer_coercion (* Unsize *) α4;
                                  M.pointer_coercion (* Unsize *) α7
                                ] in
                            let* α9 := M.call_closure α0 [ α8 ] in
                            M.alloc α9 in
                          M.alloc (Value.Tuple []) in
                        M.alloc (Value.Tuple [])
                    ] in
                M.alloc (Value.Tuple []))
          ] in
      M.pure (M.use α9) in
    let* array :=
      M.alloc
        (Value.Array
          [
            Value.Integer Integer.U32 1;
            Value.Integer Integer.U32 3;
            Value.Integer Integer.U32 3;
            Value.Integer Integer.U32 7
          ]) in
    let* _ :=
      let* _ :=
        let* α0 := M.get_function "std::io::stdio::_print" [] in
        let* α1 :=
          M.get_associated_function
            (Ty.path "core::fmt::Arguments")
            "new_v1"
            [] in
        let* α2 := M.read (mk_str "Iterate the following array ") in
        let* α3 := M.read (mk_str "
") in
        let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
        let* α5 :=
          M.get_associated_function
            (Ty.path "core::fmt::rt::Argument")
            "new_debug"
            [
              Ty.apply
                (Ty.path "&")
                [ Ty.apply (Ty.path "array") [ Ty.path "u32" ] ]
            ] in
        let* α6 := M.alloc array in
        let* α7 := M.call_closure α5 [ α6 ] in
        let* α8 := M.alloc (Value.Array [ α7 ]) in
        let* α9 :=
          M.call_closure
            α1
            [
              M.pointer_coercion (* Unsize *) α4;
              M.pointer_coercion (* Unsize *) α8
            ] in
        let* α10 := M.call_closure α0 [ α9 ] in
        M.alloc α10 in
      M.alloc (Value.Tuple []) in
    let* α0 :=
      M.get_trait_method
        "core::iter::traits::collect::IntoIterator"
        (Ty.apply (Ty.path "core::slice::iter::Iter") [ Ty.path "u32" ])
        []
        "into_iter"
        [] in
    let* α1 :=
      M.get_associated_function
        (Ty.apply (Ty.path "slice") [ Ty.path "u32" ])
        "iter"
        [] in
    let* α2 := M.call_closure α1 [ M.pointer_coercion (* Unsize *) array ] in
    let* α3 := M.call_closure α0 [ α2 ] in
    let* α4 := M.alloc α3 in
    let* α5 :=
      match_operator
        α4
        [
          fun γ =>
            let* iter := M.copy γ in
            M.loop
              (let* _ :=
                let* α0 :=
                  M.get_trait_method
                    "core::iter::traits::iterator::Iterator"
                    (Ty.apply
                      (Ty.path "core::slice::iter::Iter")
                      [ Ty.path "u32" ])
                    []
                    "next"
                    [] in
                let* α1 := M.call_closure α0 [ iter ] in
                let* α2 := M.alloc α1 in
                match_operator
                  α2
                  [
                    fun γ =>
                      let* α0 := M.break in
                      let* α1 := M.read α0 in
                      let* α2 := M.never_to_any α1 in
                      M.alloc α2;
                    fun γ =>
                      let* γ0_0 :=
                        M.get_struct_tuple_field_or_break_match
                          γ
                          "core::option::Option::Some"
                          0 in
                      let* i := M.copy γ0_0 in
                      let* _ :=
                        let* _ :=
                          let* α0 :=
                            M.get_function "std::io::stdio::_print" [] in
                          let* α1 :=
                            M.get_associated_function
                              (Ty.path "core::fmt::Arguments")
                              "new_v1"
                              [] in
                          let* α2 := M.read (mk_str "> ") in
                          let* α3 := M.read (mk_str "
") in
                          let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
                          let* α5 :=
                            M.get_associated_function
                              (Ty.path "core::fmt::rt::Argument")
                              "new_display"
                              [ Ty.apply (Ty.path "&") [ Ty.path "u32" ] ] in
                          let* α6 := M.call_closure α5 [ i ] in
                          let* α7 := M.alloc (Value.Array [ α6 ]) in
                          let* α8 :=
                            M.call_closure
                              α1
                              [
                                M.pointer_coercion (* Unsize *) α4;
                                M.pointer_coercion (* Unsize *) α7
                              ] in
                          let* α9 := M.call_closure α0 [ α8 ] in
                          M.alloc α9 in
                        M.alloc (Value.Tuple []) in
                      M.alloc (Value.Tuple [])
                  ] in
              M.alloc (Value.Tuple []))
        ] in
    M.read (M.use α5)
  | _, _ => M.impossible
  end.
