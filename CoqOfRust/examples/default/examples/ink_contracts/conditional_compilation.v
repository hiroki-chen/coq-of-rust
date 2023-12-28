(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module  AccountId.
Section AccountId.
  Record t : Set := {
    x0 : u128.t;
  }.
  
  Global Instance Get_0 : Notations.Dot "0" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(x0)) (fun β α => Some (α <| x0 := β |>));
  }.
End AccountId.
End AccountId.

Module  Impl_core_default_Default_for_conditional_compilation_AccountId_t.
Section Impl_core_default_Default_for_conditional_compilation_AccountId_t.
  Definition Self : Set := conditional_compilation.AccountId.t.
  
  (*
  Default
  *)
  Definition default : M conditional_compilation.AccountId.t :=
    let* α0 : u128.t :=
      M.call
        (core.default.Default.default
          (Self := u128.t)
          (Trait := ltac:(refine _))) in
    M.pure (conditional_compilation.AccountId.Build_t α0).
  
  Global Instance AssociatedFunction_default :
    Notations.DoubleColon Self "default" := {
    Notations.double_colon := default;
  }.
  
  Global Instance ℐ : core.default.Default.Trait Self := {
    core.default.Default.default := default;
  }.
End Impl_core_default_Default_for_conditional_compilation_AccountId_t.
End Impl_core_default_Default_for_conditional_compilation_AccountId_t.

Module  Impl_core_clone_Clone_for_conditional_compilation_AccountId_t.
Section Impl_core_clone_Clone_for_conditional_compilation_AccountId_t.
  Definition Self : Set := conditional_compilation.AccountId.t.
  
  (*
  Clone
  *)
  Definition clone (self : ref Self) : M conditional_compilation.AccountId.t :=
    let* self := M.alloc self in
    let* α0 : M.Val conditional_compilation.AccountId.t :=
      match_operator
        tt
        [
          fun α =>
            match α with
            | _ =>
              let* α0 : ref conditional_compilation.AccountId.t :=
                M.read self in
              M.pure (deref α0)
            end :
            M (M.Val conditional_compilation.AccountId.t)
        ] in
    M.read α0.
  
  Global Instance AssociatedFunction_clone :
    Notations.DoubleColon Self "clone" := {
    Notations.double_colon := clone;
  }.
  
  Global Instance ℐ : core.clone.Clone.Required.Trait Self := {
    core.clone.Clone.clone := clone;
    core.clone.Clone.clone_from := Datatypes.None;
  }.
End Impl_core_clone_Clone_for_conditional_compilation_AccountId_t.
End Impl_core_clone_Clone_for_conditional_compilation_AccountId_t.

Module  Impl_core_marker_Copy_for_conditional_compilation_AccountId_t.
Section Impl_core_marker_Copy_for_conditional_compilation_AccountId_t.
  Definition Self : Set := conditional_compilation.AccountId.t.
  
  Global Instance ℐ : core.marker.Copy.Trait Self := {
  }.
End Impl_core_marker_Copy_for_conditional_compilation_AccountId_t.
End Impl_core_marker_Copy_for_conditional_compilation_AccountId_t.

Ltac Balance := exact u128.t.

Ltac BlockNumber := exact u32.t.

Module  Env.
Section Env.
  Record t : Set := {
    caller : conditional_compilation.AccountId.t;
  }.
  
  Global Instance Get_caller : Notations.Dot "caller" := {
    Notations.dot :=
      Ref.map
        (fun α => Some α.(caller))
        (fun β α => Some (α <| caller := β |>));
  }.
  Global Instance Get_AF_caller : Notations.DoubleColon t "caller" := {
    Notations.double_colon (α : M.Val t) := α.["caller"];
  }.
End Env.
End Env.

Module  Flip.
Section Flip.
  Class Trait (Self : Set) : Type := {
    flip : (mut_ref Self) -> M unit;
    get : (ref Self) -> M bool.t;
    push_foo : (mut_ref Self) -> bool.t -> M unit;
  }.
  
End Flip.
End Flip.

