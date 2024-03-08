(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn is_divisible_by(lhs: u32, rhs: u32) -> bool {
    // Corner case, early return
    if rhs == 0 {
        return false;
    }

    // This is an expression, the `return` keyword is not necessary here
    lhs % rhs == 0
}
*)
Definition is_divisible_by (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ lhs; rhs ] =>
    let* lhs := M.alloc lhs in
    let* rhs := M.alloc rhs in
    let return_ := M.return_ (R := Ty.path "bool") in
    M.catch_return
      (let* _ :=
        let* α0 := M.read rhs in
        let* α1 := M.alloc (BinOp.Pure.eq α0 (Value.Integer Integer.U32 0)) in
        let* α2 := M.read (M.use α1) in
        if α2 then
          let* α0 := return_ false in
          let* α1 := M.read α0 in
          let* α2 := M.never_to_any α1 in
          M.alloc α2
        else
          M.alloc tt in
      let* α0 := M.read lhs in
      let* α1 := M.read rhs in
      let* α2 := BinOp.Panic.rem α0 α1 in
      let* α0 := M.alloc (BinOp.Pure.eq α2 (Value.Integer Integer.U32 0)) in
      M.read α0)
  | _, _ => M.impossible
  end.

(*
fn fizzbuzz(n: u32) -> () {
    if is_divisible_by(n, 15) {
        println!("fizzbuzz");
    } else if is_divisible_by(n, 3) {
        println!("fizz");
    } else if is_divisible_by(n, 5) {
        println!("buzz");
    } else {
        println!("{}", n);
    }
}
*)
Definition fizzbuzz (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ n ] =>
    let* n := M.alloc n in
    let* α0 := M.var "functions::is_divisible_by" in
    let* α1 := M.read n in
    let* α2 := M.call α0 [ α1; Value.Integer Integer.U32 15 ] in
    let* α3 := M.alloc α2 in
    let* α4 := M.read (M.use α3) in
    let* α5 :=
      if α4 then
        let* _ :=
          let* _ :=
            let* α0 := M.var "std::io::stdio::_print" in
            let* α1 := M.read (mk_str "fizzbuzz
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
      else
        let* α0 := M.var "functions::is_divisible_by" in
        let* α1 := M.read n in
        let* α2 := M.call α0 [ α1; Value.Integer Integer.U32 3 ] in
        let* α3 := M.alloc α2 in
        let* α4 := M.read (M.use α3) in
        if α4 then
          let* _ :=
            let* _ :=
              let* α0 := M.var "std::io::stdio::_print" in
              let* α1 := M.read (mk_str "fizz
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
        else
          let* α0 := M.var "functions::is_divisible_by" in
          let* α1 := M.read n in
          let* α2 := M.call α0 [ α1; Value.Integer Integer.U32 5 ] in
          let* α3 := M.alloc α2 in
          let* α4 := M.read (M.use α3) in
          if α4 then
            let* _ :=
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "buzz
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
          else
            let* _ :=
              let* _ :=
                let* α0 := M.var "std::io::stdio::_print" in
                let* α1 := M.read (mk_str "") in
                let* α2 := M.read (mk_str "
") in
                let* α3 := M.alloc [ α1; α2 ] in
                let* α4 :=
                  M.call
                    (Ty.path "core::fmt::rt::Argument")::["new_display"]
                    [ n ] in
                let* α5 := M.alloc [ α4 ] in
                let* α6 :=
                  M.call
                    (Ty.path "core::fmt::Arguments")::["new_v1"]
                    [
                      M.pointer_coercion "Unsize" α3;
                      M.pointer_coercion "Unsize" α5
                    ] in
                let* α7 := M.call α0 [ α6 ] in
                M.alloc α7 in
              M.alloc tt in
            M.alloc tt in
    M.read α5
  | _, _ => M.impossible
  end.

(*
fn fizzbuzz_to(n: u32) {
    for n in 1..=n {
        fizzbuzz(n);
    }
}
*)
Definition fizzbuzz_to (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [ n ] =>
    let* n := M.alloc n in
    let* α0 :=
      M.get_trait_method
        "core::iter::traits::collect::IntoIterator"
        "into_iter"
        [
          (* Self *)
            Ty.apply
              (Ty.path "core::ops::range::RangeInclusive")
              [ Ty.path "u32" ]
        ] in
    let* α1 := M.read n in
    let* α2 :=
      M.call
        (Ty.apply
            (Ty.path "core::ops::range::RangeInclusive")
            [ Ty.path "u32" ])::["new"]
        [ Value.Integer Integer.U32 1; α1 ] in
    let* α3 := M.call α0 [ α2 ] in
    let* α4 := M.alloc α3 in
    let* α5 :=
      match_operator
        α4
        [
          fun γ =>
            (let* iter := M.copy γ in
            M.loop
              (let* _ :=
                let* α0 :=
                  M.get_trait_method
                    "core::iter::traits::iterator::Iterator"
                    "next"
                    [
                      (* Self *)
                        Ty.apply
                          (Ty.path "core::ops::range::RangeInclusive")
                          [ Ty.path "u32" ]
                    ] in
                let* α1 := M.call α0 [ iter ] in
                let* α2 := M.alloc α1 in
                match_operator
                  α2
                  [
                    fun γ =>
                      (let* α0 := M.read γ in
                      match α0 with
                      | core.option.Option.None =>
                        let* α0 := M.break in
                        let* α1 := M.read α0 in
                        let* α2 := M.never_to_any α1 in
                        M.alloc α2
                      | _ => M.break_match 
                      end);
                    fun γ =>
                      (let* α0 := M.read γ in
                      match α0 with
                      | core.option.Option.Some _ =>
                        let* γ0_0 :=
                          let* α0 := M.var "core::option::Option::Get_Some_0" in
                          M.pure (α0 γ) in
                        let* n := M.copy γ0_0 in
                        let* _ :=
                          let* α0 := M.var "functions::fizzbuzz" in
                          let* α1 := M.read n in
                          let* α2 := M.call α0 [ α1 ] in
                          M.alloc α2 in
                        M.alloc tt
                      | _ => M.break_match 
                      end)
                  ] in
              M.alloc tt))
        ] in
    M.read (M.use α5)
  | _, _ => M.impossible
  end.

(*
fn main() {
    // We can use this function here, and define it somewhere later
    fizzbuzz_to(100);
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* α0 := M.var "functions::fizzbuzz_to" in
      let* α1 := M.call α0 [ Value.Integer Integer.U32 100 ] in
      M.alloc α1 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
