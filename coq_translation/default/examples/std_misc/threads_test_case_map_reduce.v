(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main : M (M.Val unit) :=
  M.function_body
    (let data :=
      mk_str
        "86967897737416471853297327050364959
11861322575564723963297542624962850
70856234701860851907960690014725639
38397966707106094172783238747669219
52380795257888236525459303330302837
58495327135744041048897885734297812
69920216438980873548808413720956532
16278424637452589860345374828574668" in
    let* children :
        ltac:(refine
          (M.Val
            (alloc.vec.Vec.t
              (std.thread.JoinHandle.t u32.t)
              alloc.alloc.Global.t))) :=
      (alloc.vec.Vec.t
          (std.thread.JoinHandle.t u32.t)
          alloc.alloc.Global.t)::["new"] in
    let* chunked_data : ltac:(refine (M.Val core.str.iter.SplitWhitespace.t)) :=
      let* α0 : ltac:(refine (M.Val str)) := deref data in
      let* α1 : ltac:(refine (M.Val (ref str))) := borrow α0 in
      str::["split_whitespace"] α1 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* α0 :
          ltac:(refine
            (M.Val
              (core.iter.adapters.enumerate.Enumerate.t
                core.str.iter.SplitWhitespace.t))) :=
        (core.iter.traits.iterator.Iterator.enumerate
            (Self := core.str.iter.SplitWhitespace.t)
            (Trait := ltac:(refine _)))
          chunked_data in
      let* α1 :
          ltac:(refine
            (M.Val
              (core.iter.adapters.enumerate.Enumerate.t
                core.str.iter.SplitWhitespace.t))) :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self :=
              core.iter.adapters.enumerate.Enumerate.t
                core.str.iter.SplitWhitespace.t)
            (Trait := ltac:(refine _)))
          α0 in
      let* α2 := M.read α1 in
      let* α3 : ltac:(refine (M.Val unit)) :=
        match α2 with
        | iter =>
          let* iter := M.alloc iter in
          loop
            (let* _ : ltac:(refine (M.Val unit)) :=
              let* α0 :
                  ltac:(refine
                    (M.Val
                      (mut_ref
                        (core.iter.adapters.enumerate.Enumerate.t
                          core.str.iter.SplitWhitespace.t)))) :=
                borrow_mut iter in
              let* α1 :
                  ltac:(refine
                    (M.Val (core.option.Option.t (usize.t * (ref str))))) :=
                (core.iter.traits.iterator.Iterator.next
                    (Self :=
                      core.iter.adapters.enumerate.Enumerate.t
                        core.str.iter.SplitWhitespace.t)
                    (Trait := ltac:(refine _)))
                  α0 in
              let* α2 := M.read α1 in
              match α2 with
              | core.option.Option.None  =>
                let* α0 : ltac:(refine (M.Val never.t)) := Break in
                never_to_any α0
              | core.option.Option.Some (i, data_segment) =>
                let* data_segment := M.alloc data_segment in
                let* i := M.alloc i in
                let* _ : ltac:(refine (M.Val unit)) :=
                  let* _ : ltac:(refine (M.Val unit)) :=
                    let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
                      M.alloc
                        [ mk_str "data segment "; mk_str " is ""; mk_str ""
"
                        ] in
                    let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) :=
                      borrow α0 in
                    let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
                      pointer_coercion "Unsize" α1 in
                    let* α3 : ltac:(refine (M.Val (ref usize.t))) := borrow i in
                    let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
                      core.fmt.rt.Argument.t::["new_display"] α3 in
                    let* α5 : ltac:(refine (M.Val (ref (ref str)))) :=
                      borrow data_segment in
                    let* α6 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
                      core.fmt.rt.Argument.t::["new_display"] α5 in
                    let* α7 :
                        ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
                      M.alloc [ α4; α6 ] in
                    let* α8 :
                        ltac:(refine
                          (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
                      borrow α7 in
                    let* α9 :
                        ltac:(refine
                          (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
                      pointer_coercion "Unsize" α8 in
                    let* α10 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
                      core.fmt.Arguments.t::["new_v1"] α2 α9 in
                    std.io.stdio._print α10 in
                  M.alloc tt in
                let* _ : ltac:(refine (M.Val unit)) :=
                  let* α0 :
                      ltac:(refine
                        (M.Val
                          (mut_ref
                            (alloc.vec.Vec.t
                              (std.thread.JoinHandle.t u32.t)
                              alloc.alloc.Global.t)))) :=
                    borrow_mut children in
                  let* α1 :
                      ltac:(refine (M.Val (std.thread.JoinHandle.t u32.t))) :=
                    std.thread.spawn
                      (let* result : ltac:(refine (M.Val u32.t)) :=
                        let* α0 : ltac:(refine (M.Val str)) :=
                          deref data_segment in
                        let* α1 : ltac:(refine (M.Val (ref str))) :=
                          borrow α0 in
                        let* α2 : ltac:(refine (M.Val core.str.iter.Chars.t)) :=
                          str::["chars"] α1 in
                        let* α3 :
                            ltac:(refine
                              (M.Val
                                (core.iter.adapters.map.Map.t
                                  core.str.iter.Chars.t
                                  type not implemented))) :=
                          (core.iter.traits.iterator.Iterator.map
                              (Self := core.str.iter.Chars.t)
                              (Trait := ltac:(refine _)))
                            α2
                            (let* α0 : ltac:(refine (M.Val u32.t)) :=
                              M.alloc 10 in
                            let* α1 :
                                ltac:(refine
                                  (M.Val (core.option.Option.t u32.t))) :=
                              char.t::["to_digit"] c α0 in
                            let* α2 : ltac:(refine (M.Val str)) :=
                              deref (mk_str "should be a digit") in
                            let* α3 : ltac:(refine (M.Val (ref str))) :=
                              borrow α2 in
                            (core.option.Option.t u32.t)::["expect"] α1 α3) in
                        (core.iter.traits.iterator.Iterator.sum
                            (Self :=
                              core.iter.adapters.map.Map.t
                                core.str.iter.Chars.t
                                type not implemented)
                            (Trait := ltac:(refine _)))
                          α3 in
                      let* _ : ltac:(refine (M.Val unit)) :=
                        let* _ : ltac:(refine (M.Val unit)) :=
                          let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
                            M.alloc
                              [
                                mk_str "processed segment ";
                                mk_str ", result=";
                                mk_str "
"
                              ] in
                          let* α1 :
                              ltac:(refine (M.Val (ref (array (ref str))))) :=
                            borrow α0 in
                          let* α2 :
                              ltac:(refine (M.Val (ref (slice (ref str))))) :=
                            pointer_coercion "Unsize" α1 in
                          let* α3 : ltac:(refine (M.Val (ref usize.t))) :=
                            borrow i in
                          let* α4 :
                              ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
                            core.fmt.rt.Argument.t::["new_display"] α3 in
                          let* α5 : ltac:(refine (M.Val (ref u32.t))) :=
                            borrow result in
                          let* α6 :
                              ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
                            core.fmt.rt.Argument.t::["new_display"] α5 in
                          let* α7 :
                              ltac:(refine
                                (M.Val (array core.fmt.rt.Argument.t))) :=
                            M.alloc [ α4; α6 ] in
                          let* α8 :
                              ltac:(refine
                                (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
                            borrow α7 in
                          let* α9 :
                              ltac:(refine
                                (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
                            pointer_coercion "Unsize" α8 in
                          let* α10 :
                              ltac:(refine (M.Val core.fmt.Arguments.t)) :=
                            core.fmt.Arguments.t::["new_v1"] α2 α9 in
                          std.io.stdio._print α10 in
                        M.alloc tt in
                      M.pure result) in
                  (alloc.vec.Vec.t
                        (std.thread.JoinHandle.t u32.t)
                        alloc.alloc.Global.t)::["push"]
                    α0
                    α1 in
                M.alloc tt
              end in
            M.alloc tt)
        end in
      use α3 in
    let* final_result : ltac:(refine (M.Val u32.t)) :=
      let* α0 :
          ltac:(refine
            (M.Val
              (alloc.vec.into_iter.IntoIter.t
                (std.thread.JoinHandle.t u32.t)
                alloc.alloc.Global.t))) :=
        (core.iter.traits.collect.IntoIterator.into_iter
            (Self :=
              alloc.vec.Vec.t
                (std.thread.JoinHandle.t u32.t)
                alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          children in
      let* α1 :
          ltac:(refine
            (M.Val
              (core.iter.adapters.map.Map.t
                (alloc.vec.into_iter.IntoIter.t
                  (std.thread.JoinHandle.t u32.t)
                  alloc.alloc.Global.t)
                type not implemented))) :=
        (core.iter.traits.iterator.Iterator.map
            (Self :=
              alloc.vec.into_iter.IntoIter.t
                (std.thread.JoinHandle.t u32.t)
                alloc.alloc.Global.t)
            (Trait := ltac:(refine _)))
          α0
          (let* α0 :
              ltac:(refine
                (M.Val
                  (core.result.Result.t
                    u32.t
                    (alloc.boxed.Box.t
                      type not implemented
                      alloc.alloc.Global.t)))) :=
            (std.thread.JoinHandle.t u32.t)::["join"] c in
          (core.result.Result.t
                u32.t
                (alloc.boxed.Box.t
                  type not implemented
                  alloc.alloc.Global.t))::["unwrap"]
            α0) in
      (core.iter.traits.iterator.Iterator.sum
          (Self :=
            core.iter.adapters.map.Map.t
              (alloc.vec.into_iter.IntoIter.t
                (std.thread.JoinHandle.t u32.t)
                alloc.alloc.Global.t)
              type not implemented)
          (Trait := ltac:(refine _)))
        α1 in
    let* _ : ltac:(refine (M.Val unit)) :=
      let* _ : ltac:(refine (M.Val unit)) :=
        let* α0 : ltac:(refine (M.Val (array (ref str)))) :=
          M.alloc [ mk_str "Final sum result: "; mk_str "
" ] in
        let* α1 : ltac:(refine (M.Val (ref (array (ref str))))) := borrow α0 in
        let* α2 : ltac:(refine (M.Val (ref (slice (ref str))))) :=
          pointer_coercion "Unsize" α1 in
        let* α3 : ltac:(refine (M.Val (ref u32.t))) := borrow final_result in
        let* α4 : ltac:(refine (M.Val core.fmt.rt.Argument.t)) :=
          core.fmt.rt.Argument.t::["new_display"] α3 in
        let* α5 : ltac:(refine (M.Val (array core.fmt.rt.Argument.t))) :=
          M.alloc [ α4 ] in
        let* α6 : ltac:(refine (M.Val (ref (array core.fmt.rt.Argument.t)))) :=
          borrow α5 in
        let* α7 : ltac:(refine (M.Val (ref (slice core.fmt.rt.Argument.t)))) :=
          pointer_coercion "Unsize" α6 in
        let* α8 : ltac:(refine (M.Val core.fmt.Arguments.t)) :=
          core.fmt.Arguments.t::["new_v1"] α2 α7 in
        std.io.stdio._print α8 in
      M.alloc tt in
    M.alloc tt).