Module  Changes.
Section Changes.
  Record t : Set := {
    new_value : bool.t;
    by_ : conditional_compilation.AccountId.t;
  }.
  
  Global Instance Get_new_value : Notations.Dot "new_value" := {
    Notations.dot :=
      Ref.map
        (fun α => Some α.(new_value))
        (fun β α => Some (α <| new_value := β |>));
  }.
  Global Instance Get_AF_new_value : Notations.DoubleColon t "new_value" := {
    Notations.double_colon (α : M.Val t) := α.["new_value"];
  }.
  Global Instance Get_by_ : Notations.Dot "by_" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(by_)) (fun β α => Some (α <| by_ := β |>));
  }.
  Global Instance Get_AF_by_ : Notations.DoubleColon t "by_" := {
    Notations.double_colon (α : M.Val t) := α.["by_"];
  }.
End Changes.
End Changes.

Module  ChangesDated.
Section ChangesDated.
  Record t : Set := {
    new_value : bool.t;
    by_ : conditional_compilation.AccountId.t;
    when : ltac:(conditional_compilation.BlockNumber);
  }.
  
  Global Instance Get_new_value : Notations.Dot "new_value" := {
    Notations.dot :=
      Ref.map
        (fun α => Some α.(new_value))
        (fun β α => Some (α <| new_value := β |>));
  }.
  Global Instance Get_AF_new_value : Notations.DoubleColon t "new_value" := {
    Notations.double_colon (α : M.Val t) := α.["new_value"];
  }.
  Global Instance Get_by_ : Notations.Dot "by_" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(by_)) (fun β α => Some (α <| by_ := β |>));
  }.
  Global Instance Get_AF_by_ : Notations.DoubleColon t "by_" := {
    Notations.double_colon (α : M.Val t) := α.["by_"];
  }.
  Global Instance Get_when : Notations.Dot "when" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(when)) (fun β α => Some (α <| when := β |>));
  }.
  Global Instance Get_AF_when : Notations.DoubleColon t "when" := {
    Notations.double_colon (α : M.Val t) := α.["when"];
  }.
End ChangesDated.
End ChangesDated.

Module Event.
  Inductive t : Set :=
  | Changes (_ : conditional_compilation.Changes.t)
  | ChangesDated (_ : conditional_compilation.ChangesDated.t).
  
  Global Instance Get_Changes_0 : Notations.Dot "Changes.0" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | Changes α0 => Some α0 | _ => None end)
        (fun β α =>
          match α with | Changes _ => Some (Changes β) | _ => None end);
  }.
  
  Global Instance Get_ChangesDated_0 : Notations.Dot "ChangesDated.0" := {
    Notations.dot :=
      Ref.map
        (fun α => match α with | ChangesDated α0 => Some α0 | _ => None end)
        (fun β α =>
          match α with
          | ChangesDated _ => Some (ChangesDated β)
          | _ => None
          end);
  }.
End Event.

Module  Impl_conditional_compilation_Env_t.
Section Impl_conditional_compilation_Env_t.
  Definition Self : Set := conditional_compilation.Env.t.
  
  (*
      fn caller(&self) -> AccountId {
          self.caller
      }
  *)
  Definition caller (self : ref Self) : M conditional_compilation.AccountId.t :=
    let* self := M.alloc self in
    let* α0 : ref conditional_compilation.Env.t := M.read self in
    M.read (deref α0).["caller"].
  
  Global Instance AssociatedFunction_caller :
    Notations.DoubleColon Self "caller" := {
    Notations.double_colon := caller;
  }.
  
  (*
      fn emit_event(&self, _event: Event) {
          unimplemented!()
      }
  *)
  Definition emit_event
      (self : ref Self)
      (_event : conditional_compilation.Event.t)
      : M unit :=
    let* self := M.alloc self in
    let* _event := M.alloc _event in
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_emit_event :
    Notations.DoubleColon Self "emit_event" := {
    Notations.double_colon := emit_event;
  }.
  
  (*
      fn block_number(&self) -> BlockNumber {
          unimplemented!()
      }
  *)
  Definition block_number
      (self : ref Self)
      : M ltac:(conditional_compilation.BlockNumber) :=
    let* self := M.alloc self in
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_block_number :
    Notations.DoubleColon Self "block_number" := {
    Notations.double_colon := block_number;
  }.
End Impl_conditional_compilation_Env_t.
End Impl_conditional_compilation_Env_t.

