//
//  Generated code. Do not modify.
//  source: cat.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $7;
import 'google/protobuf/wrappers.pb.dart' as $3;

class OwnerInfo extends $pb.GeneratedMessage {
  factory OwnerInfo({
    $fixnum.Int64? id,
    $fixnum.Int64? userId,
    $core.Iterable<$fixnum.Int64>? catsIds,
    $core.Iterable<$fixnum.Int64>? rentedCatsIds,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    if (catsIds != null) {
      $result.catsIds.addAll(catsIds);
    }
    if (rentedCatsIds != null) {
      $result.rentedCatsIds.addAll(rentedCatsIds);
    }
    return $result;
  }
  OwnerInfo._() : super();
  factory OwnerInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OwnerInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OwnerInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'xplago'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..p<$fixnum.Int64>(3, _omitFieldNames ? '' : 'catsIds', $pb.PbFieldType.K6)
    ..p<$fixnum.Int64>(4, _omitFieldNames ? '' : 'rentedCatsIds', $pb.PbFieldType.K6)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OwnerInfo clone() => OwnerInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OwnerInfo copyWith(void Function(OwnerInfo) updates) => super.copyWith((message) => updates(message as OwnerInfo)) as OwnerInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OwnerInfo create() => OwnerInfo._();
  OwnerInfo createEmptyInstance() => create();
  static $pb.PbList<OwnerInfo> createRepeated() => $pb.PbList<OwnerInfo>();
  @$core.pragma('dart2js:noInline')
  static OwnerInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OwnerInfo>(create);
  static OwnerInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get userId => $_getI64(1);
  @$pb.TagNumber(2)
  set userId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$fixnum.Int64> get catsIds => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$fixnum.Int64> get rentedCatsIds => $_getList(3);
}

class CatInfo extends $pb.GeneratedMessage {
  factory CatInfo({
    $fixnum.Int64? id,
    $core.String? name,
    $7.Timestamp? birthday,
    $fixnum.Int64? ownerId,
    $3.Int64Value? tenantId,
    $core.String? avatarId,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (name != null) {
      $result.name = name;
    }
    if (birthday != null) {
      $result.birthday = birthday;
    }
    if (ownerId != null) {
      $result.ownerId = ownerId;
    }
    if (tenantId != null) {
      $result.tenantId = tenantId;
    }
    if (avatarId != null) {
      $result.avatarId = avatarId;
    }
    return $result;
  }
  CatInfo._() : super();
  factory CatInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CatInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CatInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'xplago'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOM<$7.Timestamp>(3, _omitFieldNames ? '' : 'birthday', subBuilder: $7.Timestamp.create)
    ..aInt64(4, _omitFieldNames ? '' : 'ownerId', protoName: 'ownerId')
    ..aOM<$3.Int64Value>(5, _omitFieldNames ? '' : 'tenantId', protoName: 'tenantId', subBuilder: $3.Int64Value.create)
    ..aOS(6, _omitFieldNames ? '' : 'avatarId', protoName: 'avatarId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CatInfo clone() => CatInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CatInfo copyWith(void Function(CatInfo) updates) => super.copyWith((message) => updates(message as CatInfo)) as CatInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CatInfo create() => CatInfo._();
  CatInfo createEmptyInstance() => create();
  static $pb.PbList<CatInfo> createRepeated() => $pb.PbList<CatInfo>();
  @$core.pragma('dart2js:noInline')
  static CatInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CatInfo>(create);
  static CatInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $7.Timestamp get birthday => $_getN(2);
  @$pb.TagNumber(3)
  set birthday($7.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasBirthday() => $_has(2);
  @$pb.TagNumber(3)
  void clearBirthday() => clearField(3);
  @$pb.TagNumber(3)
  $7.Timestamp ensureBirthday() => $_ensure(2);

  @$pb.TagNumber(4)
  $fixnum.Int64 get ownerId => $_getI64(3);
  @$pb.TagNumber(4)
  set ownerId($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOwnerId() => $_has(3);
  @$pb.TagNumber(4)
  void clearOwnerId() => clearField(4);

  @$pb.TagNumber(5)
  $3.Int64Value get tenantId => $_getN(4);
  @$pb.TagNumber(5)
  set tenantId($3.Int64Value v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasTenantId() => $_has(4);
  @$pb.TagNumber(5)
  void clearTenantId() => clearField(5);
  @$pb.TagNumber(5)
  $3.Int64Value ensureTenantId() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get avatarId => $_getSZ(5);
  @$pb.TagNumber(6)
  set avatarId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAvatarId() => $_has(5);
  @$pb.TagNumber(6)
  void clearAvatarId() => clearField(6);
}

class GetCatRequest extends $pb.GeneratedMessage {
  factory GetCatRequest({
    $fixnum.Int64? id,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  GetCatRequest._() : super();
  factory GetCatRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCatRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCatRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'xplago'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCatRequest clone() => GetCatRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCatRequest copyWith(void Function(GetCatRequest) updates) => super.copyWith((message) => updates(message as GetCatRequest)) as GetCatRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCatRequest create() => GetCatRequest._();
  GetCatRequest createEmptyInstance() => create();
  static $pb.PbList<GetCatRequest> createRepeated() => $pb.PbList<GetCatRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCatRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCatRequest>(create);
  static GetCatRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get id => $_getI64(0);
  @$pb.TagNumber(1)
  set id($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class CreateCatRequest extends $pb.GeneratedMessage {
  factory CreateCatRequest({
    $core.String? name,
    $7.Timestamp? birthday,
    $core.String? avatarId,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (birthday != null) {
      $result.birthday = birthday;
    }
    if (avatarId != null) {
      $result.avatarId = avatarId;
    }
    return $result;
  }
  CreateCatRequest._() : super();
  factory CreateCatRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateCatRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateCatRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'xplago'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOM<$7.Timestamp>(2, _omitFieldNames ? '' : 'birthday', subBuilder: $7.Timestamp.create)
    ..aOS(3, _omitFieldNames ? '' : 'avatarId', protoName: 'avatarId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateCatRequest clone() => CreateCatRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateCatRequest copyWith(void Function(CreateCatRequest) updates) => super.copyWith((message) => updates(message as CreateCatRequest)) as CreateCatRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCatRequest create() => CreateCatRequest._();
  CreateCatRequest createEmptyInstance() => create();
  static $pb.PbList<CreateCatRequest> createRepeated() => $pb.PbList<CreateCatRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateCatRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateCatRequest>(create);
  static CreateCatRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $7.Timestamp get birthday => $_getN(1);
  @$pb.TagNumber(2)
  set birthday($7.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasBirthday() => $_has(1);
  @$pb.TagNumber(2)
  void clearBirthday() => clearField(2);
  @$pb.TagNumber(2)
  $7.Timestamp ensureBirthday() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get avatarId => $_getSZ(2);
  @$pb.TagNumber(3)
  set avatarId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAvatarId() => $_has(2);
  @$pb.TagNumber(3)
  void clearAvatarId() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
