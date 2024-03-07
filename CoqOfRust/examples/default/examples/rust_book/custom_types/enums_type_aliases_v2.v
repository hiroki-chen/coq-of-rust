(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* Enum VeryVerboseEnumOfThingsToDoWithNumbers *)

Module Impl_enums_type_aliases_v2_VeryVerboseEnumOfThingsToDoWithNumbers.
  Definition Self : Ty.t :=
    Ty.path "enums_type_aliases_v2::VeryVerboseEnumOfThingsToDoWithNumbers".
  
  (*
      fn run(&self, x: i32, y: i32) -> i32 {
          match self {
              Self::Add => x + y,
              Self::Subtract => x - y,
          }
      }
  *)
  Definition run (𝜏 : list Ty.t) (α : list Value.t) : M :=
    match 𝜏, α with
    | [], [ self; x; y ] =>
      let* self := M.alloc self in
      let* x := M.alloc x in
      let* y := M.alloc y in
      let* α0 :=
        match_operator
          self
          [
            fun γ =>
              (let* γ :=
                let* α0 := M.read γ in
                M.pure (deref α0) in
              let* α0 := M.read γ in
              match α0 with
              |
                  enums_type_aliases_v2.VeryVerboseEnumOfThingsToDoWithNumbers.Add
                  =>
                let* α0 := M.var "BinOp::Panic::add" in
                let* α1 := M.read x in
                let* α2 := M.read y in
                let* α3 := α0 α1 α2 in
                M.alloc α3
              | _ => M.break_match 
              end) :
              Ty.path "i32";
            fun γ =>
              (let* γ :=
                let* α0 := M.read γ in
                M.pure (deref α0) in
              let* α0 := M.read γ in
              match α0 with
              |
                  enums_type_aliases_v2.VeryVerboseEnumOfThingsToDoWithNumbers.Subtract
                  =>
                let* α0 := M.var "BinOp::Panic::sub" in
                let* α1 := M.read x in
                let* α2 := M.read y in
                let* α3 := α0 α1 α2 in
                M.alloc α3
              | _ => M.break_match 
              end) :
              Ty.path "i32"
          ] in
      M.read α0
    | _, _ => M.impossible
    end.
End Impl_enums_type_aliases_v2_VeryVerboseEnumOfThingsToDoWithNumbers.
