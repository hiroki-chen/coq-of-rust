(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn function() {
    println!("called `function()`");
}
*)
Definition function (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* _ :=
        let* α0 := M.var "std::io::stdio::_print" in
        let* α1 := M.read (mk_str "called `function()`
") in
        let* α2 := M.alloc [ α1 ] in
        let* α3 :=
          M.call
            (Ty.path "core::fmt::Arguments")::["new_const"]
            [ pointer_coercion "Unsize" (borrow α2) ] in
        let* α4 := M.call α0 [ α3 ] in
        M.alloc α4 in
      M.alloc tt in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.

Module cool.
  (*
      pub fn function() {
          println!("called `cool::function()`");
      }
  *)
  Definition function (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* _ :=
        let* _ :=
          let* α0 := M.var "std::io::stdio::_print" in
          let* α1 := M.read (mk_str "called `cool::function()`
") in
          let* α2 := M.alloc [ α1 ] in
          let* α3 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_const"]
              [ pointer_coercion "Unsize" (borrow α2) ] in
          let* α4 := M.call α0 [ α3 ] in
          M.alloc α4 in
        M.alloc tt in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
End cool.

Module my.
  (*
      fn function() {
          println!("called `my::function()`");
      }
  *)
  Definition function (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* _ :=
        let* _ :=
          let* α0 := M.var "std::io::stdio::_print" in
          let* α1 := M.read (mk_str "called `my::function()`
") in
          let* α2 := M.alloc [ α1 ] in
          let* α3 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_const"]
              [ pointer_coercion "Unsize" (borrow α2) ] in
          let* α4 := M.call α0 [ α3 ] in
          M.alloc α4 in
        M.alloc tt in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
  
  Module cool.
    (*
            pub fn function() {
                println!("called `my::cool::function()`");
            }
    *)
    Definition function (𝜏 : list Ty.t) (α : list Value.t) : M :=
      match 𝜏, α with
      | [], [] =>
        let* _ :=
          let* _ :=
            let* α0 := M.var "std::io::stdio::_print" in
            let* α1 := M.read (mk_str "called `my::cool::function()`
") in
            let* α2 := M.alloc [ α1 ] in
            let* α3 :=
              M.call
                (Ty.path "core::fmt::Arguments")::["new_const"]
                [ pointer_coercion "Unsize" (borrow α2) ] in
            let* α4 := M.call α0 [ α3 ] in
            M.alloc α4 in
          M.alloc tt in
        let* α0 := M.alloc tt in
        M.read α0
      | _, _ => M.impossible
      end.
  End cool.
  
  (*
      pub fn indirect_call() {
          // Let's access all the functions named `function` from this scope!
          print!("called `my::indirect_call()`, that\n> ");
  
          // The `self` keyword refers to the current module scope - in this case `my`.
          // Calling `self::function()` and calling `function()` directly both give
          // the same result, because they refer to the same function.
          self::function();
          function();
  
          // We can also use `self` to access another module inside `my`:
          self::cool::function();
  
          // The `super` keyword refers to the parent scope (outside the `my` module).
          super::function();
  
          // This will bind to the `cool::function` in the *crate* scope.
          // In this case the crate scope is the outermost scope.
          {
              use crate::cool::function as root_function;
              root_function();
          }
      }
  *)
  Definition indirect_call (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [] =>
      let* _ :=
        let* _ :=
          let* α0 := M.var "std::io::stdio::_print" in
          let* α1 := M.read (mk_str "called `my::indirect_call()`, that
> ") in
          let* α2 := M.alloc [ α1 ] in
          let* α3 :=
            M.call
              (Ty.path "core::fmt::Arguments")::["new_const"]
              [ pointer_coercion "Unsize" (borrow α2) ] in
          let* α4 := M.call α0 [ α3 ] in
          M.alloc α4 in
        M.alloc tt in
      let* _ :=
        let* α0 := M.var "super_and_self::my::function" in
        let* α1 := M.call α0 [] in
        M.alloc α1 in
      let* _ :=
        let* α0 := M.var "super_and_self::my::function" in
        let* α1 := M.call α0 [] in
        M.alloc α1 in
      let* _ :=
        let* α0 := M.var "super_and_self::my::cool::function" in
        let* α1 := M.call α0 [] in
        M.alloc α1 in
      let* _ :=
        let* α0 := M.var "super_and_self::function" in
        let* α1 := M.call α0 [] in
        M.alloc α1 in
      let* _ :=
        let* α0 := M.var "super_and_self::cool::function" in
        let* α1 := M.call α0 [] in
        M.alloc α1 in
      let* α0 := M.alloc tt in
      M.read α0
    | _, _ => M.impossible
    end.
End my.

(*
fn main() {
    my::indirect_call();
}
*)
(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (𝜏 : list Ty.t) (α : list Value.t) : M :=
  match 𝜏, α with
  | [], [] =>
    let* _ :=
      let* α0 := M.var "super_and_self::my::indirect_call" in
      let* α1 := M.call α0 [] in
      M.alloc α1 in
    let* α0 := M.alloc tt in
    M.read α0
  | _, _ => M.impossible
  end.
