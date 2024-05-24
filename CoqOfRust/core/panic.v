(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module intrinsics.
  Module mir.
    Module UnwindContinue.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction
          "core::intrinsics::mir::UnwindContinue::panic_cold_explicit"
          panic_cold_explicit.
    End UnwindContinue.
    
    Module UnwindUnreachable.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction
          "core::intrinsics::mir::UnwindUnreachable::panic_cold_explicit"
          panic_cold_explicit.
    End UnwindUnreachable.
    
    Module UnwindTerminate.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction
          "core::intrinsics::mir::UnwindTerminate::panic_cold_explicit"
          panic_cold_explicit.
    End UnwindTerminate.
    
    Module UnwindCleanup.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction
          "core::intrinsics::mir::UnwindCleanup::panic_cold_explicit"
          panic_cold_explicit.
    End UnwindCleanup.
    
    Module Return.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction "core::intrinsics::mir::Return::panic_cold_explicit" panic_cold_explicit.
    End Return.
    
    Module Goto.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction "core::intrinsics::mir::Goto::panic_cold_explicit" panic_cold_explicit.
    End Goto.
    
    Module Unreachable.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction "core::intrinsics::mir::Unreachable::panic_cold_explicit" panic_cold_explicit.
    End Unreachable.
    
    Module Drop.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction "core::intrinsics::mir::Drop::panic_cold_explicit" panic_cold_explicit.
    End Drop.
    
    Module Call.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction "core::intrinsics::mir::Call::panic_cold_explicit" panic_cold_explicit.
    End Call.
    
    Module UnwindResume.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction "core::intrinsics::mir::UnwindResume::panic_cold_explicit" panic_cold_explicit.
    End UnwindResume.
    
    Module StorageLive.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction "core::intrinsics::mir::StorageLive::panic_cold_explicit" panic_cold_explicit.
    End StorageLive.
    
    Module StorageDead.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction "core::intrinsics::mir::StorageDead::panic_cold_explicit" panic_cold_explicit.
    End StorageDead.
    
    Module Deinit.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction "core::intrinsics::mir::Deinit::panic_cold_explicit" panic_cold_explicit.
    End Deinit.
    
    Module Checked.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction "core::intrinsics::mir::Checked::panic_cold_explicit" panic_cold_explicit.
    End Checked.
    
    Module Len.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction "core::intrinsics::mir::Len::panic_cold_explicit" panic_cold_explicit.
    End Len.
    
    Module CopyForDeref.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction "core::intrinsics::mir::CopyForDeref::panic_cold_explicit" panic_cold_explicit.
    End CopyForDeref.
    
    Module Retag.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction "core::intrinsics::mir::Retag::panic_cold_explicit" panic_cold_explicit.
    End Retag.
    
    Module Move.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction "core::intrinsics::mir::Move::panic_cold_explicit" panic_cold_explicit.
    End Move.
    
    Module Static.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction "core::intrinsics::mir::Static::panic_cold_explicit" panic_cold_explicit.
    End Static.
    
    Module StaticMut.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction "core::intrinsics::mir::StaticMut::panic_cold_explicit" panic_cold_explicit.
    End StaticMut.
    
    Module Discriminant.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction "core::intrinsics::mir::Discriminant::panic_cold_explicit" panic_cold_explicit.
    End Discriminant.
    
    Module SetDiscriminant.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction
          "core::intrinsics::mir::SetDiscriminant::panic_cold_explicit"
          panic_cold_explicit.
    End SetDiscriminant.
    
    Module Offset.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction "core::intrinsics::mir::Offset::panic_cold_explicit" panic_cold_explicit.
    End Offset.
    
    Module Field.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction "core::intrinsics::mir::Field::panic_cold_explicit" panic_cold_explicit.
    End Field.
    
    Module Variant.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction "core::intrinsics::mir::Variant::panic_cold_explicit" panic_cold_explicit.
    End Variant.
    
    Module CastTransmute.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction
          "core::intrinsics::mir::CastTransmute::panic_cold_explicit"
          panic_cold_explicit.
    End CastTransmute.
    
    Module __internal_make_place.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction
          "core::intrinsics::mir::__internal_make_place::panic_cold_explicit"
          panic_cold_explicit.
    End __internal_make_place.
    
    Module __debuginfo.
      (*
              const fn panic_cold_explicit() -> ! {
                  $crate::panicking::panic_explicit()
              }
      *)
      Definition panic_cold_explicit (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (M.call_closure (| M.get_function (| "core::panicking::panic_explicit", [] |), [] |)))
        | _, _ => M.impossible
        end.
      
      Axiom Function_panic_cold_explicit :
        M.IsFunction "core::intrinsics::mir::__debuginfo::panic_cold_explicit" panic_cold_explicit.
    End __debuginfo.
  End mir.
End intrinsics.

Module panic.
  (* Trait *)
  (* Empty module 'PanicPayload' *)
End panic.
