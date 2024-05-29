(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(*
fn main() {
    use std::arch::asm;

    extern "C" fn foo(arg: i32) -> i32 {
        println!("arg = {}", arg);
        arg * 2
    }

    fn call_foo(arg: i32) -> i32 {
        unsafe {
            let result;
            asm!(
                "call {}",
                // Function pointer to call
                in(reg) foo,
                // 1st argument in rdi
                in("rdi") arg,
                // Return value in rax
                out("rax") result,
                // Mark all registers which are not preserved by the "C" calling
                // convention as clobbered.
                clobber_abi("C"),
            );
            result
        }
    }
}
*)
Definition main (τ : list Ty.t) (α : list Value.t) : M :=
  match τ, α with | [], [] => ltac:(M.monadic (Value.Tuple [])) | _, _ => M.impossible end.

Axiom Function_main : M.IsFunction "inline_assembly_symbol_operands_and_abi_clobbers::main" main.

Module main.
  (*
      extern "C" fn foo(arg: i32) -> i32 {
          println!("arg = {}", arg);
          arg * 2
      }
  *)
  Definition foo (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ arg ] =>
      ltac:(M.monadic
        (let arg := M.alloc (| arg |) in
        M.read (|
          let~ _ :=
            let~ _ :=
              M.alloc (|
                M.call_closure (|
                  M.get_function (| "std::io::stdio::_print", [] |),
                  [
                    M.call_closure (|
                      M.get_associated_function (| Ty.path "core::fmt::Arguments", "new_v1", [] |),
                      [
                        (* Unsize *)
                        M.pointer_coercion
                          (M.alloc (|
                            Value.Array
                              [ M.read (| Value.String "arg = " |); M.read (| Value.String "
" |) ]
                          |));
                        (* Unsize *)
                        M.pointer_coercion
                          (M.alloc (|
                            Value.Array
                              [
                                M.call_closure (|
                                  M.get_associated_function (|
                                    Ty.path "core::fmt::rt::Argument",
                                    "new_display",
                                    [ Ty.path "i32" ]
                                  |),
                                  [ arg ]
                                |)
                              ]
                          |))
                      ]
                    |)
                  ]
                |)
              |) in
            M.alloc (| Value.Tuple [] |) in
          M.alloc (| BinOp.Wrap.mul Integer.I32 (M.read (| arg |)) (Value.Integer 2) |)
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Function_foo :
    M.IsFunction "inline_assembly_symbol_operands_and_abi_clobbers::main::foo" foo.
  
  (*
      fn call_foo(arg: i32) -> i32 {
          unsafe {
              let result;
              asm!(
                  "call {}",
                  // Function pointer to call
                  in(reg) foo,
                  // 1st argument in rdi
                  in("rdi") arg,
                  // Return value in rax
                  out("rax") result,
                  // Mark all registers which are not preserved by the "C" calling
                  // convention as clobbered.
                  clobber_abi("C"),
              );
              result
          }
      }
  *)
  Definition call_foo (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [], [ arg ] =>
      ltac:(M.monadic
        (let arg := M.alloc (| arg |) in
        M.read (|
          let~ result := M.copy (| Value.DeclaredButUndefined |) in
          let~ _ := InlineAssembly in
          result
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Function_call_foo :
    M.IsFunction "inline_assembly_symbol_operands_and_abi_clobbers::main::call_foo" call_foo.
End main.
