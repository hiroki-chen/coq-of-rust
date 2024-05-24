(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module task.
  (* Trait *)
  Module Wake.
    Definition wake_by_ref (Self : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          M.read (|
            let _ :=
              M.alloc (|
                M.call_closure (|
                  M.get_trait_method (| "alloc::task::Wake", Self, [], "wake", [] |),
                  [
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::clone::Clone",
                        Ty.apply
                          (Ty.path "alloc::sync::Arc")
                          [ Self; Ty.path "alloc::alloc::Global" ],
                        [],
                        "clone",
                        []
                      |),
                      [ M.read (| self |) ]
                    |)
                  ]
                |)
              |) in
            M.alloc (| Value.Tuple [] |)
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom ProvidedMethod_wake_by_ref :
      M.IsProvidedMethod "alloc::task::Wake" "wake_by_ref" wake_by_ref.
  End Wake.
  
  Module Impl_core_convert_From_where_alloc_task_Wake_W_where_core_marker_Send_W_where_core_marker_Sync_W_alloc_sync_Arc_W_alloc_alloc_Global_for_core_task_wake_Waker.
    Definition Self (W : Ty.t) : Ty.t := Ty.path "core::task::wake::Waker".
    
    (*
        fn from(waker: Arc<W>) -> Waker {
            // SAFETY: This is safe because raw_waker safely constructs
            // a RawWaker from Arc<W>.
            unsafe { Waker::from_raw(raw_waker(waker)) }
        }
    *)
    Definition from (W : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
      let Self : Ty.t := Self W in
      match τ, α with
      | [], [ waker ] =>
        ltac:(M.monadic
          (let waker := M.alloc (| waker |) in
          M.call_closure (|
            M.get_associated_function (| Ty.path "core::task::wake::Waker", "from_raw", [] |),
            [
              M.call_closure (|
                M.get_function (| "alloc::task::raw_waker", [ W ] |),
                [ M.read (| waker |) ]
              |)
            ]
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      forall (W : Ty.t),
      M.IsTraitInstance
        "core::convert::From"
        (Self W)
        (* Trait polymorphic types *)
        [ (* T *) Ty.apply (Ty.path "alloc::sync::Arc") [ W; Ty.path "alloc::alloc::Global" ] ]
        (* Instance *) [ ("from", InstanceField.Method (from W)) ].
  End Impl_core_convert_From_where_alloc_task_Wake_W_where_core_marker_Send_W_where_core_marker_Sync_W_alloc_sync_Arc_W_alloc_alloc_Global_for_core_task_wake_Waker.
  
  Module Impl_core_convert_From_where_alloc_task_Wake_W_where_core_marker_Send_W_where_core_marker_Sync_W_alloc_sync_Arc_W_alloc_alloc_Global_for_core_task_wake_RawWaker.
    Definition Self (W : Ty.t) : Ty.t := Ty.path "core::task::wake::RawWaker".
    
    (*
        fn from(waker: Arc<W>) -> RawWaker {
            raw_waker(waker)
        }
    *)
    Definition from (W : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
      let Self : Ty.t := Self W in
      match τ, α with
      | [], [ waker ] =>
        ltac:(M.monadic
          (let waker := M.alloc (| waker |) in
          M.call_closure (|
            M.get_function (| "alloc::task::raw_waker", [ W ] |),
            [ M.read (| waker |) ]
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      forall (W : Ty.t),
      M.IsTraitInstance
        "core::convert::From"
        (Self W)
        (* Trait polymorphic types *)
        [ (* T *) Ty.apply (Ty.path "alloc::sync::Arc") [ W; Ty.path "alloc::alloc::Global" ] ]
        (* Instance *) [ ("from", InstanceField.Method (from W)) ].
  End Impl_core_convert_From_where_alloc_task_Wake_W_where_core_marker_Send_W_where_core_marker_Sync_W_alloc_sync_Arc_W_alloc_alloc_Global_for_core_task_wake_RawWaker.
  
  (*
  fn raw_waker<W: Wake + Send + Sync + 'static>(waker: Arc<W>) -> RawWaker {
      // Increment the reference count of the arc to clone it.
      unsafe fn clone_waker<W: Wake + Send + Sync + 'static>(waker: *const ()) -> RawWaker {
          unsafe { Arc::increment_strong_count(waker as *const W) };
          RawWaker::new(
              waker as *const (),
              &RawWakerVTable::new(clone_waker::<W>, wake::<W>, wake_by_ref::<W>, drop_waker::<W>),
          )
      }
  
      // Wake by value, moving the Arc into the Wake::wake function
      unsafe fn wake<W: Wake + Send + Sync + 'static>(waker: *const ()) {
          let waker = unsafe { Arc::from_raw(waker as *const W) };
          <W as Wake>::wake(waker);
      }
  
      // Wake by reference, wrap the waker in ManuallyDrop to avoid dropping it
      unsafe fn wake_by_ref<W: Wake + Send + Sync + 'static>(waker: *const ()) {
          let waker = unsafe { ManuallyDrop::new(Arc::from_raw(waker as *const W)) };
          <W as Wake>::wake_by_ref(&waker);
      }
  
      // Decrement the reference count of the Arc on drop
      unsafe fn drop_waker<W: Wake + Send + Sync + 'static>(waker: *const ()) {
          unsafe { Arc::decrement_strong_count(waker as *const W) };
      }
  
      RawWaker::new(
          Arc::into_raw(waker) as *const (),
          &RawWakerVTable::new(clone_waker::<W>, wake::<W>, wake_by_ref::<W>, drop_waker::<W>),
      )
  }
  *)
  Definition raw_waker (τ : list Ty.t) (α : list Value.t) : M :=
    match τ, α with
    | [ W ], [ waker ] =>
      ltac:(M.monadic
        (let waker := M.alloc (| waker |) in
        M.call_closure (|
          M.get_associated_function (| Ty.path "core::task::wake::RawWaker", "new", [] |),
          [
            M.rust_cast
              (M.call_closure (|
                M.get_associated_function (|
                  Ty.apply (Ty.path "alloc::sync::Arc") [ W; Ty.path "alloc::alloc::Global" ],
                  "into_raw",
                  []
                |),
                [ M.read (| waker |) ]
              |));
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "core::task::wake::RawWakerVTable",
                  "new",
                  []
                |),
                [
                  (* ReifyFnPointer *)
                  M.pointer_coercion
                    (M.get_function (| "alloc::task::raw_waker.clone_waker", [] |));
                  (* ReifyFnPointer *)
                  M.pointer_coercion (M.get_function (| "alloc::task::raw_waker.wake", [] |));
                  (* ReifyFnPointer *)
                  M.pointer_coercion
                    (M.get_function (| "alloc::task::raw_waker.wake_by_ref", [] |));
                  (* ReifyFnPointer *)
                  M.pointer_coercion (M.get_function (| "alloc::task::raw_waker.drop_waker", [] |))
                ]
              |)
            |)
          ]
        |)))
    | _, _ => M.impossible
    end.
  
  Axiom Function_raw_waker : M.IsFunction "alloc::task::raw_waker" raw_waker.
  
  Module raw_waker.
    (*
        unsafe fn clone_waker<W: Wake + Send + Sync + 'static>(waker: *const ()) -> RawWaker {
            unsafe { Arc::increment_strong_count(waker as *const W) };
            RawWaker::new(
                waker as *const (),
                &RawWakerVTable::new(clone_waker::<W>, wake::<W>, wake_by_ref::<W>, drop_waker::<W>),
            )
        }
    *)
    Definition clone_waker (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [ W ], [ waker ] =>
        ltac:(M.monadic
          (let waker := M.alloc (| waker |) in
          M.read (|
            let _ :=
              M.alloc (|
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.apply (Ty.path "alloc::sync::Arc") [ W; Ty.path "alloc::alloc::Global" ],
                    "increment_strong_count",
                    []
                  |),
                  [ M.rust_cast (M.read (| waker |)) ]
                |)
              |) in
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (| Ty.path "core::task::wake::RawWaker", "new", [] |),
                [
                  M.rust_cast (M.read (| waker |));
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "core::task::wake::RawWakerVTable",
                        "new",
                        []
                      |),
                      [
                        (* ReifyFnPointer *)
                        M.pointer_coercion
                          (M.get_function (| "alloc::task::raw_waker.clone_waker", [] |));
                        (* ReifyFnPointer *)
                        M.pointer_coercion (M.get_function (| "alloc::task::raw_waker.wake", [] |));
                        (* ReifyFnPointer *)
                        M.pointer_coercion
                          (M.get_function (| "alloc::task::raw_waker.wake_by_ref", [] |));
                        (* ReifyFnPointer *)
                        M.pointer_coercion
                          (M.get_function (| "alloc::task::raw_waker.drop_waker", [] |))
                      ]
                    |)
                  |)
                ]
              |)
            |)
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Function_clone_waker : M.IsFunction "alloc::task::raw_waker::clone_waker" clone_waker.
    
    (*
        unsafe fn wake<W: Wake + Send + Sync + 'static>(waker: *const ()) {
            let waker = unsafe { Arc::from_raw(waker as *const W) };
            <W as Wake>::wake(waker);
        }
    *)
    Definition wake (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [ W ], [ waker ] =>
        ltac:(M.monadic
          (let waker := M.alloc (| waker |) in
          M.read (|
            let waker :=
              M.alloc (|
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.apply (Ty.path "alloc::sync::Arc") [ W; Ty.path "alloc::alloc::Global" ],
                    "from_raw",
                    []
                  |),
                  [ M.rust_cast (M.read (| waker |)) ]
                |)
              |) in
            let _ :=
              M.alloc (|
                M.call_closure (|
                  M.get_trait_method (| "alloc::task::Wake", W, [], "wake", [] |),
                  [ M.read (| waker |) ]
                |)
              |) in
            M.alloc (| Value.Tuple [] |)
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Function_wake : M.IsFunction "alloc::task::raw_waker::wake" wake.
    
    (*
        unsafe fn wake_by_ref<W: Wake + Send + Sync + 'static>(waker: *const ()) {
            let waker = unsafe { ManuallyDrop::new(Arc::from_raw(waker as *const W)) };
            <W as Wake>::wake_by_ref(&waker);
        }
    *)
    Definition wake_by_ref (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [ W ], [ waker ] =>
        ltac:(M.monadic
          (let waker := M.alloc (| waker |) in
          M.read (|
            let waker :=
              M.alloc (|
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.apply
                      (Ty.path "core::mem::manually_drop::ManuallyDrop")
                      [ Ty.apply (Ty.path "alloc::sync::Arc") [ W; Ty.path "alloc::alloc::Global" ]
                      ],
                    "new",
                    []
                  |),
                  [
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply (Ty.path "alloc::sync::Arc") [ W; Ty.path "alloc::alloc::Global" ],
                        "from_raw",
                        []
                      |),
                      [ M.rust_cast (M.read (| waker |)) ]
                    |)
                  ]
                |)
              |) in
            let _ :=
              M.alloc (|
                M.call_closure (|
                  M.get_trait_method (| "alloc::task::Wake", W, [], "wake_by_ref", [] |),
                  [
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::ops::deref::Deref",
                        Ty.apply
                          (Ty.path "core::mem::manually_drop::ManuallyDrop")
                          [
                            Ty.apply
                              (Ty.path "alloc::sync::Arc")
                              [ W; Ty.path "alloc::alloc::Global" ]
                          ],
                        [],
                        "deref",
                        []
                      |),
                      [ waker ]
                    |)
                  ]
                |)
              |) in
            M.alloc (| Value.Tuple [] |)
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Function_wake_by_ref : M.IsFunction "alloc::task::raw_waker::wake_by_ref" wake_by_ref.
    
    (*
        unsafe fn drop_waker<W: Wake + Send + Sync + 'static>(waker: *const ()) {
            unsafe { Arc::decrement_strong_count(waker as *const W) };
        }
    *)
    Definition drop_waker (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [ W ], [ waker ] =>
        ltac:(M.monadic
          (let waker := M.alloc (| waker |) in
          M.read (|
            let _ :=
              M.alloc (|
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.apply (Ty.path "alloc::sync::Arc") [ W; Ty.path "alloc::alloc::Global" ],
                    "decrement_strong_count",
                    []
                  |),
                  [ M.rust_cast (M.read (| waker |)) ]
                |)
              |) in
            M.alloc (| Value.Tuple [] |)
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Function_drop_waker : M.IsFunction "alloc::task::raw_waker::drop_waker" drop_waker.
  End raw_waker.
End task.
