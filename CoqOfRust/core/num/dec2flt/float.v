(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module num.
  Module dec2flt.
    Module float.
      (* Trait *)
      (* Empty module 'RawFloat' *)
      
      Module Impl_core_num_dec2flt_float_RawFloat_for_f32.
        Definition Self : Ty.t := Ty.path "f32".
        
        (*     const INFINITY: Self = f32::INFINITY; *)
        (* Ty.path "f32" *)
        Definition value_INFINITY : Value.t :=
          M.run ltac:(M.monadic (M.get_constant (| "core::f32::INFINITY" |))).
        
        (*     const NEG_INFINITY: Self = f32::NEG_INFINITY; *)
        (* Ty.path "f32" *)
        Definition value_NEG_INFINITY : Value.t :=
          M.run ltac:(M.monadic (M.get_constant (| "core::f32::NEG_INFINITY" |))).
        
        (*     const NAN: Self = f32::NAN; *)
        (* Ty.path "f32" *)
        Definition value_NAN : Value.t :=
          M.run ltac:(M.monadic (M.get_constant (| "core::f32::NAN" |))).
        
        (*     const NEG_NAN: Self = -f32::NAN; *)
        (* Ty.path "f32" *)
        Definition value_NEG_NAN : Value.t :=
          M.run
            ltac:(M.monadic
              (M.alloc (|
                UnOp.Panic.neg (|
                  Integer.Usize,
                  M.read (| M.get_constant (| "core::f32::NAN" |) |)
                |)
              |))).
        
        (*     const MANTISSA_EXPLICIT_BITS: usize = 23; *)
        (* Ty.path "usize" *)
        Definition value_MANTISSA_EXPLICIT_BITS : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer 23 |))).
        
        (*     const MIN_EXPONENT_ROUND_TO_EVEN: i32 = -17; *)
        (* Ty.path "i32" *)
        Definition value_MIN_EXPONENT_ROUND_TO_EVEN : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer (-17) |))).
        
        (*     const MAX_EXPONENT_ROUND_TO_EVEN: i32 = 10; *)
        (* Ty.path "i32" *)
        Definition value_MAX_EXPONENT_ROUND_TO_EVEN : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer 10 |))).
        
        (*     const MIN_EXPONENT_FAST_PATH: i64 = -10; *)
        (* Ty.path "i64" *)
        Definition value_MIN_EXPONENT_FAST_PATH : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer (-10) |))).
        
        (*     const MAX_EXPONENT_FAST_PATH: i64 = 10; *)
        (* Ty.path "i64" *)
        Definition value_MAX_EXPONENT_FAST_PATH : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer 10 |))).
        
        (*     const MAX_EXPONENT_DISGUISED_FAST_PATH: i64 = 17; *)
        (* Ty.path "i64" *)
        Definition value_MAX_EXPONENT_DISGUISED_FAST_PATH : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer 17 |))).
        
        (*     const MINIMUM_EXPONENT: i32 = -127; *)
        (* Ty.path "i32" *)
        Definition value_MINIMUM_EXPONENT : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer (-127) |))).
        
        (*     const INFINITE_POWER: i32 = 0xFF; *)
        (* Ty.path "i32" *)
        Definition value_INFINITE_POWER : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer 255 |))).
        
        (*     const SIGN_INDEX: usize = 31; *)
        (* Ty.path "usize" *)
        Definition value_SIGN_INDEX : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer 31 |))).
        
        (*     const SMALLEST_POWER_OF_TEN: i32 = -65; *)
        (* Ty.path "i32" *)
        Definition value_SMALLEST_POWER_OF_TEN : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer (-65) |))).
        
        (*     const LARGEST_POWER_OF_TEN: i32 = 38; *)
        (* Ty.path "i32" *)
        Definition value_LARGEST_POWER_OF_TEN : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer 38 |))).
        
        (*
            fn from_u64(v: u64) -> Self {
                debug_assert!(v <= Self::MAX_MANTISSA_FAST_PATH);
                v as _
            }
        *)
        Definition from_u64 (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ v ] =>
            ltac:(M.monadic
              (let v := M.alloc (| v |) in
              M.read (|
                let~ _ :=
                  M.match_operator (|
                    M.alloc (| Value.Tuple [] |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ := M.use (M.alloc (| Value.Bool true |)) in
                          let _ :=
                            M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                          let~ _ :=
                            M.match_operator (|
                              M.alloc (| Value.Tuple [] |),
                              [
                                fun γ =>
                                  ltac:(M.monadic
                                    (let γ :=
                                      M.use
                                        (M.alloc (|
                                          UnOp.Pure.not
                                            (BinOp.Pure.le
                                              (M.read (| v |))
                                              (M.read (|
                                                M.get_constant (|
                                                  "core::num::dec2flt::float::RawFloat::MAX_MANTISSA_FAST_PATH"
                                                |)
                                              |)))
                                        |)) in
                                    let _ :=
                                      M.is_constant_or_break_match (|
                                        M.read (| γ |),
                                        Value.Bool true
                                      |) in
                                    M.alloc (|
                                      M.never_to_any (|
                                        M.call_closure (|
                                          M.get_function (| "core::panicking::panic", [] |),
                                          [
                                            M.read (|
                                              Value.String
                                                "assertion failed: v <= Self::MAX_MANTISSA_FAST_PATH"
                                            |)
                                          ]
                                        |)
                                      |)
                                    |)));
                                fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                              ]
                            |) in
                          M.alloc (| Value.Tuple [] |)));
                      fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                    ]
                  |) in
                M.alloc (| M.rust_cast (M.read (| v |)) |)
              |)))
          | _, _ => M.impossible
          end.
        
        (*
            fn from_u64_bits(v: u64) -> Self {
                f32::from_bits((v & 0xFFFFFFFF) as u32)
            }
        *)
        Definition from_u64_bits (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ v ] =>
            ltac:(M.monadic
              (let v := M.alloc (| v |) in
              M.call_closure (|
                M.get_associated_function (| Ty.path "f32", "from_bits", [] |),
                [ M.rust_cast (BinOp.Pure.bit_and (M.read (| v |)) (Value.Integer 4294967295)) ]
              |)))
          | _, _ => M.impossible
          end.
        
        (*
            fn pow10_fast_path(exponent: usize) -> Self {
                #[allow(clippy::use_self)]
                const TABLE: [f32; 16] =
                    [1e0, 1e1, 1e2, 1e3, 1e4, 1e5, 1e6, 1e7, 1e8, 1e9, 1e10, 0., 0., 0., 0., 0.];
                TABLE[exponent & 15]
            }
        *)
        Definition pow10_fast_path (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ exponent ] =>
            ltac:(M.monadic
              (let exponent := M.alloc (| exponent |) in
              M.read (|
                M.SubPointer.get_array_field (|
                  M.get_constant (| "core::num::dec2flt::float::pow10_fast_path::TABLE" |),
                  M.alloc (| BinOp.Pure.bit_and (M.read (| exponent |)) (Value.Integer 15) |)
                |)
              |)))
          | _, _ => M.impossible
          end.
        
        (*
            fn integer_decode(self) -> (u64, i16, i8) {
                let bits = self.to_bits();
                let sign: i8 = if bits >> 31 == 0 { 1 } else { -1 };
                let mut exponent: i16 = ((bits >> 23) & 0xff) as i16;
                let mantissa =
                    if exponent == 0 { (bits & 0x7fffff) << 1 } else { (bits & 0x7fffff) | 0x800000 };
                // Exponent bias + mantissa shift
                exponent -= 127 + 23;
                (mantissa as u64, exponent, sign)
            }
        *)
        Definition integer_decode (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.read (|
                let~ bits :=
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (| Ty.path "f32", "to_bits", [] |),
                      [ M.read (| self |) ]
                    |)
                  |) in
                let~ sign :=
                  M.copy (|
                    M.match_operator (|
                      M.alloc (| Value.Tuple [] |),
                      [
                        fun γ =>
                          ltac:(M.monadic
                            (let γ :=
                              M.use
                                (M.alloc (|
                                  BinOp.Pure.eq
                                    (BinOp.Wrap.shr (M.read (| bits |)) (Value.Integer 31))
                                    (Value.Integer 0)
                                |)) in
                            let _ :=
                              M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                            M.alloc (| Value.Integer 1 |)));
                        fun γ => ltac:(M.monadic (M.alloc (| Value.Integer (-1) |)))
                      ]
                    |)
                  |) in
                let~ exponent :=
                  M.alloc (|
                    M.rust_cast
                      (BinOp.Pure.bit_and
                        (BinOp.Wrap.shr (M.read (| bits |)) (Value.Integer 23))
                        (Value.Integer 255))
                  |) in
                let~ mantissa :=
                  M.copy (|
                    M.match_operator (|
                      M.alloc (| Value.Tuple [] |),
                      [
                        fun γ =>
                          ltac:(M.monadic
                            (let γ :=
                              M.use
                                (M.alloc (|
                                  BinOp.Pure.eq (M.read (| exponent |)) (Value.Integer 0)
                                |)) in
                            let _ :=
                              M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                            M.alloc (|
                              BinOp.Wrap.shl
                                (BinOp.Pure.bit_and (M.read (| bits |)) (Value.Integer 8388607))
                                (Value.Integer 1)
                            |)));
                        fun γ =>
                          ltac:(M.monadic
                            (M.alloc (|
                              BinOp.Pure.bit_or
                                (BinOp.Pure.bit_and (M.read (| bits |)) (Value.Integer 8388607))
                                (Value.Integer 8388608)
                            |)))
                      ]
                    |)
                  |) in
                let~ _ :=
                  let β := exponent in
                  M.write (|
                    β,
                    BinOp.Wrap.sub
                      Integer.I16
                      (M.read (| β |))
                      (BinOp.Wrap.add Integer.I16 (Value.Integer 127) (Value.Integer 23))
                  |) in
                M.alloc (|
                  Value.Tuple
                    [ M.rust_cast (M.read (| mantissa |)); M.read (| exponent |); M.read (| sign |)
                    ]
                |)
              |)))
          | _, _ => M.impossible
          end.
        
        (*
            fn classify(self) -> FpCategory {
                self.classify()
            }
        *)
        Definition classify (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.call_closure (|
                M.get_associated_function (| Ty.path "f32", "classify", [] |),
                [ M.read (| self |) ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::num::dec2flt::float::RawFloat"
            Self
            (* Trait polymorphic types *) []
            (* Instance *)
            [
              ("value_INFINITY", InstanceField.Constant value_INFINITY);
              ("value_NEG_INFINITY", InstanceField.Constant value_NEG_INFINITY);
              ("value_NAN", InstanceField.Constant value_NAN);
              ("value_NEG_NAN", InstanceField.Constant value_NEG_NAN);
              ("value_MANTISSA_EXPLICIT_BITS", InstanceField.Constant value_MANTISSA_EXPLICIT_BITS);
              ("value_MIN_EXPONENT_ROUND_TO_EVEN",
                InstanceField.Constant value_MIN_EXPONENT_ROUND_TO_EVEN);
              ("value_MAX_EXPONENT_ROUND_TO_EVEN",
                InstanceField.Constant value_MAX_EXPONENT_ROUND_TO_EVEN);
              ("value_MIN_EXPONENT_FAST_PATH", InstanceField.Constant value_MIN_EXPONENT_FAST_PATH);
              ("value_MAX_EXPONENT_FAST_PATH", InstanceField.Constant value_MAX_EXPONENT_FAST_PATH);
              ("value_MAX_EXPONENT_DISGUISED_FAST_PATH",
                InstanceField.Constant value_MAX_EXPONENT_DISGUISED_FAST_PATH);
              ("value_MINIMUM_EXPONENT", InstanceField.Constant value_MINIMUM_EXPONENT);
              ("value_INFINITE_POWER", InstanceField.Constant value_INFINITE_POWER);
              ("value_SIGN_INDEX", InstanceField.Constant value_SIGN_INDEX);
              ("value_SMALLEST_POWER_OF_TEN", InstanceField.Constant value_SMALLEST_POWER_OF_TEN);
              ("value_LARGEST_POWER_OF_TEN", InstanceField.Constant value_LARGEST_POWER_OF_TEN);
              ("from_u64", InstanceField.Method from_u64);
              ("from_u64_bits", InstanceField.Method from_u64_bits);
              ("pow10_fast_path", InstanceField.Method pow10_fast_path);
              ("integer_decode", InstanceField.Method integer_decode);
              ("classify", InstanceField.Method classify)
            ].
      End Impl_core_num_dec2flt_float_RawFloat_for_f32.
      
      Module Impl_core_num_dec2flt_float_RawFloat_for_f64.
        Definition Self : Ty.t := Ty.path "f64".
        
        (*     const INFINITY: Self = f64::INFINITY; *)
        (* Ty.path "f64" *)
        Definition value_INFINITY : Value.t :=
          M.run ltac:(M.monadic (M.get_constant (| "core::f64::INFINITY" |))).
        
        (*     const NEG_INFINITY: Self = f64::NEG_INFINITY; *)
        (* Ty.path "f64" *)
        Definition value_NEG_INFINITY : Value.t :=
          M.run ltac:(M.monadic (M.get_constant (| "core::f64::NEG_INFINITY" |))).
        
        (*     const NAN: Self = f64::NAN; *)
        (* Ty.path "f64" *)
        Definition value_NAN : Value.t :=
          M.run ltac:(M.monadic (M.get_constant (| "core::f64::NAN" |))).
        
        (*     const NEG_NAN: Self = -f64::NAN; *)
        (* Ty.path "f64" *)
        Definition value_NEG_NAN : Value.t :=
          M.run
            ltac:(M.monadic
              (M.alloc (|
                UnOp.Panic.neg (|
                  Integer.Usize,
                  M.read (| M.get_constant (| "core::f64::NAN" |) |)
                |)
              |))).
        
        (*     const MANTISSA_EXPLICIT_BITS: usize = 52; *)
        (* Ty.path "usize" *)
        Definition value_MANTISSA_EXPLICIT_BITS : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer 52 |))).
        
        (*     const MIN_EXPONENT_ROUND_TO_EVEN: i32 = -4; *)
        (* Ty.path "i32" *)
        Definition value_MIN_EXPONENT_ROUND_TO_EVEN : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer (-4) |))).
        
        (*     const MAX_EXPONENT_ROUND_TO_EVEN: i32 = 23; *)
        (* Ty.path "i32" *)
        Definition value_MAX_EXPONENT_ROUND_TO_EVEN : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer 23 |))).
        
        (*     const MIN_EXPONENT_FAST_PATH: i64 = -22; *)
        (* Ty.path "i64" *)
        Definition value_MIN_EXPONENT_FAST_PATH : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer (-22) |))).
        
        (*     const MAX_EXPONENT_FAST_PATH: i64 = 22; *)
        (* Ty.path "i64" *)
        Definition value_MAX_EXPONENT_FAST_PATH : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer 22 |))).
        
        (*     const MAX_EXPONENT_DISGUISED_FAST_PATH: i64 = 37; *)
        (* Ty.path "i64" *)
        Definition value_MAX_EXPONENT_DISGUISED_FAST_PATH : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer 37 |))).
        
        (*     const MINIMUM_EXPONENT: i32 = -1023; *)
        (* Ty.path "i32" *)
        Definition value_MINIMUM_EXPONENT : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer (-1023) |))).
        
        (*     const INFINITE_POWER: i32 = 0x7FF; *)
        (* Ty.path "i32" *)
        Definition value_INFINITE_POWER : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer 2047 |))).
        
        (*     const SIGN_INDEX: usize = 63; *)
        (* Ty.path "usize" *)
        Definition value_SIGN_INDEX : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer 63 |))).
        
        (*     const SMALLEST_POWER_OF_TEN: i32 = -342; *)
        (* Ty.path "i32" *)
        Definition value_SMALLEST_POWER_OF_TEN : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer (-342) |))).
        
        (*     const LARGEST_POWER_OF_TEN: i32 = 308; *)
        (* Ty.path "i32" *)
        Definition value_LARGEST_POWER_OF_TEN : Value.t :=
          M.run ltac:(M.monadic (M.alloc (| Value.Integer 308 |))).
        
        (*
            fn from_u64(v: u64) -> Self {
                debug_assert!(v <= Self::MAX_MANTISSA_FAST_PATH);
                v as _
            }
        *)
        Definition from_u64 (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ v ] =>
            ltac:(M.monadic
              (let v := M.alloc (| v |) in
              M.read (|
                let~ _ :=
                  M.match_operator (|
                    M.alloc (| Value.Tuple [] |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ := M.use (M.alloc (| Value.Bool true |)) in
                          let _ :=
                            M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                          let~ _ :=
                            M.match_operator (|
                              M.alloc (| Value.Tuple [] |),
                              [
                                fun γ =>
                                  ltac:(M.monadic
                                    (let γ :=
                                      M.use
                                        (M.alloc (|
                                          UnOp.Pure.not
                                            (BinOp.Pure.le
                                              (M.read (| v |))
                                              (M.read (|
                                                M.get_constant (|
                                                  "core::num::dec2flt::float::RawFloat::MAX_MANTISSA_FAST_PATH"
                                                |)
                                              |)))
                                        |)) in
                                    let _ :=
                                      M.is_constant_or_break_match (|
                                        M.read (| γ |),
                                        Value.Bool true
                                      |) in
                                    M.alloc (|
                                      M.never_to_any (|
                                        M.call_closure (|
                                          M.get_function (| "core::panicking::panic", [] |),
                                          [
                                            M.read (|
                                              Value.String
                                                "assertion failed: v <= Self::MAX_MANTISSA_FAST_PATH"
                                            |)
                                          ]
                                        |)
                                      |)
                                    |)));
                                fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                              ]
                            |) in
                          M.alloc (| Value.Tuple [] |)));
                      fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                    ]
                  |) in
                M.alloc (| M.rust_cast (M.read (| v |)) |)
              |)))
          | _, _ => M.impossible
          end.
        
        (*
            fn from_u64_bits(v: u64) -> Self {
                f64::from_bits(v)
            }
        *)
        Definition from_u64_bits (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ v ] =>
            ltac:(M.monadic
              (let v := M.alloc (| v |) in
              M.call_closure (|
                M.get_associated_function (| Ty.path "f64", "from_bits", [] |),
                [ M.read (| v |) ]
              |)))
          | _, _ => M.impossible
          end.
        
        (*
            fn pow10_fast_path(exponent: usize) -> Self {
                const TABLE: [f64; 32] = [
                    1e0, 1e1, 1e2, 1e3, 1e4, 1e5, 1e6, 1e7, 1e8, 1e9, 1e10, 1e11, 1e12, 1e13, 1e14, 1e15,
                    1e16, 1e17, 1e18, 1e19, 1e20, 1e21, 1e22, 0., 0., 0., 0., 0., 0., 0., 0., 0.,
                ];
                TABLE[exponent & 31]
            }
        *)
        Definition pow10_fast_path (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ exponent ] =>
            ltac:(M.monadic
              (let exponent := M.alloc (| exponent |) in
              M.read (|
                M.SubPointer.get_array_field (|
                  M.get_constant (| "core::num::dec2flt::float::pow10_fast_path::TABLE" |),
                  M.alloc (| BinOp.Pure.bit_and (M.read (| exponent |)) (Value.Integer 31) |)
                |)
              |)))
          | _, _ => M.impossible
          end.
        
        (*
            fn integer_decode(self) -> (u64, i16, i8) {
                let bits = self.to_bits();
                let sign: i8 = if bits >> 63 == 0 { 1 } else { -1 };
                let mut exponent: i16 = ((bits >> 52) & 0x7ff) as i16;
                let mantissa = if exponent == 0 {
                    (bits & 0xfffffffffffff) << 1
                } else {
                    (bits & 0xfffffffffffff) | 0x10000000000000
                };
                // Exponent bias + mantissa shift
                exponent -= 1023 + 52;
                (mantissa, exponent, sign)
            }
        *)
        Definition integer_decode (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.read (|
                let~ bits :=
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (| Ty.path "f64", "to_bits", [] |),
                      [ M.read (| self |) ]
                    |)
                  |) in
                let~ sign :=
                  M.copy (|
                    M.match_operator (|
                      M.alloc (| Value.Tuple [] |),
                      [
                        fun γ =>
                          ltac:(M.monadic
                            (let γ :=
                              M.use
                                (M.alloc (|
                                  BinOp.Pure.eq
                                    (BinOp.Wrap.shr (M.read (| bits |)) (Value.Integer 63))
                                    (Value.Integer 0)
                                |)) in
                            let _ :=
                              M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                            M.alloc (| Value.Integer 1 |)));
                        fun γ => ltac:(M.monadic (M.alloc (| Value.Integer (-1) |)))
                      ]
                    |)
                  |) in
                let~ exponent :=
                  M.alloc (|
                    M.rust_cast
                      (BinOp.Pure.bit_and
                        (BinOp.Wrap.shr (M.read (| bits |)) (Value.Integer 52))
                        (Value.Integer 2047))
                  |) in
                let~ mantissa :=
                  M.copy (|
                    M.match_operator (|
                      M.alloc (| Value.Tuple [] |),
                      [
                        fun γ =>
                          ltac:(M.monadic
                            (let γ :=
                              M.use
                                (M.alloc (|
                                  BinOp.Pure.eq (M.read (| exponent |)) (Value.Integer 0)
                                |)) in
                            let _ :=
                              M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                            M.alloc (|
                              BinOp.Wrap.shl
                                (BinOp.Pure.bit_and
                                  (M.read (| bits |))
                                  (Value.Integer 4503599627370495))
                                (Value.Integer 1)
                            |)));
                        fun γ =>
                          ltac:(M.monadic
                            (M.alloc (|
                              BinOp.Pure.bit_or
                                (BinOp.Pure.bit_and
                                  (M.read (| bits |))
                                  (Value.Integer 4503599627370495))
                                (Value.Integer 4503599627370496)
                            |)))
                      ]
                    |)
                  |) in
                let~ _ :=
                  let β := exponent in
                  M.write (|
                    β,
                    BinOp.Wrap.sub
                      Integer.I16
                      (M.read (| β |))
                      (BinOp.Wrap.add Integer.I16 (Value.Integer 1023) (Value.Integer 52))
                  |) in
                M.alloc (|
                  Value.Tuple [ M.read (| mantissa |); M.read (| exponent |); M.read (| sign |) ]
                |)
              |)))
          | _, _ => M.impossible
          end.
        
        (*
            fn classify(self) -> FpCategory {
                self.classify()
            }
        *)
        Definition classify (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.call_closure (|
                M.get_associated_function (| Ty.path "f64", "classify", [] |),
                [ M.read (| self |) ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::num::dec2flt::float::RawFloat"
            Self
            (* Trait polymorphic types *) []
            (* Instance *)
            [
              ("value_INFINITY", InstanceField.Constant value_INFINITY);
              ("value_NEG_INFINITY", InstanceField.Constant value_NEG_INFINITY);
              ("value_NAN", InstanceField.Constant value_NAN);
              ("value_NEG_NAN", InstanceField.Constant value_NEG_NAN);
              ("value_MANTISSA_EXPLICIT_BITS", InstanceField.Constant value_MANTISSA_EXPLICIT_BITS);
              ("value_MIN_EXPONENT_ROUND_TO_EVEN",
                InstanceField.Constant value_MIN_EXPONENT_ROUND_TO_EVEN);
              ("value_MAX_EXPONENT_ROUND_TO_EVEN",
                InstanceField.Constant value_MAX_EXPONENT_ROUND_TO_EVEN);
              ("value_MIN_EXPONENT_FAST_PATH", InstanceField.Constant value_MIN_EXPONENT_FAST_PATH);
              ("value_MAX_EXPONENT_FAST_PATH", InstanceField.Constant value_MAX_EXPONENT_FAST_PATH);
              ("value_MAX_EXPONENT_DISGUISED_FAST_PATH",
                InstanceField.Constant value_MAX_EXPONENT_DISGUISED_FAST_PATH);
              ("value_MINIMUM_EXPONENT", InstanceField.Constant value_MINIMUM_EXPONENT);
              ("value_INFINITE_POWER", InstanceField.Constant value_INFINITE_POWER);
              ("value_SIGN_INDEX", InstanceField.Constant value_SIGN_INDEX);
              ("value_SMALLEST_POWER_OF_TEN", InstanceField.Constant value_SMALLEST_POWER_OF_TEN);
              ("value_LARGEST_POWER_OF_TEN", InstanceField.Constant value_LARGEST_POWER_OF_TEN);
              ("from_u64", InstanceField.Method from_u64);
              ("from_u64_bits", InstanceField.Method from_u64_bits);
              ("pow10_fast_path", InstanceField.Method pow10_fast_path);
              ("integer_decode", InstanceField.Method integer_decode);
              ("classify", InstanceField.Method classify)
            ].
      End Impl_core_num_dec2flt_float_RawFloat_for_f64.
    End float.
  End dec2flt.
End num.
