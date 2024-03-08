(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum Foo *)

(*
fn main() {
    let a = Foo::Bar;

    // Variable a matches Foo::Bar
    if let Foo::Bar = a {
        // ^-- this causes a compile-time error. Use `if let` instead.
        println!("a is foobar");
    }
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* a := M.alloc if_let_challenge.Foo.Bar in
    let* α0 :=
      match_operator
        a
        [
          fun γ =>
            (let* α0 := M.read γ in
            match α0 with
            | if_let_challenge.Foo.Bar =>
              let* _ :=
                let* _ :=
                  let* α0 := M.var "std::io::stdio::_print" in
                  let* α1 := M.read (mk_str "a is foobar
") in
                  let* α2 := M.alloc [ α1 ] in
                  let* α3 :=
                    M.call
                      (Ty.path "core::fmt::Arguments")::["new_const"]
                      [ M.pointer_coercion "Unsize" α2 ] in
                  let* α4 := M.call α0 [ α3 ] in
                  M.alloc α4 in
                M.alloc tt in
              M.alloc tt
            end);
          fun γ => (M.alloc tt)
        ] in
    M.read α0
  | _, _ => M.impossible
  end.