Module  ConditionalCompilation.
Section ConditionalCompilation.
  Record t : Set := {
    value : bool.t;
  }.
  
  Global Instance Get_value : Notations.Dot "value" := {
    Notations.dot :=
      Ref.map (fun α => Some α.(value)) (fun β α => Some (α <| value := β |>));
  }.
  Global Instance Get_AF_value : Notations.DoubleColon t "value" := {
    Notations.double_colon (α : M.Val t) := α.["value"];
  }.
End ConditionalCompilation.
End ConditionalCompilation.

Module  Impl_conditional_compilation_ConditionalCompilation_t.
Section Impl_conditional_compilation_ConditionalCompilation_t.
  Definition Self : Set := conditional_compilation.ConditionalCompilation.t.
  
  (*
      fn init_env() -> Env {
          unimplemented!()
      }
  *)
  Definition init_env : M conditional_compilation.Env.t :=
    let* α0 : ref str.t := M.read (mk_str "not implemented") in
    let* α1 : never.t := M.call (core.panicking.panic α0) in
    never_to_any α1.
  
  Global Instance AssociatedFunction_init_env :
    Notations.DoubleColon Self "init_env" := {
    Notations.double_colon := init_env;
  }.
  
  (*
      fn env(&self) -> Env {
          Self::init_env()
      }
  *)
  Definition env (self : ref Self) : M conditional_compilation.Env.t :=
    let* self := M.alloc self in
    M.call conditional_compilation.ConditionalCompilation.t::["init_env"].
  
  Global Instance AssociatedFunction_env : Notations.DoubleColon Self "env" := {
    Notations.double_colon := env;
  }.
  
  (*
      pub fn new() -> Self {
          Self {
              value: Default::default(),
          }
      }
  *)
  Definition new : M Self :=
    let* α0 : bool.t :=
      M.call
        (core.default.Default.default
          (Self := bool.t)
          (Trait := ltac:(refine _))) in
    M.pure {| conditional_compilation.ConditionalCompilation.value := α0; |}.
  
  Global Instance AssociatedFunction_new : Notations.DoubleColon Self "new" := {
    Notations.double_colon := new;
  }.
  
  (*
      pub fn new_foo(value: bool) -> Self {
          Self { value }
      }
  *)
  Definition new_foo (value : bool.t) : M Self :=
    let* value := M.alloc value in
    let* α0 : bool.t := M.read value in
    M.pure {| conditional_compilation.ConditionalCompilation.value := α0; |}.
  
  Global Instance AssociatedFunction_new_foo :
    Notations.DoubleColon Self "new_foo" := {
    Notations.double_colon := new_foo;
  }.
  
  (*
      pub fn new_bar(value: bool) -> Self {
          Self { value }
      }
  *)
  Definition new_bar (value : bool.t) : M Self :=
    let* value := M.alloc value in
    let* α0 : bool.t := M.read value in
    M.pure {| conditional_compilation.ConditionalCompilation.value := α0; |}.
  
  Global Instance AssociatedFunction_new_bar :
    Notations.DoubleColon Self "new_bar" := {
    Notations.double_colon := new_bar;
  }.
  
  (*
      pub fn new_foo_bar(value: bool) -> Self {
          Self { value }
      }
  *)
  Definition new_foo_bar (value : bool.t) : M Self :=
    let* value := M.alloc value in
    let* α0 : bool.t := M.read value in
    M.pure {| conditional_compilation.ConditionalCompilation.value := α0; |}.
  
  Global Instance AssociatedFunction_new_foo_bar :
    Notations.DoubleColon Self "new_foo_bar" := {
    Notations.double_colon := new_foo_bar;
  }.
  
  (*
      pub fn inherent_flip_foo(&mut self) {
          self.value = !self.value;
          let caller = Self::init_env().caller();
          Self::init_env().emit_event(Event::Changes(Changes {
              new_value: self.value,
              by: caller,
          }));
      }
  *)
  Definition inherent_flip_foo (self : mut_ref Self) : M unit :=
    let* self := M.alloc self in
    let* _ : M.Val unit :=
      let* α0 : mut_ref conditional_compilation.ConditionalCompilation.t :=
        M.read self in
      let* α1 : mut_ref conditional_compilation.ConditionalCompilation.t :=
        M.read self in
      let* α2 : bool.t := M.read (deref α1).["value"] in
      assign (deref α0).["value"] (UnOp.not α2) in
    let* caller : M.Val conditional_compilation.AccountId.t :=
      let* α0 : conditional_compilation.Env.t :=
        M.call conditional_compilation.ConditionalCompilation.t::["init_env"] in
      let* α1 : M.Val conditional_compilation.Env.t := M.alloc α0 in
      let* α2 : conditional_compilation.AccountId.t :=
        M.call (conditional_compilation.Env.t::["caller"] (borrow α1)) in
      M.alloc α2 in
    let* _ : M.Val unit :=
      let* α0 : conditional_compilation.Env.t :=
        M.call conditional_compilation.ConditionalCompilation.t::["init_env"] in
      let* α1 : M.Val conditional_compilation.Env.t := M.alloc α0 in
      let* α2 : mut_ref conditional_compilation.ConditionalCompilation.t :=
        M.read self in
      let* α3 : bool.t := M.read (deref α2).["value"] in
      let* α4 : conditional_compilation.AccountId.t := M.read caller in
      let* α5 : unit :=
        M.call
          (conditional_compilation.Env.t::["emit_event"]
            (borrow α1)
            (conditional_compilation.Event.Changes
              {|
                conditional_compilation.Changes.new_value := α3;
                conditional_compilation.Changes.by_ := α4;
              |})) in
      M.alloc α5 in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_inherent_flip_foo :
    Notations.DoubleColon Self "inherent_flip_foo" := {
    Notations.double_colon := inherent_flip_foo;
  }.
  
  (*
      pub fn inherent_flip_bar(&mut self) {
          let caller = Self::init_env().caller();
          let block_number = Self::init_env().block_number();
          self.value = !self.value;
          Self::init_env().emit_event(Event::ChangesDated(ChangesDated {
              new_value: self.value,
              by: caller,
              when: block_number,
          }));
      }
  *)
  Definition inherent_flip_bar (self : mut_ref Self) : M unit :=
    let* self := M.alloc self in
    let* caller : M.Val conditional_compilation.AccountId.t :=
      let* α0 : conditional_compilation.Env.t :=
        M.call conditional_compilation.ConditionalCompilation.t::["init_env"] in
      let* α1 : M.Val conditional_compilation.Env.t := M.alloc α0 in
      let* α2 : conditional_compilation.AccountId.t :=
        M.call (conditional_compilation.Env.t::["caller"] (borrow α1)) in
      M.alloc α2 in
    let* block_number : M.Val u32.t :=
      let* α0 : conditional_compilation.Env.t :=
        M.call conditional_compilation.ConditionalCompilation.t::["init_env"] in
      let* α1 : M.Val conditional_compilation.Env.t := M.alloc α0 in
      let* α2 : u32.t :=
        M.call (conditional_compilation.Env.t::["block_number"] (borrow α1)) in
      M.alloc α2 in
    let* _ : M.Val unit :=
      let* α0 : mut_ref conditional_compilation.ConditionalCompilation.t :=
        M.read self in
      let* α1 : mut_ref conditional_compilation.ConditionalCompilation.t :=
        M.read self in
      let* α2 : bool.t := M.read (deref α1).["value"] in
      assign (deref α0).["value"] (UnOp.not α2) in
    let* _ : M.Val unit :=
      let* α0 : conditional_compilation.Env.t :=
        M.call conditional_compilation.ConditionalCompilation.t::["init_env"] in
      let* α1 : M.Val conditional_compilation.Env.t := M.alloc α0 in
      let* α2 : mut_ref conditional_compilation.ConditionalCompilation.t :=
        M.read self in
      let* α3 : bool.t := M.read (deref α2).["value"] in
      let* α4 : conditional_compilation.AccountId.t := M.read caller in
      let* α5 : u32.t := M.read block_number in
      let* α6 : unit :=
        M.call
          (conditional_compilation.Env.t::["emit_event"]
            (borrow α1)
            (conditional_compilation.Event.ChangesDated
              {|
                conditional_compilation.ChangesDated.new_value := α3;
                conditional_compilation.ChangesDated.by_ := α4;
                conditional_compilation.ChangesDated.when := α5;
              |})) in
      M.alloc α6 in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_inherent_flip_bar :
    Notations.DoubleColon Self "inherent_flip_bar" := {
    Notations.double_colon := inherent_flip_bar;
  }.
