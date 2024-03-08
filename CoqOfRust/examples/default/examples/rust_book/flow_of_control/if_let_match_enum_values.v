(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Foo *)

(*
fn main() {
    // Create example variables
    let a = Foo::Bar;
    let b = Foo::Baz;
    let c = Foo::Qux(100);

    // Variable a matches Foo::Bar
    if let Foo::Bar = a {
        println!("a is foobar");
    }

    // Variable b does not match Foo::Bar
    // So this will print nothing
    if let Foo::Bar = b {
        println!("b is foobar");
    }

    // Variable c matches Foo::Qux which has a value
    // Similar to Some() in the previous example
    if let Foo::Qux(value) = c {
        println!("c is {}", value);
    }

    // Binding also works with `if let`
    if let Foo::Qux(value @ 100) = c {
        println!("c is one hundred");
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* a := M.alloc if_let_match_enum_values.Foo.Bar in
    let* b := M.alloc if_let_match_enum_values.Foo.Baz in
    let* c :=
      M.alloc
        (Value.StructTuple
          "if_let_match_enum_values::Foo::Qux"
          [ (Integer.of_Z 100) : Ty.path "u32" ]) in
    let* _ :=
      match_operator
        a
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | if_let_match_enum_values.Foo.Bar =>
              let* _ :=
                let* _ :=
                  let* α0 := M.var "std::io::stdio::_print" in
                  let* α1 := M.read (mk_str "a is foobar
") in
                  let* α2 := M.alloc [ α1 ] in
                  let* α3 :=
                    M.call
                      (Ty.path "core::fmt::Arguments")::["new_const"]
                      [ pointer_coercion "Unsize" α2 ] in
                  let* α4 := M.call α0 [ α3 ] in
                  M.alloc α4 in
                M.alloc tt in
              M.alloc tt
            | _ => M.break_match 
            end);
          fun γ => (M.alloc tt)
        ] in
    let* _ :=
      match_operator
        b
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | if_let_match_enum_values.Foo.Bar =>
              let* _ :=
                let* _ :=
                  let* α0 := M.var "std::io::stdio::_print" in
                  let* α1 := M.read (mk_str "b is foobar
") in
                  let* α2 := M.alloc [ α1 ] in
                  let* α3 :=
                    M.call
                      (Ty.path "core::fmt::Arguments")::["new_const"]
                      [ pointer_coercion "Unsize" α2 ] in
                  let* α4 := M.call α0 [ α3 ] in
                  M.alloc α4 in
                M.alloc tt in
              M.alloc tt
            | _ => M.break_match 
            end);
          fun γ => (M.alloc tt)
        ] in
    let* _ :=
      match_operator
        c
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | if_let_match_enum_values.Foo.Qux _ =>
              let* γ0_0 :=
                let* α0 := M.var "if_let_match_enum_values::Foo::Get_Qux_0" in
                M.pure (α0 γ) in
              let* value := M.copy γ0_0 in
              let* _ :=
                let* _ :=
                  let* α0 := M.var "std::io::stdio::_print" in
                  let* α1 := M.read (mk_str "c is ") in
                  let* α2 := M.read (mk_str "
") in
                  let* α3 := M.alloc [ α1; α2 ] in
                  let* α4 :=
                    M.call
                      (Ty.path "core::fmt::rt::Argument")::["new_display"]
                      [ value ] in
                  let* α5 := M.alloc [ α4 ] in
                  let* α6 :=
                    M.call
                      (Ty.path "core::fmt::Arguments")::["new_v1"]
                      [
                        pointer_coercion "Unsize" α3;
                        pointer_coercion "Unsize" α5
                      ] in
                  let* α7 := M.call α0 [ α6 ] in
                  M.alloc α7 in
                M.alloc tt in
              M.alloc tt
            | _ => M.break_match 
            end);
          fun γ => (M.alloc tt)
        ] in
    let* α0 :=
      match_operator
        c
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | if_let_match_enum_values.Foo.Qux _ =>
              let* γ0_0 :=
                let* α0 := M.var "if_let_match_enum_values::Foo::Get_Qux_0" in
                M.pure (α0 γ) in
              let* value := M.copy γ0_0 in
              let* α0 := M.read γ0_0 in
              match α0 with
              | u32.Make 100 =>
                let* _ :=
                  let* _ :=
                    let* α0 := M.var "std::io::stdio::_print" in
                    let* α1 := M.read (mk_str "c is one hundred
") in
                    let* α2 := M.alloc [ α1 ] in
                    let* α3 :=
                      M.call
                        (Ty.path "core::fmt::Arguments")::["new_const"]
                        [ pointer_coercion "Unsize" α2 ] in
                    let* α4 := M.call α0 [ α3 ] in
                    M.alloc α4 in
                  M.alloc tt in
                M.alloc tt
              | _ => M.break_match 
              end
            | _ => M.break_match 
            end);
          fun γ => (M.alloc tt)
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
