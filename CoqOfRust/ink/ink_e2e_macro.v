(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module codegen.
  Definition BUILD_ONCE `{H : State.Trait} : std.sync.once.Once :=
    run (std.sync.once.Once::["new"]).
  
  Definition
      ALREADY_BUILT_CONTRACTS
      `{H : State.Trait} :
      std.thread.local.LocalKey
        (core.cell.RefCell
          (std.collections.hash.map.HashMap
            alloc.string.String
            alloc.string.String)) :=
    run
      (std.thread.local.LocalKey::["new"]
        ink_e2e_macro.codegen.ALREADY_BUILT_CONTRACTS.__getit).
  
  Parameter already_built_contracts : forall `{H : State.Trait},
      M (H := H)
        (std.collections.hash.map.HashMap
          alloc.string.String
          alloc.string.String).
  
  Parameter set_already_built_contracts : forall `{H : State.Trait},
      std.collections.hash.map.HashMap
        alloc.string.String
        alloc.string.String ->
      M (H := H) unit.
  
  Module InkE2ETest.
    Unset Primitive Projections.
    Record t : Set := {
      test : ink_e2e_macro.ir.InkE2ETest;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_test : Notation.Dot "test" := {
      Notation.dot '(Build_t x0) := x0;
    }.
  End InkE2ETest.
  Definition InkE2ETest : Set := InkE2ETest.t.
  
  Module Impl_core_convert_From_for_ink_e2e_macro_codegen_InkE2ETest.
    Definition Self := ink_e2e_macro.codegen.InkE2ETest.
    
    Parameter from : forall `{H : State.Trait},
        ink_e2e_macro.ir.InkE2ETest ->
        M (H := H) ink_e2e_macro.codegen.InkE2ETest.
    
    Global Instance AssociatedFunction_from `{H : State.Trait} :
      Notation.DoubleColon Self "from" := {
      Notation.double_colon := from;
    }.
    
    Global Instance I :
        core.convert.From.Trait Self (T := ink_e2e_macro.ir.InkE2ETest) := {
      core.convert.From.from `{H : State.Trait} := from;
    }.
  End Impl_core_convert_From_for_ink_e2e_macro_codegen_InkE2ETest.
  
  Module Impl_ink_e2e_macro_codegen_InkE2ETest.
    Definition Self := ink_e2e_macro.codegen.InkE2ETest.
    
    Parameter generate_code : forall `{H : State.Trait},
        ref Self ->
        M (H := H) proc_macro2.TokenStream.
    
    Global Instance Method_generate_code `{H : State.Trait} :
      Notation.Dot "generate_code" := {
      Notation.dot := generate_code;
    }.
  End Impl_ink_e2e_macro_codegen_InkE2ETest.
  
  Module ContractManifests.
    Unset Primitive Projections.
    Record t : Set := {
      root_package : core.option.Option alloc.string.String;
      contract_dependencies : alloc.vec.Vec alloc.string.String;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_root_package : Notation.Dot "root_package" := {
      Notation.dot '(Build_t x0 _) := x0;
    }.
    Global Instance Get_contract_dependencies :
        Notation.Dot "contract_dependencies" := {
      Notation.dot '(Build_t _ x1) := x1;
    }.
  End ContractManifests.
  Definition ContractManifests : Set := ContractManifests.t.
  
  Module Impl_core_fmt_Debug_for_ink_e2e_macro_codegen_ContractManifests.
    Definition Self := ink_e2e_macro.codegen.ContractManifests.
    
    Parameter debug_struct_field2_finish : core.fmt.Formatter -> string -> 
      string -> core_option_Option_alloc_string_String -> 
      string -> alloc_vec_Vec_alloc_string_String -> 
      M (H := H) core.fmt.Result.
    
    Global Instance Deb_debug_struct_field2_finish : Notation.DoubleColon
      core.fmt.Formatter "debug_struct_field2_finish" := {
      Notation.double_colon := debug_struct_field2_finish; }.
    
    Parameter fmt : forall `{H : State.Trait},
        ref Self ->
        mut_ref core.fmt.Formatter ->
        M (H := H) core.fmt.Result.
    
    Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
      Notation.dot := fmt;
    }.
    
    Global Instance I : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt `{H : State.Trait} := fmt;
    }.
  End Impl_core_fmt_Debug_for_ink_e2e_macro_codegen_ContractManifests.
  
  Module Impl_ink_e2e_macro_codegen_ContractManifests.
    Definition Self := ink_e2e_macro.codegen.ContractManifests.
    
    Parameter from_cargo_metadata : forall `{H : State.Trait}, M (H := H) Self.
    
    Global Instance AssociatedFunction_from_cargo_metadata `{H : State.Trait} :
      Notation.DoubleColon Self "from_cargo_metadata" := {
      Notation.double_colon := from_cargo_metadata;
    }.
    
    Parameter all_contracts_to_build : forall `{H : State.Trait},
        ref Self ->
        M (H := H) (alloc.vec.Vec alloc.string.String).
    
    Global Instance Method_all_contracts_to_build `{H : State.Trait} :
      Notation.Dot "all_contracts_to_build" := {
      Notation.dot := all_contracts_to_build;
    }.
  End Impl_ink_e2e_macro_codegen_ContractManifests.
  
  Parameter build_contract : forall `{H : State.Trait},
      ref str ->
      M (H := H) alloc.string.String.
End codegen.

Definition BUILD_ONCE `{H : State.Trait} : std.sync.once.Once :=
  run (std.sync.once.Once::["new"]).

Definition
    ALREADY_BUILT_CONTRACTS
    `{H : State.Trait} :
    std.thread.local.LocalKey
      (core.cell.RefCell
        (std.collections.hash.map.HashMap
          alloc.string.String
          alloc.string.String)) :=
  run
    (std.thread.local.LocalKey::["new"]
      ink_e2e_macro.codegen.ALREADY_BUILT_CONTRACTS.__getit).

Parameter __init : forall `{H : State.Trait},
    M (H := H)
      (core.cell.RefCell
        (std.collections.hash.map.HashMap
          alloc.string.String
          alloc.string.String)).

Parameter __getit : forall `{H : State.Trait},
    core.option.Option
      (mut_ref
        (core.option.Option
          (core.cell.RefCell
            (std.collections.hash.map.HashMap
              alloc.string.String
              alloc.string.String)))) ->
    M (H := H)
      (core.option.Option
        (ref
          (core.cell.RefCell
            (std.collections.hash.map.HashMap
              alloc.string.String
              alloc.string.String)))).

Definition
    __KEY
    `{H : State.Trait} :
    std.sys.common.thread_local.fast_local.Key
      (core.cell.RefCell
        (std.collections.hash.map.HashMap
          alloc.string.String
          alloc.string.String)) :=
  run
    ((std.sys.common.thread_local.fast_local.Key
          (core.cell.RefCell
            (std.collections.hash.map.HashMap
              alloc.string.String
              alloc.string.String)))::["new"]).

Parameter already_built_contracts : forall `{H : State.Trait},
    M (H := H)
      (std.collections.hash.map.HashMap
        alloc.string.String
        alloc.string.String).

Parameter set_already_built_contracts : forall `{H : State.Trait},
    std.collections.hash.map.HashMap alloc.string.String alloc.string.String ->
    M (H := H) unit.

Module InkE2ETest.
  Unset Primitive Projections.
  Record t : Set := {
    test : ink_e2e_macro.ir.InkE2ETest;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_test : Notation.Dot "test" := {
    Notation.dot '(Build_t x0) := x0;
  }.
End InkE2ETest.
Definition InkE2ETest : Set := InkE2ETest.t.

Module Impl_core_convert_From_for_ink_e2e_macro_codegen_InkE2ETest.
  Definition Self := ink_e2e_macro.codegen.InkE2ETest.
  
  Parameter from : forall `{H : State.Trait},
      ink_e2e_macro.ir.InkE2ETest ->
      M (H := H) ink_e2e_macro.codegen.InkE2ETest.
  
  Global Instance AssociatedFunction_from `{H : State.Trait} :
    Notation.DoubleColon Self "from" := {
    Notation.double_colon := from;
  }.
  
  Global Instance I :
      core.convert.From.Trait Self (T := ink_e2e_macro.ir.InkE2ETest) := {
    core.convert.From.from `{H : State.Trait} := from;
  }.
End Impl_core_convert_From_for_ink_e2e_macro_codegen_InkE2ETest.

Module Impl_ink_e2e_macro_codegen_InkE2ETest_2.
  Definition Self := ink_e2e_macro.codegen.InkE2ETest.
  
  Parameter generate_code : forall `{H : State.Trait},
      ref Self ->
      M (H := H) proc_macro2.TokenStream.
  
  Global Instance Method_generate_code `{H : State.Trait} :
    Notation.Dot "generate_code" := {
    Notation.dot := generate_code;
  }.
End Impl_ink_e2e_macro_codegen_InkE2ETest_2.

Definition DEFAULT_CONTRACTS_NODE `{H : State.Trait} : ref str :=
  run (Pure "substrate-contracts-node").

Module ContractManifests.
  Unset Primitive Projections.
  Record t : Set := {
    root_package : core.option.Option alloc.string.String;
    contract_dependencies : alloc.vec.Vec alloc.string.String;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_root_package : Notation.Dot "root_package" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_contract_dependencies :
      Notation.Dot "contract_dependencies" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End ContractManifests.
Definition ContractManifests : Set := ContractManifests.t.

Module Impl_core_fmt_Debug_for_ink_e2e_macro_codegen_ContractManifests.
  Definition Self := ink_e2e_macro.codegen.ContractManifests.
  
  Parameter debug_struct_field2_finish : core.fmt.Formatter -> string -> 
    string -> core_option_Option_alloc_string_String -> 
    string -> alloc_vec_Vec_alloc_string_String -> 
    M (H := H) core.fmt.Result.
  
  Global Instance Deb_debug_struct_field2_finish : Notation.DoubleColon
    core.fmt.Formatter "debug_struct_field2_finish" := {
    Notation.double_colon := debug_struct_field2_finish; }.
  
  Parameter fmt : forall `{H : State.Trait},
      ref Self ->
      mut_ref core.fmt.Formatter ->
      M (H := H) core.fmt.Result.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_ink_e2e_macro_codegen_ContractManifests.

Module Impl_ink_e2e_macro_codegen_ContractManifests_2.
  Definition Self := ink_e2e_macro.codegen.ContractManifests.
  
  Parameter from_cargo_metadata : forall `{H : State.Trait}, M (H := H) Self.
  
  Global Instance AssociatedFunction_from_cargo_metadata `{H : State.Trait} :
    Notation.DoubleColon Self "from_cargo_metadata" := {
    Notation.double_colon := from_cargo_metadata;
  }.
  
  Parameter all_contracts_to_build : forall `{H : State.Trait},
      ref Self ->
      M (H := H) (alloc.vec.Vec alloc.string.String).
  
  Global Instance Method_all_contracts_to_build `{H : State.Trait} :
    Notation.Dot "all_contracts_to_build" := {
    Notation.dot := all_contracts_to_build;
  }.
End Impl_ink_e2e_macro_codegen_ContractManifests_2.

Parameter maybe_contract_package : forall `{H : State.Trait},
    ref cargo_metadata.Package ->
    M (H := H) (core.option.Option alloc.string.String).

Parameter build_contract : forall `{H : State.Trait},
    ref str ->
    M (H := H) alloc.string.String.

Module config.
  Module E2EConfig.
    Unset Primitive Projections.
    Record t : Set := {
      whitelisted_attributes : ink_ir.ir.utils.WhitelistedAttributes;
      additional_contracts : alloc.vec.Vec alloc.string.String;
      environment : core.option.Option syn.path.Path;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_whitelisted_attributes :
        Notation.Dot "whitelisted_attributes" := {
      Notation.dot '(Build_t x0 _ _) := x0;
    }.
    Global Instance Get_additional_contracts :
        Notation.Dot "additional_contracts" := {
      Notation.dot '(Build_t _ x1 _) := x1;
    }.
    Global Instance Get_environment : Notation.Dot "environment" := {
      Notation.dot '(Build_t _ _ x2) := x2;
    }.
  End E2EConfig.
  Definition E2EConfig : Set := E2EConfig.t.
  
  Module Impl_core_fmt_Debug_for_ink_e2e_macro_config_E2EConfig.
    Definition Self := ink_e2e_macro.config.E2EConfig.
    
    Parameter debug_struct_field3_finish : core.fmt.Formatter -> string -> 
      string -> ink_ir_ir_utils_WhitelistedAttributes -> 
      string -> alloc_vec_Vec_alloc_string_String -> 
      string -> core_option_Option_syn_path_Path -> 
      M (H := H) core.fmt.Result.
    
    Global Instance Deb_debug_struct_field3_finish : Notation.DoubleColon
      core.fmt.Formatter "debug_struct_field3_finish" := {
      Notation.double_colon := debug_struct_field3_finish; }.
    
    Parameter fmt : forall `{H : State.Trait},
        ref Self ->
        mut_ref core.fmt.Formatter ->
        M (H := H) core.fmt.Result.
    
    Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
      Notation.dot := fmt;
    }.
    
    Global Instance I : core.fmt.Debug.Trait Self := {
      core.fmt.Debug.fmt `{H : State.Trait} := fmt;
    }.
  End Impl_core_fmt_Debug_for_ink_e2e_macro_config_E2EConfig.
  
  Module Impl_core_default_Default_for_ink_e2e_macro_config_E2EConfig.
    Definition Self := ink_e2e_macro.config.E2EConfig.
    
    Parameter default : forall `{H : State.Trait},
        M (H := H) ink_e2e_macro.config.E2EConfig.
    
    Global Instance AssociatedFunction_default `{H : State.Trait} :
      Notation.DoubleColon Self "default" := {
      Notation.double_colon := default;
    }.
    
    Global Instance I : core.default.Default.Trait Self := {
      core.default.Default.default `{H : State.Trait} := default;
    }.
  End Impl_core_default_Default_for_ink_e2e_macro_config_E2EConfig.
  
  Module
    Impl_core_marker_StructuralPartialEq_for_ink_e2e_macro_config_E2EConfig.
    Definition Self := ink_e2e_macro.config.E2EConfig.
    
    Global Instance I : core.marker.StructuralPartialEq.Trait Self :=
      core.marker.StructuralPartialEq.Build_Trait _.
  End Impl_core_marker_StructuralPartialEq_for_ink_e2e_macro_config_E2EConfig.
  
  Module Impl_core_cmp_PartialEq_for_ink_e2e_macro_config_E2EConfig.
    Definition Self := ink_e2e_macro.config.E2EConfig.
    
    Parameter eq : forall `{H : State.Trait},
        ref Self ->
        ref ink_e2e_macro.config.E2EConfig ->
        M (H := H) bool.
    
    Global Instance Method_eq `{H : State.Trait} : Notation.Dot "eq" := {
      Notation.dot := eq;
    }.
    
    Global Instance I : core.cmp.PartialEq.Trait Self := {
      core.cmp.PartialEq.eq `{H : State.Trait} := eq;
    }.
  End Impl_core_cmp_PartialEq_for_ink_e2e_macro_config_E2EConfig.
  
  Module Impl_core_marker_StructuralEq_for_ink_e2e_macro_config_E2EConfig.
    Definition Self := ink_e2e_macro.config.E2EConfig.
    
    Global Instance I : core.marker.StructuralEq.Trait Self :=
      core.marker.StructuralEq.Build_Trait _.
  End Impl_core_marker_StructuralEq_for_ink_e2e_macro_config_E2EConfig.
  
  Module Impl_core_cmp_Eq_for_ink_e2e_macro_config_E2EConfig.
    Definition Self := ink_e2e_macro.config.E2EConfig.
    
    Parameter assert_receiver_is_total_eq : forall `{H : State.Trait},
        ref Self ->
        M (H := H) unit.
    
    Global Instance Method_assert_receiver_is_total_eq `{H : State.Trait} :
      Notation.Dot "assert_receiver_is_total_eq" := {
      Notation.dot := assert_receiver_is_total_eq;
    }.
    
    Global Instance I : core.cmp.Eq.Trait Self := {
    }.
  End Impl_core_cmp_Eq_for_ink_e2e_macro_config_E2EConfig.
  
  Module Impl_core_convert_TryFrom_for_ink_e2e_macro_config_E2EConfig.
    Definition Self := ink_e2e_macro.config.E2EConfig.
    
    Definition Error : Set := syn.error.Error.
    
    Parameter try_from : forall `{H : State.Trait},
        ink_ir.ast.attr_args.AttributeArgs ->
        M (H := H) (core.result.Result Self ImplSelf.Error).
    
    Global Instance AssociatedFunction_try_from `{H : State.Trait} :
      Notation.DoubleColon Self "try_from" := {
      Notation.double_colon := try_from;
    }.
    
    Global Instance I :
        core.convert.TryFrom.Trait
          Self
          (T := ink_ir.ast.attr_args.AttributeArgs) := {
      core.convert.TryFrom.try_from `{H : State.Trait} := try_from;
    }.
  End Impl_core_convert_TryFrom_for_ink_e2e_macro_config_E2EConfig.
  
  Module Impl_ink_e2e_macro_config_E2EConfig.
    Definition Self := ink_e2e_macro.config.E2EConfig.
    
    Parameter additional_contracts : forall `{H : State.Trait},
        ref Self ->
        M (H := H) (alloc.vec.Vec alloc.string.String).
    
    Global Instance Method_additional_contracts `{H : State.Trait} :
      Notation.Dot "additional_contracts" := {
      Notation.dot := additional_contracts;
    }.
    
    Parameter environment : forall `{H : State.Trait},
        ref Self ->
        M (H := H) (core.option.Option syn.path.Path).
    
    Global Instance Method_environment `{H : State.Trait} :
      Notation.Dot "environment" := {
      Notation.dot := environment;
    }.
  End Impl_ink_e2e_macro_config_E2EConfig.
End config.

Module E2EConfig.
  Unset Primitive Projections.
  Record t : Set := {
    whitelisted_attributes : ink_ir.ir.utils.WhitelistedAttributes;
    additional_contracts : alloc.vec.Vec alloc.string.String;
    environment : core.option.Option syn.path.Path;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_whitelisted_attributes :
      Notation.Dot "whitelisted_attributes" := {
    Notation.dot '(Build_t x0 _ _) := x0;
  }.
  Global Instance Get_additional_contracts :
      Notation.Dot "additional_contracts" := {
    Notation.dot '(Build_t _ x1 _) := x1;
  }.
  Global Instance Get_environment : Notation.Dot "environment" := {
    Notation.dot '(Build_t _ _ x2) := x2;
  }.
End E2EConfig.
Definition E2EConfig : Set := E2EConfig.t.

Module Impl_core_fmt_Debug_for_ink_e2e_macro_config_E2EConfig.
  Definition Self := ink_e2e_macro.config.E2EConfig.
  
  Parameter debug_struct_field3_finish : core.fmt.Formatter -> string -> 
    string -> ink_ir_ir_utils_WhitelistedAttributes -> 
    string -> alloc_vec_Vec_alloc_string_String -> 
    string -> core_option_Option_syn_path_Path -> 
    M (H := H) core.fmt.Result.
  
  Global Instance Deb_debug_struct_field3_finish : Notation.DoubleColon
    core.fmt.Formatter "debug_struct_field3_finish" := {
    Notation.double_colon := debug_struct_field3_finish; }.
  
  Parameter fmt : forall `{H : State.Trait},
      ref Self ->
      mut_ref core.fmt.Formatter ->
      M (H := H) core.fmt.Result.
  
  Global Instance Method_fmt `{H : State.Trait} : Notation.Dot "fmt" := {
    Notation.dot := fmt;
  }.
  
  Global Instance I : core.fmt.Debug.Trait Self := {
    core.fmt.Debug.fmt `{H : State.Trait} := fmt;
  }.
End Impl_core_fmt_Debug_for_ink_e2e_macro_config_E2EConfig.

Module Impl_core_default_Default_for_ink_e2e_macro_config_E2EConfig.
  Definition Self := ink_e2e_macro.config.E2EConfig.
  
  Parameter default : forall `{H : State.Trait},
      M (H := H) ink_e2e_macro.config.E2EConfig.
  
  Global Instance AssociatedFunction_default `{H : State.Trait} :
    Notation.DoubleColon Self "default" := {
    Notation.double_colon := default;
  }.
  
  Global Instance I : core.default.Default.Trait Self := {
    core.default.Default.default `{H : State.Trait} := default;
  }.
End Impl_core_default_Default_for_ink_e2e_macro_config_E2EConfig.

Module Impl_core_marker_StructuralPartialEq_for_ink_e2e_macro_config_E2EConfig.
  Definition Self := ink_e2e_macro.config.E2EConfig.
  
  Global Instance I : core.marker.StructuralPartialEq.Trait Self :=
    core.marker.StructuralPartialEq.Build_Trait _.
End Impl_core_marker_StructuralPartialEq_for_ink_e2e_macro_config_E2EConfig.

Module Impl_core_cmp_PartialEq_for_ink_e2e_macro_config_E2EConfig.
  Definition Self := ink_e2e_macro.config.E2EConfig.
  
  Parameter eq : forall `{H : State.Trait},
      ref Self ->
      ref ink_e2e_macro.config.E2EConfig ->
      M (H := H) bool.
  
  Global Instance Method_eq `{H : State.Trait} : Notation.Dot "eq" := {
    Notation.dot := eq;
  }.
  
  Global Instance I : core.cmp.PartialEq.Trait Self := {
    core.cmp.PartialEq.eq `{H : State.Trait} := eq;
  }.
End Impl_core_cmp_PartialEq_for_ink_e2e_macro_config_E2EConfig.

Module Impl_core_marker_StructuralEq_for_ink_e2e_macro_config_E2EConfig.
  Definition Self := ink_e2e_macro.config.E2EConfig.
  
  Global Instance I : core.marker.StructuralEq.Trait Self :=
    core.marker.StructuralEq.Build_Trait _.
End Impl_core_marker_StructuralEq_for_ink_e2e_macro_config_E2EConfig.

Module Impl_core_cmp_Eq_for_ink_e2e_macro_config_E2EConfig.
  Definition Self := ink_e2e_macro.config.E2EConfig.
  
  Parameter assert_receiver_is_total_eq : forall `{H : State.Trait},
      ref Self ->
      M (H := H) unit.
  
  Global Instance Method_assert_receiver_is_total_eq `{H : State.Trait} :
    Notation.Dot "assert_receiver_is_total_eq" := {
    Notation.dot := assert_receiver_is_total_eq;
  }.
  
  Global Instance I : core.cmp.Eq.Trait Self := {
  }.
End Impl_core_cmp_Eq_for_ink_e2e_macro_config_E2EConfig.

Module Impl_core_convert_TryFrom_for_ink_e2e_macro_config_E2EConfig.
  Definition Self := ink_e2e_macro.config.E2EConfig.
  
  Definition Error : Set := syn.error.Error.
  
  Parameter try_from : forall `{H : State.Trait},
      ink_ir.ast.attr_args.AttributeArgs ->
      M (H := H) (core.result.Result Self ImplSelf.Error).
  
  Global Instance AssociatedFunction_try_from `{H : State.Trait} :
    Notation.DoubleColon Self "try_from" := {
    Notation.double_colon := try_from;
  }.
  
  Global Instance I :
      core.convert.TryFrom.Trait
        Self
        (T := ink_ir.ast.attr_args.AttributeArgs) := {
    core.convert.TryFrom.try_from `{H : State.Trait} := try_from;
  }.
End Impl_core_convert_TryFrom_for_ink_e2e_macro_config_E2EConfig.

Module Impl_ink_e2e_macro_config_E2EConfig_2.
  Definition Self := ink_e2e_macro.config.E2EConfig.
  
  Parameter additional_contracts : forall `{H : State.Trait},
      ref Self ->
      M (H := H) (alloc.vec.Vec alloc.string.String).
  
  Global Instance Method_additional_contracts `{H : State.Trait} :
    Notation.Dot "additional_contracts" := {
    Notation.dot := additional_contracts;
  }.
  
  Parameter environment : forall `{H : State.Trait},
      ref Self ->
      M (H := H) (core.option.Option syn.path.Path).
  
  Global Instance Method_environment `{H : State.Trait} :
    Notation.Dot "environment" := {
    Notation.dot := environment;
  }.
End Impl_ink_e2e_macro_config_E2EConfig_2.

Module ir.
  Module InkE2ETest.
    Unset Primitive Projections.
    Record t : Set := {
      item_fn : ink_e2e_macro.ir.E2EFn;
      config : ink_e2e_macro.config.E2EConfig;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_item_fn : Notation.Dot "item_fn" := {
      Notation.dot '(Build_t x0 _) := x0;
    }.
    Global Instance Get_config : Notation.Dot "config" := {
      Notation.dot '(Build_t _ x1) := x1;
    }.
  End InkE2ETest.
  Definition InkE2ETest : Set := InkE2ETest.t.
  
  Module E2EFn.
    Unset Primitive Projections.
    Record t : Set := {
      item_fn : syn.item.ItemFn;
    }.
    Global Set Primitive Projections.
    
    Global Instance Get_item_fn : Notation.Dot "item_fn" := {
      Notation.dot '(Build_t x0) := x0;
    }.
  End E2EFn.
  Definition E2EFn : Set := E2EFn.t.
  
  Module Impl_core_convert_From_for_ink_e2e_macro_ir_E2EFn.
    Definition Self := ink_e2e_macro.ir.E2EFn.
    
    Parameter from : forall `{H : State.Trait},
        syn.item.ItemFn ->
        M (H := H) ink_e2e_macro.ir.E2EFn.
    
    Global Instance AssociatedFunction_from `{H : State.Trait} :
      Notation.DoubleColon Self "from" := {
      Notation.double_colon := from;
    }.
    
    Global Instance I : core.convert.From.Trait Self (T := syn.item.ItemFn) := {
      core.convert.From.from `{H : State.Trait} := from;
    }.
  End Impl_core_convert_From_for_ink_e2e_macro_ir_E2EFn.
  
  Module Impl_ink_e2e_macro_ir_InkE2ETest.
    Definition Self := ink_e2e_macro.ir.InkE2ETest.
    
    Parameter new : forall `{H : State.Trait},
        proc_macro2.TokenStream ->
        proc_macro2.TokenStream ->
        M (H := H) (core.result.Result Self syn.error.Error).
    
    Global Instance AssociatedFunction_new `{H : State.Trait} :
      Notation.DoubleColon Self "new" := {
      Notation.double_colon := new;
    }.
  End Impl_ink_e2e_macro_ir_InkE2ETest.
End ir.

Module InkE2ETest.
  Unset Primitive Projections.
  Record t : Set := {
    item_fn : ink_e2e_macro.ir.E2EFn;
    config : ink_e2e_macro.config.E2EConfig;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_item_fn : Notation.Dot "item_fn" := {
    Notation.dot '(Build_t x0 _) := x0;
  }.
  Global Instance Get_config : Notation.Dot "config" := {
    Notation.dot '(Build_t _ x1) := x1;
  }.
End InkE2ETest.
Definition InkE2ETest : Set := InkE2ETest.t.

Module E2EFn.
  Unset Primitive Projections.
  Record t : Set := {
    item_fn : syn.item.ItemFn;
  }.
  Global Set Primitive Projections.
  
  Global Instance Get_item_fn : Notation.Dot "item_fn" := {
    Notation.dot '(Build_t x0) := x0;
  }.
End E2EFn.
Definition E2EFn : Set := E2EFn.t.

Module Impl_core_convert_From_for_ink_e2e_macro_ir_E2EFn.
  Definition Self := ink_e2e_macro.ir.E2EFn.
  
  Parameter from : forall `{H : State.Trait},
      syn.item.ItemFn ->
      M (H := H) ink_e2e_macro.ir.E2EFn.
  
  Global Instance AssociatedFunction_from `{H : State.Trait} :
    Notation.DoubleColon Self "from" := {
    Notation.double_colon := from;
  }.
  
  Global Instance I : core.convert.From.Trait Self (T := syn.item.ItemFn) := {
    core.convert.From.from `{H : State.Trait} := from;
  }.
End Impl_core_convert_From_for_ink_e2e_macro_ir_E2EFn.

Module Impl_ink_e2e_macro_ir_InkE2ETest_2.
  Definition Self := ink_e2e_macro.ir.InkE2ETest.
  
  Parameter new : forall `{H : State.Trait},
      proc_macro2.TokenStream ->
      proc_macro2.TokenStream ->
      M (H := H) (core.result.Result Self syn.error.Error).
  
  Global Instance AssociatedFunction_new `{H : State.Trait} :
    Notation.DoubleColon Self "new" := {
    Notation.double_colon := new;
  }.
End Impl_ink_e2e_macro_ir_InkE2ETest_2.

Parameter test : forall `{H : State.Trait},
    proc_macro.TokenStream ->
    proc_macro.TokenStream ->
    M (H := H) proc_macro.TokenStream.

Parameter generate : forall `{H : State.Trait},
    proc_macro2.TokenStream ->
    proc_macro2.TokenStream ->
    M (H := H) proc_macro2.TokenStream.

Parameter generate_or_err : forall `{H : State.Trait},
    proc_macro2.TokenStream ->
    proc_macro2.TokenStream ->
    M (H := H) (syn.error.Result proc_macro2.TokenStream).

Definition
    _DECLS
    `{H : State.Trait} :
    ref (Slice proc_macro.bridge.client.ProcMacro) :=
  run
    (let* α0 :=
      proc_macro.bridge.client.ProcMacro::["attr"] "test" ink_e2e_macro.test in
    Pure (addr_of [ α0 ])).
