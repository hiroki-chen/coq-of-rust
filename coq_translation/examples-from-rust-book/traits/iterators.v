(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module Fibonacci.
  Record t : Set := {
    curr : u32;
    next : u32;
  }.
  
  Global Instance Get_curr : Notation.Dot "curr" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_next : Notation.Dot "next" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End Fibonacci.
Definition Fibonacci : Set := Fibonacci.t.

Module Impl_Iterator_for_Fibonacci.
  Definition Self := Fibonacci.
  
  Definition Item : Set := u32.
  
  Definition next (self : mut_ref Self) : Option ImplSelf.Item :=
    let current := self.["curr"] in
    assign self.["curr"] self.["next"] ;;
    assign self.["next"] (current.["add"] self.["next"]) ;;
    Some current.
  
  Global Instance Method_next : Notation.Dot "next" := {
    Notation.dot := next;
  }.
  
  Global Instance I : Iterator.Trait Self := {
    Iterator.next := next;
  }.
End Impl_Iterator_for_Fibonacci.

Definition fibonacci (_ : unit) : Fibonacci :=
  {| Fibonacci.curr := 0; Fibonacci.next := 1; |}.

Definition main (_ : unit) : unit :=
  let sequence := {| Range.start := 0; Range.end := 3; |} in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Four consecutive `next` calls on 0..3
" ]
      [  ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "> "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] sequence.["next"] ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "> "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] sequence.["next"] ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "> "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] sequence.["next"] ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "> "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] sequence.["next"] ]) ;;
  tt ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Iterate through 0..3 using `for`
" ]
      [  ]) ;;
  tt ;;
  match LangItem {| Range.start := 0; Range.end := 3; |} with
  | iter =>
    loop
      match LangItem iter with
      | None => Break
      | Some {| Some.0 := i; |} =>
        _crate.io._print
          (_crate.fmt.Arguments::["new_v1"]
            [ "> "; "
" ]
            [ _crate.fmt.ArgumentV1::["new_display"] i ]) ;;
        tt ;;
        tt
      end ;;
      tt
      from
      for
  end ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "The first four terms of the Fibonacci sequence are: 
" ]
      [  ]) ;;
  tt ;;
  match LangItem ((fibonacci tt).["take"] 4) with
  | iter =>
    loop
      match LangItem iter with
      | None => Break
      | Some {| Some.0 := i; |} =>
        _crate.io._print
          (_crate.fmt.Arguments::["new_v1"]
            [ "> "; "
" ]
            [ _crate.fmt.ArgumentV1::["new_display"] i ]) ;;
        tt ;;
        tt
      end ;;
      tt
      from
      for
  end ;;
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "The next four terms of the Fibonacci sequence are: 
" ]
      [  ]) ;;
  tt ;;
  match LangItem (((fibonacci tt).["skip"] 4).["take"] 4) with
  | iter =>
    loop
      match LangItem iter with
      | None => Break
      | Some {| Some.0 := i; |} =>
        _crate.io._print
          (_crate.fmt.Arguments::["new_v1"]
            [ "> "; "
" ]
            [ _crate.fmt.ArgumentV1::["new_display"] i ]) ;;
        tt ;;
        tt
      end ;;
      tt
      from
      for
  end ;;
  let array := [ 1; 3; 3; 7 ] in
  _crate.io._print
    (_crate.fmt.Arguments::["new_v1"]
      [ "Iterate the following array "; "
" ]
      [ _crate.fmt.ArgumentV1::["new_debug"] array ]) ;;
  tt ;;
  match LangItem array.["iter"] with
  | iter =>
    loop
      match LangItem iter with
      | None => Break
      | Some {| Some.0 := i; |} =>
        _crate.io._print
          (_crate.fmt.Arguments::["new_v1"]
            [ "> "; "
" ]
            [ _crate.fmt.ArgumentV1::["new_display"] i ]) ;;
        tt ;;
        tt
      end ;;
      tt
      from
      for
  end.