End Impl_conditional_compilation_ConditionalCompilation_t.
End Impl_conditional_compilation_ConditionalCompilation_t.

Module  Impl_conditional_compilation_Flip_for_conditional_compilation_ConditionalCompilation_t.
Section Impl_conditional_compilation_Flip_for_conditional_compilation_ConditionalCompilation_t.
  Definition Self : Set := conditional_compilation.ConditionalCompilation.t.
  
  (*
      fn flip(&mut self) {
          self.value = !self.value;
      }
  *)
  Definition flip (self : mut_ref Self) : M unit :=
    let* self := M.alloc self in
    let* _ : M.Val unit :=
      let* α0 : mut_ref conditional_compilation.ConditionalCompilation.t :=
        M.read self in
      let* α1 : mut_ref conditional_compilation.ConditionalCompilation.t :=
        M.read self in
      let* α2 : bool.t := M.read (deref α1).["value"] in
      assign (deref α0).["value"] (UnOp.not α2) in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_flip :
    Notations.DoubleColon Self "flip" := {
    Notations.double_colon := flip;
  }.
  
  (*
      fn get(&self) -> bool {
          self.value
      }
  *)
  Definition get (self : ref Self) : M bool.t :=
    let* self := M.alloc self in
    let* α0 : ref conditional_compilation.ConditionalCompilation.t :=
      M.read self in
    M.read (deref α0).["value"].
  
  Global Instance AssociatedFunction_get : Notations.DoubleColon Self "get" := {
    Notations.double_colon := get;
  }.
  
  (*
      fn push_foo(&mut self, value: bool) {
          let caller = Self::init_env().caller();
          Self::init_env().emit_event(Event::Changes(Changes {
              new_value: value,
              by: caller,
          }));
          self.value = value;
      }
  *)
  Definition push_foo (self : mut_ref Self) (value : bool.t) : M unit :=
    let* self := M.alloc self in
    let* value := M.alloc value in
    let* caller : M.Val conditional_compilation.AccountId.t :=
      let* α0 : conditional_compilation.Env.t :=
        M.call conditional_compilation.ConditionalCompilation.t::["init_env"] in
      let* α1 : M.Val conditional_compilation.Env.t := M.alloc α0 in
      let* α2 : conditional_compilation.AccountId.t :=
        M.call (conditional_compilation.Env.t::["caller"] (borrow α1)) in
      M.alloc α2 in
    let* _ : M.Val unit :=
      let* α0 : conditional_compilation.Env.t :=
        M.call conditional_compilation.ConditionalCompilation.t::["init_env"] in
      let* α1 : M.Val conditional_compilation.Env.t := M.alloc α0 in
      let* α2 : bool.t := M.read value in
      let* α3 : conditional_compilation.AccountId.t := M.read caller in
      let* α4 : unit :=
        M.call
          (conditional_compilation.Env.t::["emit_event"]
            (borrow α1)
            (conditional_compilation.Event.Changes
              {|
                conditional_compilation.Changes.new_value := α2;
                conditional_compilation.Changes.by_ := α3;
              |})) in
      M.alloc α4 in
    let* _ : M.Val unit :=
      let* α0 : mut_ref conditional_compilation.ConditionalCompilation.t :=
        M.read self in
      let* α1 : bool.t := M.read value in
      assign (deref α0).["value"] α1 in
    let* α0 : M.Val unit := M.alloc tt in
    M.read α0.
  
  Global Instance AssociatedFunction_push_foo :
    Notations.DoubleColon Self "push_foo" := {
    Notations.double_colon := push_foo;
  }.
  
  Global Instance ℐ : conditional_compilation.Flip.Trait Self := {
    conditional_compilation.Flip.flip := flip;
    conditional_compilation.Flip.get := get;
    conditional_compilation.Flip.push_foo := push_foo;
  }.
End Impl_conditional_compilation_Flip_for_conditional_compilation_ConditionalCompilation_t.
End Impl_conditional_compilation_Flip_for_conditional_compilation_ConditionalCompilation_t.
