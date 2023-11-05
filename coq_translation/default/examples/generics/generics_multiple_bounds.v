(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition compare_prints
    `{ℋ : State.Trait}
    {T : Set}
    {ℋ_0 : core.fmt.Debug.Trait T}
    {ℋ_1 : core.fmt.Display.Trait T}
    (t : ref T)
    : M unit :=
  M.function_body
    (let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "Debug: `"; mk_str "`
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (ref (ref T))) := borrow t in
        let* α6 : ltac:(refine (ref T)) := deref α5 in
        let* α7 : ltac:(refine (ref (ref T))) := borrow α6 in
        let* α8 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α7 in
        let* α9 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α8 ] in
        let* α10 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α9 in
        let* α11 : ltac:(refine (array core.fmt.rt.Argument)) := deref α10 in
        let* α12 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α11 in
        let* α13 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α12 in
        let* α14 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α13 in
        std.io.stdio._print α14 in
      M.alloc tt in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "Display: `"; mk_str "`
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (ref (ref T))) := borrow t in
        let* α6 : ltac:(refine (ref T)) := deref α5 in
        let* α7 : ltac:(refine (ref (ref T))) := borrow α6 in
        let* α8 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_display"] α7 in
        let* α9 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α8 ] in
        let* α10 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α9 in
        let* α11 : ltac:(refine (array core.fmt.rt.Argument)) := deref α10 in
        let* α12 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α11 in
        let* α13 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α12 in
        let* α14 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α13 in
        std.io.stdio._print α14 in
      M.alloc tt in
    M.alloc tt).

Definition compare_types
    `{ℋ : State.Trait}
    {T U : Set}
    {ℋ_0 : core.fmt.Debug.Trait T}
    {ℋ_1 : core.fmt.Debug.Trait U}
    (t : ref T)
    (u : ref U)
    : M unit :=
  M.function_body
    (let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "t: `"; mk_str "`
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (ref (ref T))) := borrow t in
        let* α6 : ltac:(refine (ref T)) := deref α5 in
        let* α7 : ltac:(refine (ref (ref T))) := borrow α6 in
        let* α8 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α7 in
        let* α9 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α8 ] in
        let* α10 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α9 in
        let* α11 : ltac:(refine (array core.fmt.rt.Argument)) := deref α10 in
        let* α12 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α11 in
        let* α13 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α12 in
        let* α14 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α13 in
        std.io.stdio._print α14 in
      M.alloc tt in
    let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "u: `"; mk_str "`
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine (ref (ref U))) := borrow u in
        let* α6 : ltac:(refine (ref U)) := deref α5 in
        let* α7 : ltac:(refine (ref (ref U))) := borrow α6 in
        let* α8 : ltac:(refine core.fmt.rt.Argument) :=
          core.fmt.rt.Argument::["new_debug"] α7 in
        let* α9 : ltac:(refine (array core.fmt.rt.Argument)) :=
          M.alloc [ α8 ] in
        let* α10 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α9 in
        let* α11 : ltac:(refine (array core.fmt.rt.Argument)) := deref α10 in
        let* α12 : ltac:(refine (ref (array core.fmt.rt.Argument))) :=
          borrow α11 in
        let* α13 : ltac:(refine (ref (slice core.fmt.rt.Argument))) :=
          pointer_coercion "Unsize" α12 in
        let* α14 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_v1"] α4 α13 in
        std.io.stdio._print α14 in
      M.alloc tt in
    M.alloc tt).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let string := mk_str "words" in
    let* array : ltac:(refine (array i32)) :=
      let* α0 : ltac:(refine i32) := M.alloc 1 in
      let* α1 : ltac:(refine i32) := M.alloc 2 in
      let* α2 : ltac:(refine i32) := M.alloc 3 in
      M.alloc [ α0; α1; α2 ] in
    let* vec : ltac:(refine (alloc.vec.Vec i32 alloc.alloc.Global)) :=
      let* α0 : ltac:(refine i32) := M.alloc 1 in
      let* α1 : ltac:(refine i32) := M.alloc 2 in
      let* α2 : ltac:(refine i32) := M.alloc 3 in
      let* α3 : ltac:(refine (array i32)) := M.alloc [ α0; α1; α2 ] in
      let*
          α4 :
          ltac:(refine (alloc.boxed.Box (array i32) alloc.alloc.Global)) :=
        (alloc.boxed.Box _ alloc.boxed.Box.Default.A)::["new"] α3 in
      let*
          α5 :
          ltac:(refine (alloc.boxed.Box (slice i32) alloc.alloc.Global)) :=
        pointer_coercion "Unsize" α4 in
      (slice i32)::["into_vec"] α5 in
    let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine (ref (ref str))) := borrow string in
      let* α1 : ltac:(refine (ref str)) := deref α0 in
      let* α2 : ltac:(refine (ref (ref str))) := borrow α1 in
      generics_multiple_bounds.compare_prints α2 in
    let* _ : ltac:(refine unit) :=
      let* α0 : ltac:(refine (ref (array i32))) := borrow array in
      let* α1 : ltac:(refine (array i32)) := deref α0 in
      let* α2 : ltac:(refine (ref (array i32))) := borrow α1 in
      let* α3 : ltac:(refine (ref (alloc.vec.Vec i32 alloc.alloc.Global))) :=
        borrow vec in
      let* α4 : ltac:(refine (alloc.vec.Vec i32 alloc.alloc.Global)) :=
        deref α3 in
      let* α5 : ltac:(refine (ref (alloc.vec.Vec i32 alloc.alloc.Global))) :=
        borrow α4 in
      generics_multiple_bounds.compare_types α2 α5 in
    M.alloc tt).
