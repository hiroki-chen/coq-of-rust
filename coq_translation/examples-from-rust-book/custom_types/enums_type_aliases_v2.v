(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module VeryVerboseEnumOfThingsToDoWithNumbers.
  Inductive t : Set :=
  | Add
  | Subtract.
End VeryVerboseEnumOfThingsToDoWithNumbers.
Definition
  VeryVerboseEnumOfThingsToDoWithNumbers
  :=
  VeryVerboseEnumOfThingsToDoWithNumbers.t.

Module ImplVeryVerboseEnumOfThingsToDoWithNumbers.
  Definition Self := VeryVerboseEnumOfThingsToDoWithNumbers.
  
  Definition run (self : ref Self) (x : i32) (y : i32) : i32 :=
    match self with
    | ImplSelf.Add => add x y
    | ImplSelf.Subtract => sub x y
    end.
  
  Global Instance Method_run : Notation.Dot "run" := {|
    Notation.dot := run;
  |}.
End ImplVeryVerboseEnumOfThingsToDoWithNumbers.
