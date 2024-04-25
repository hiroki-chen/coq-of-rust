(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module ops.
  Module function.
    (* Trait *)
    (* Empty module 'Fn' *)
    
    (* Trait *)
    (* Empty module 'FnMut' *)
    
    (* Trait *)
    (* Empty module 'FnOnce' *)
    
    Module impls.
      Module Impl_core_ops_function_Fn_where_core_marker_Tuple_A_where_core_marker_Sized_F_where_core_ops_function_Fn_F_A_A_for_ref__F.
        Definition Self (A F : Ty.t) : Ty.t := Ty.apply (Ty.path "&") [ F ].
        
        (*
                extern "rust-call" fn call(&self, args: A) -> F::Output {
                    ( **self).call(args)
                }
        *)
        Definition call (A F : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self A F in
          match τ, α with
          | [], [ self; args ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let args := M.alloc (| args |) in
              M.call_closure (|
                M.get_trait_method (| "core::ops::function::Fn", F, [ A ], "call", [] |),
                [ M.read (| M.read (| self |) |); M.read (| args |) ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          forall (A F : Ty.t),
          M.IsTraitInstance
            "core::ops::function::Fn"
            (Self A F)
            (* Trait polymorphic types *) [ (* Args *) A ]
            (* Instance *) [ ("call", InstanceField.Method (call A F)) ].
      End Impl_core_ops_function_Fn_where_core_marker_Tuple_A_where_core_marker_Sized_F_where_core_ops_function_Fn_F_A_A_for_ref__F.
      
      Module Impl_core_ops_function_FnMut_where_core_marker_Tuple_A_where_core_marker_Sized_F_where_core_ops_function_Fn_F_A_A_for_ref__F.
        Definition Self (A F : Ty.t) : Ty.t := Ty.apply (Ty.path "&") [ F ].
        
        (*
                extern "rust-call" fn call_mut(&mut self, args: A) -> F::Output {
                    ( **self).call(args)
                }
        *)
        Definition call_mut (A F : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self A F in
          match τ, α with
          | [], [ self; args ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let args := M.alloc (| args |) in
              M.call_closure (|
                M.get_trait_method (| "core::ops::function::Fn", F, [ A ], "call", [] |),
                [ M.read (| M.read (| self |) |); M.read (| args |) ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          forall (A F : Ty.t),
          M.IsTraitInstance
            "core::ops::function::FnMut"
            (Self A F)
            (* Trait polymorphic types *) [ (* Args *) A ]
            (* Instance *) [ ("call_mut", InstanceField.Method (call_mut A F)) ].
      End Impl_core_ops_function_FnMut_where_core_marker_Tuple_A_where_core_marker_Sized_F_where_core_ops_function_Fn_F_A_A_for_ref__F.
      
      Module Impl_core_ops_function_FnOnce_where_core_marker_Tuple_A_where_core_marker_Sized_F_where_core_ops_function_Fn_F_A_A_for_ref__F.
        Definition Self (A F : Ty.t) : Ty.t := Ty.apply (Ty.path "&") [ F ].
        
        (*         type Output = F::Output; *)
        Definition _Output (A F : Ty.t) : Ty.t := Ty.associated.
        
        (*
                extern "rust-call" fn call_once(self, args: A) -> F::Output {
                    ( *self).call(args)
                }
        *)
        Definition call_once (A F : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self A F in
          match τ, α with
          | [], [ self; args ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let args := M.alloc (| args |) in
              M.call_closure (|
                M.get_trait_method (| "core::ops::function::Fn", F, [ A ], "call", [] |),
                [ M.read (| self |); M.read (| args |) ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          forall (A F : Ty.t),
          M.IsTraitInstance
            "core::ops::function::FnOnce"
            (Self A F)
            (* Trait polymorphic types *) [ (* Args *) A ]
            (* Instance *)
            [
              ("Output", InstanceField.Ty (_Output A F));
              ("call_once", InstanceField.Method (call_once A F))
            ].
      End Impl_core_ops_function_FnOnce_where_core_marker_Tuple_A_where_core_marker_Sized_F_where_core_ops_function_Fn_F_A_A_for_ref__F.
      
      Module Impl_core_ops_function_FnMut_where_core_marker_Tuple_A_where_core_marker_Sized_F_where_core_ops_function_FnMut_F_A_A_for_ref_mut_F.
        Definition Self (A F : Ty.t) : Ty.t := Ty.apply (Ty.path "&mut") [ F ].
        
        (*
                extern "rust-call" fn call_mut(&mut self, args: A) -> F::Output {
                    ( *self).call_mut(args)
                }
        *)
        Definition call_mut (A F : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self A F in
          match τ, α with
          | [], [ self; args ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let args := M.alloc (| args |) in
              M.call_closure (|
                M.get_trait_method (| "core::ops::function::FnMut", F, [ A ], "call_mut", [] |),
                [ M.read (| M.read (| self |) |); M.read (| args |) ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          forall (A F : Ty.t),
          M.IsTraitInstance
            "core::ops::function::FnMut"
            (Self A F)
            (* Trait polymorphic types *) [ (* Args *) A ]
            (* Instance *) [ ("call_mut", InstanceField.Method (call_mut A F)) ].
      End Impl_core_ops_function_FnMut_where_core_marker_Tuple_A_where_core_marker_Sized_F_where_core_ops_function_FnMut_F_A_A_for_ref_mut_F.
      
      Module Impl_core_ops_function_FnOnce_where_core_marker_Tuple_A_where_core_marker_Sized_F_where_core_ops_function_FnMut_F_A_A_for_ref_mut_F.
        Definition Self (A F : Ty.t) : Ty.t := Ty.apply (Ty.path "&mut") [ F ].
        
        (*         type Output = F::Output; *)
        Definition _Output (A F : Ty.t) : Ty.t := Ty.associated.
        
        (*
                extern "rust-call" fn call_once(self, args: A) -> F::Output {
                    ( *self).call_mut(args)
                }
        *)
        Definition call_once (A F : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self A F in
          match τ, α with
          | [], [ self; args ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let args := M.alloc (| args |) in
              M.call_closure (|
                M.get_trait_method (| "core::ops::function::FnMut", F, [ A ], "call_mut", [] |),
                [ M.read (| self |); M.read (| args |) ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          forall (A F : Ty.t),
          M.IsTraitInstance
            "core::ops::function::FnOnce"
            (Self A F)
            (* Trait polymorphic types *) [ (* Args *) A ]
            (* Instance *)
            [
              ("Output", InstanceField.Ty (_Output A F));
              ("call_once", InstanceField.Method (call_once A F))
            ].
      End Impl_core_ops_function_FnOnce_where_core_marker_Tuple_A_where_core_marker_Sized_F_where_core_ops_function_FnMut_F_A_A_for_ref_mut_F.
    End impls.
  End function.
End ops.
