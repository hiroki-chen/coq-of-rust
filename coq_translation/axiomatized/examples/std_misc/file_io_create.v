(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Definition LOREM_IPSUM : ref str :=
  run
    (Pure
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
").

(* #[allow(dead_code)] - function was ignored by the compiler *)
Parameter main : unit -> M unit.
