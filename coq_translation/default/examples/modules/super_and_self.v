(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition function `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "called `function()`
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_const"] α4 in
        std.io.stdio._print α5 in
      M.alloc tt in
    M.alloc tt).

Module cool.
  Definition function `{ℋ : State.Trait} : M unit :=
    M.function_body
      (let* _ : ltac:(refine unit) :=
        let* _ : ltac:(refine unit) :=
          let* α0 : ltac:(refine (array (ref str))) :=
            M.alloc [ mk_str "called `cool::function()`
" ] in
          let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
          let* α2 : ltac:(refine (array (ref str))) := deref α1 in
          let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
          let* α4 : ltac:(refine (ref (slice (ref str)))) :=
            pointer_coercion "Unsize" α3 in
          let* α5 : ltac:(refine core.fmt.Arguments) :=
            core.fmt.Arguments::["new_const"] α4 in
          std.io.stdio._print α5 in
        M.alloc tt in
      M.alloc tt).
End cool.

Definition function `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "called `cool::function()`
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_const"] α4 in
        std.io.stdio._print α5 in
      M.alloc tt in
    M.alloc tt).

Module my.
  Definition function `{ℋ : State.Trait} : M unit :=
    M.function_body
      (let* _ : ltac:(refine unit) :=
        let* _ : ltac:(refine unit) :=
          let* α0 : ltac:(refine (array (ref str))) :=
            M.alloc [ mk_str "called `my::function()`
" ] in
          let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
          let* α2 : ltac:(refine (array (ref str))) := deref α1 in
          let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
          let* α4 : ltac:(refine (ref (slice (ref str)))) :=
            pointer_coercion "Unsize" α3 in
          let* α5 : ltac:(refine core.fmt.Arguments) :=
            core.fmt.Arguments::["new_const"] α4 in
          std.io.stdio._print α5 in
        M.alloc tt in
      M.alloc tt).
  
  Module cool.
    Definition function `{ℋ : State.Trait} : M unit :=
      M.function_body
        (let* _ : ltac:(refine unit) :=
          let* _ : ltac:(refine unit) :=
            let* α0 : ltac:(refine (array (ref str))) :=
              M.alloc [ mk_str "called `my::cool::function()`
" ] in
            let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
            let* α2 : ltac:(refine (array (ref str))) := deref α1 in
            let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
            let* α4 : ltac:(refine (ref (slice (ref str)))) :=
              pointer_coercion "Unsize" α3 in
            let* α5 : ltac:(refine core.fmt.Arguments) :=
              core.fmt.Arguments::["new_const"] α4 in
            std.io.stdio._print α5 in
          M.alloc tt in
        M.alloc tt).
  End cool.
  
  Definition indirect_call `{ℋ : State.Trait} : M unit :=
    M.function_body
      (let* _ : ltac:(refine unit) :=
        let* _ : ltac:(refine unit) :=
          let* α0 : ltac:(refine (array (ref str))) :=
            M.alloc [ mk_str "called `my::indirect_call()`, that
> " ] in
          let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
          let* α2 : ltac:(refine (array (ref str))) := deref α1 in
          let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
          let* α4 : ltac:(refine (ref (slice (ref str)))) :=
            pointer_coercion "Unsize" α3 in
          let* α5 : ltac:(refine core.fmt.Arguments) :=
            core.fmt.Arguments::["new_const"] α4 in
          std.io.stdio._print α5 in
        M.alloc tt in
      let* _ : ltac:(refine unit) := super_and_self.my.function in
      let* _ : ltac:(refine unit) := super_and_self.my.function in
      let* _ : ltac:(refine unit) := super_and_self.my.cool.function in
      let* _ : ltac:(refine unit) := super_and_self.function in
      let* _ : ltac:(refine unit) := super_and_self.cool.function in
      M.alloc tt).
End my.

Definition function `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "called `my::function()`
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_const"] α4 in
        std.io.stdio._print α5 in
      M.alloc tt in
    M.alloc tt).

Module Wrap_cool_1.
Module cool.
  Definition function `{ℋ : State.Trait} : M unit :=
    M.function_body
      (let* _ : ltac:(refine unit) :=
        let* _ : ltac:(refine unit) :=
          let* α0 : ltac:(refine (array (ref str))) :=
            M.alloc [ mk_str "called `my::cool::function()`
" ] in
          let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
          let* α2 : ltac:(refine (array (ref str))) := deref α1 in
          let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
          let* α4 : ltac:(refine (ref (slice (ref str)))) :=
            pointer_coercion "Unsize" α3 in
          let* α5 : ltac:(refine core.fmt.Arguments) :=
            core.fmt.Arguments::["new_const"] α4 in
          std.io.stdio._print α5 in
        M.alloc tt in
      M.alloc tt).
End cool.
End Wrap_cool_1.
Import Wrap_cool_1.

Definition function `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "called `my::cool::function()`
" ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_const"] α4 in
        std.io.stdio._print α5 in
      M.alloc tt in
    M.alloc tt).

Definition indirect_call `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* _ : ltac:(refine unit) :=
      let* _ : ltac:(refine unit) :=
        let* α0 : ltac:(refine (array (ref str))) :=
          M.alloc [ mk_str "called `my::indirect_call()`, that
> " ] in
        let* α1 : ltac:(refine (ref (array (ref str)))) := borrow α0 in
        let* α2 : ltac:(refine (array (ref str))) := deref α1 in
        let* α3 : ltac:(refine (ref (array (ref str)))) := borrow α2 in
        let* α4 : ltac:(refine (ref (slice (ref str)))) :=
          pointer_coercion "Unsize" α3 in
        let* α5 : ltac:(refine core.fmt.Arguments) :=
          core.fmt.Arguments::["new_const"] α4 in
        std.io.stdio._print α5 in
      M.alloc tt in
    let* _ : ltac:(refine unit) := super_and_self.my.function in
    let* _ : ltac:(refine unit) := super_and_self.my.function in
    let* _ : ltac:(refine unit) := super_and_self.my.cool.function in
    let* _ : ltac:(refine unit) := super_and_self.function in
    let* _ : ltac:(refine unit) := super_and_self.cool.function in
    M.alloc tt).

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{ℋ : State.Trait} : M unit :=
  M.function_body
    (let* _ : ltac:(refine unit) := super_and_self.my.indirect_call in
    M.alloc tt).
