(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    // Try changing the values in the array, or make it a slice!
    let array = [1, -2, 6];

    match array {
        // Binds the second and the third elements to the respective variables
        [0, second, third] => println!("array[0] = 0, array[1] = {}, array[2] = {}", second, third),

        // Single values can be ignored with _
        [1, _, third] => println!(
            "array[0] = 1, array[2] = {} and array[1] was ignored",
            third
        ),

        // You can also bind some and ignore the rest
        [-1, second, ..] => println!(
            "array[0] = -1, array[1] = {} and all the other ones were ignored",
            second
        ),
        // The code below would not compile
        // [-1, second] => ...

        // Or store them in another array/slice (the type depends on
        // that of the value that is being matched against)
        [3, second, tail @ ..] => println!(
            "array[0] = 3, array[1] = {} and the other elements were {:?}",
            second, tail
        ),

        // Combining these patterns, we can, for example, bind the first and
        // last values, and store the rest of them in a single array
        [first, middle @ .., last] => println!(
            "array[0] = {}, middle = {:?}, array[2] = {}",
            first, middle, last
        ),
    }
}
*)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* array_ :=
      M.alloc
        (Value.Array
          [
            Value.Integer Integer.I32 1;
            Value.Integer Integer.I32 (-2);
            Value.Integer Integer.I32 6
          ]) in
    let* α0 :=
      match_operator
        array_
        [
          fun γ =>
            let* γ0_0 := M.get_slice_index_or_break_match γ 0 in
            let* γ0_1 := M.get_slice_index_or_break_match γ 1 in
            let* γ0_2 := M.get_slice_index_or_break_match γ 2 in
            let* _ :=
              let* α0 := M.read γ0_0 in
              M.is_constant_or_break_match α0 (Value.Integer Integer.I32 0) in
            let* second := M.copy γ0_1 in
            let* third := M.copy γ0_2 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1"
                  [] in
              let* α2 := M.read (mk_str "array[0] = 0, array[1] = ") in
              let* α3 := M.read (mk_str ", array[2] = ") in
              let* α4 := M.read (mk_str "
") in
              let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
              let* α6 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.path "i32" ] in
              let* α7 := M.call_closure α6 [ second ] in
              let* α8 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.path "i32" ] in
              let* α9 := M.call_closure α8 [ third ] in
              let* α10 := M.alloc (Value.Array [ α7; α9 ]) in
              let* α11 :=
                M.call_closure
                  α1
                  [
                    M.pointer_coercion (* Unsize *) α5;
                    M.pointer_coercion (* Unsize *) α10
                  ] in
              let* α12 := M.call_closure α0 [ α11 ] in
              M.alloc α12 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* γ0_0 := M.get_slice_index_or_break_match γ 0 in
            let* γ0_1 := M.get_slice_index_or_break_match γ 1 in
            let* γ0_2 := M.get_slice_index_or_break_match γ 2 in
            let* _ :=
              let* α0 := M.read γ0_0 in
              M.is_constant_or_break_match α0 (Value.Integer Integer.I32 1) in
            let* third := M.copy γ0_2 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1"
                  [] in
              let* α2 := M.read (mk_str "array[0] = 1, array[2] = ") in
              let* α3 := M.read (mk_str " and array[1] was ignored
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.path "i32" ] in
              let* α6 := M.call_closure α5 [ third ] in
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
            M.alloc (Value.Tuple []);
          fun γ =>
            let* γ0_0 := M.get_slice_index_or_break_match γ 0 in
            let* γ0_1 := M.get_slice_index_or_break_match γ 1 in
            let* γ0_rest := M.get_slice_rest_or_break_match γ 2 0 in
            let* _ :=
              let* α0 := M.read γ0_0 in
              M.is_constant_or_break_match
                α0
                (Value.Integer Integer.I32 (-1)) in
            let* second := M.copy γ0_1 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1"
                  [] in
              let* α2 := M.read (mk_str "array[0] = -1, array[1] = ") in
              let* α3 :=
                M.read (mk_str " and all the other ones were ignored
") in
              let* α4 := M.alloc (Value.Array [ α2; α3 ]) in
              let* α5 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.path "i32" ] in
              let* α6 := M.call_closure α5 [ second ] in
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
            M.alloc (Value.Tuple []);
          fun γ =>
            let* γ0_0 := M.get_slice_index_or_break_match γ 0 in
            let* γ0_1 := M.get_slice_index_or_break_match γ 1 in
            let* γ0_rest := M.get_slice_rest_or_break_match γ 2 0 in
            let* _ :=
              let* α0 := M.read γ0_0 in
              M.is_constant_or_break_match α0 (Value.Integer Integer.I32 3) in
            let* second := M.copy γ0_1 in
            let* tail := M.copy γ0_rest in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1"
                  [] in
              let* α2 := M.read (mk_str "array[0] = 3, array[1] = ") in
              let* α3 := M.read (mk_str " and the other elements were ") in
              let* α4 := M.read (mk_str "
") in
              let* α5 := M.alloc (Value.Array [ α2; α3; α4 ]) in
              let* α6 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.path "i32" ] in
              let* α7 := M.call_closure α6 [ second ] in
              let* α8 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_debug"
                  [ Ty.apply (Ty.path "array") [ Ty.path "i32" ] ] in
              let* α9 := M.call_closure α8 [ tail ] in
              let* α10 := M.alloc (Value.Array [ α7; α9 ]) in
              let* α11 :=
                M.call_closure
                  α1
                  [
                    M.pointer_coercion (* Unsize *) α5;
                    M.pointer_coercion (* Unsize *) α10
                  ] in
              let* α12 := M.call_closure α0 [ α11 ] in
              M.alloc α12 in
            M.alloc (Value.Tuple []);
          fun γ =>
            let* γ0_0 := M.get_slice_index_or_break_match γ 0 in
            let* γ0_rest := M.get_slice_rest_or_break_match γ 1 1 in
            let* γ0_rev0 := M.get_slice_rev_index_or_break_match γ 0 in
            let* first := M.copy γ0_0 in
            let* middle := M.copy γ0_rest in
            let* last := M.copy γ0_rev0 in
            let* _ :=
              let* α0 := M.get_function "std::io::stdio::_print" [] in
              let* α1 :=
                M.get_associated_function
                  (Ty.path "core::fmt::Arguments")
                  "new_v1"
                  [] in
              let* α2 := M.read (mk_str "array[0] = ") in
              let* α3 := M.read (mk_str ", middle = ") in
              let* α4 := M.read (mk_str ", array[2] = ") in
              let* α5 := M.read (mk_str "
") in
              let* α6 := M.alloc (Value.Array [ α2; α3; α4; α5 ]) in
              let* α7 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.path "i32" ] in
              let* α8 := M.call_closure α7 [ first ] in
              let* α9 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_debug"
                  [ Ty.apply (Ty.path "array") [ Ty.path "i32" ] ] in
              let* α10 := M.call_closure α9 [ middle ] in
              let* α11 :=
                M.get_associated_function
                  (Ty.path "core::fmt::rt::Argument")
                  "new_display"
                  [ Ty.path "i32" ] in
              let* α12 := M.call_closure α11 [ last ] in
              let* α13 := M.alloc (Value.Array [ α8; α10; α12 ]) in
              let* α14 :=
                M.call_closure
                  α1
                  [
                    M.pointer_coercion (* Unsize *) α6;
                    M.pointer_coercion (* Unsize *) α13
                  ] in
              let* α15 := M.call_closure α0 [ α14 ] in
              M.alloc α15 in
            M.alloc (Value.Tuple [])
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
