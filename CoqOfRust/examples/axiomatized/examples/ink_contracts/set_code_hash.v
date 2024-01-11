(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Error.
  Inductive t : Set :=
  .
End Error.

(*
fn set_code_hash<E>(code_hash: &E) -> Result<(), Error> {
    unimplemented!()
}
*)
Parameter set_code_hash :
    forall {E : Set},
    (ref E) -> M (core.result.Result.t unit set_code_hash.Error.t).

Module  Incrementer.
Section Incrementer.
  Record t : Set := {
    count : u32.t;
  }.
  
  Global Instance Get_count : Notations.Dot "count" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(count)) (fun β α => Some (α <| count := β |>));
  }.
  Global Instance Get_AF_count : Notations.DoubleColon t "count" := {
    Notations.double_colon (α : M.Val t) := α.["count"];
  }.
End Incrementer.
End Incrementer.

Module  Impl_core_default_Default_for_set_code_hash_Incrementer_t.
Section Impl_core_default_Default_for_set_code_hash_Incrementer_t.
  Definition Self : Set := set_code_hash.Incrementer.t.
  
  (*
  Default
  *)
  Parameter default : M set_code_hash.Incrementer.t.
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_set_code_hash_Incrementer_t.
End Impl_core_default_Default_for_set_code_hash_Incrementer_t.

Module  Impl_set_code_hash_Incrementer_t.
Section Impl_set_code_hash_Incrementer_t.
  Definition Self : Set := set_code_hash.Incrementer.t.
  
  (*
      pub fn new() -> Self {
          Default::default()
      }
  *)
  Parameter new : M Self.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn inc(&mut self) {
          self.count += 1;
          println!(
              "The new count is {}, it was modified using the original contract code.",
              self.count
          );
      }
  *)
  Parameter inc : (mut_ref Self) -> M unit.
  
  Global Instance AssociatedFunction_inc : Notations.DoubleColon Self "inc" := {
    Notations.double_colon := inc;
  }.
  
  (*
      pub fn get(&self) -> u32 {
          self.count
      }
  *)
  Parameter get : (ref Self) -> M u32.t.
  
  Global Instance AssociatedFunction_get : Notations.DoubleColon Self "get" := {
    Notations.double_colon := get;
  }.
  
  (*
      pub fn set_code(&mut self, code_hash: [u8; 32]) {
          set_code_hash(&code_hash).unwrap_or_else(|err| {
              panic!("Failed to `set_code_hash` to {code_hash:?} due to {err:?}")
          });
          println!("Switched code hash to {:?}.", code_hash);
      }
  *)
  Parameter set_code : (mut_ref Self) -> (array u8.t) -> M unit.
  
  Global Instance AssociatedFunction_set_code :
    Notations.DoubleColon Self "set_code" := {
    Notations.double_colon := set_code;
  }.
End Impl_set_code_hash_Incrementer_t.
End Impl_set_code_hash_Incrementer_t.
