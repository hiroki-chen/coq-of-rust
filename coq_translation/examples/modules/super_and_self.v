(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition function `{State.Trait} (_ : unit) : M unit :=
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"] (addr_of [ "called `function()`
" ]) in
      std.io.stdio._print α0 in
    Pure tt in
  Pure tt.

Module cool.
  Definition function `{State.Trait} (_ : unit) : M unit :=
    let* _ :=
      let* _ :=
        let* α0 :=
          format_arguments::["new_const"]
            (addr_of [ "called `cool::function()`
" ]) in
        std.io.stdio._print α0 in
      Pure tt in
    Pure tt.
End cool.

Definition function `{State.Trait} (_ : unit) : M unit :=
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"]
          (addr_of [ "called `cool::function()`
" ]) in
      std.io.stdio._print α0 in
    Pure tt in
  Pure tt.

Module my.
  Definition function `{State.Trait} (_ : unit) : M unit :=
    let* _ :=
      let* _ :=
        let* α0 :=
          format_arguments::["new_const"]
            (addr_of [ "called `my::function()`
" ]) in
        std.io.stdio._print α0 in
      Pure tt in
    Pure tt.
  
  Module cool.
    Definition function `{State.Trait} (_ : unit) : M unit :=
      let* _ :=
        let* _ :=
          let* α0 :=
            format_arguments::["new_const"]
              (addr_of [ "called `my::cool::function()`
" ]) in
          std.io.stdio._print α0 in
        Pure tt in
      Pure tt.
  End cool.
  
  Definition indirect_call `{State.Trait} (_ : unit) : M unit :=
    let* _ :=
      let* _ :=
        let* α0 :=
          format_arguments::["new_const"]
            (addr_of [ "called `my::indirect_call()`, that
> " ]) in
        std.io.stdio._print α0 in
      Pure tt in
    let* _ := super_and_self.my.function tt in
    let* _ := super_and_self.my.function tt in
    let* _ := super_and_self.my.cool.function tt in
    let* _ := super_and_self.function tt in
    let* _ := super_and_self.cool.function tt in
    Pure tt.
End my.

Definition function `{State.Trait} (_ : unit) : M unit :=
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"]
          (addr_of [ "called `my::function()`
" ]) in
      std.io.stdio._print α0 in
    Pure tt in
  Pure tt.

Module cool.
  Definition function `{State.Trait} (_ : unit) : M unit :=
    let* _ :=
      let* _ :=
        let* α0 :=
          format_arguments::["new_const"]
            (addr_of [ "called `my::cool::function()`
" ]) in
        std.io.stdio._print α0 in
      Pure tt in
    Pure tt.
End cool.

Definition function `{State.Trait} (_ : unit) : M unit :=
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"]
          (addr_of [ "called `my::cool::function()`
" ]) in
      std.io.stdio._print α0 in
    Pure tt in
  Pure tt.

Definition indirect_call `{State.Trait} (_ : unit) : M unit :=
  let* _ :=
    let* _ :=
      let* α0 :=
        format_arguments::["new_const"]
          (addr_of [ "called `my::indirect_call()`, that
> " ]) in
      std.io.stdio._print α0 in
    Pure tt in
  let* _ := super_and_self.my.function tt in
  let* _ := super_and_self.my.function tt in
  let* _ := super_and_self.my.cool.function tt in
  let* _ := super_and_self.function tt in
  let* _ := super_and_self.cool.function tt in
  Pure tt.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{State.Trait} (_ : unit) : M unit :=
  let* _ := super_and_self.my.indirect_call tt in
  Pure tt.
