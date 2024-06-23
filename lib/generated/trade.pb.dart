//
//  Generated code. Do not modify.
//  source: trade.proto
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
import 'payment.pb.dart' as $4;

class CreateSaleOfferRequest extends $pb.GeneratedMessage {
  factory CreateSaleOfferRequest({
    $fixnum.Int64? catId,
    $4.Money? price,
    $core.String? comment,
  }) {
    final $result = create();
    if (catId != null) {
      $result.catId = catId;
    }
    if (price != null) {
      $result.price = price;
    }
    if (comment != null) {
      $result.comment = comment;
    }
    return $result;
  }
  CreateSaleOfferRequest._() : super();
  factory CreateSaleOfferRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSaleOfferRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSaleOfferRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'xplago'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'catId', protoName: 'catId')
    ..aOM<$4.Money>(2, _omitFieldNames ? '' : 'price', subBuilder: $4.Money.create)
    ..aOS(3, _omitFieldNames ? '' : 'comment')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSaleOfferRequest clone() => CreateSaleOfferRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSaleOfferRequest copyWith(void Function(CreateSaleOfferRequest) updates) => super.copyWith((message) => updates(message as CreateSaleOfferRequest)) as CreateSaleOfferRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSaleOfferRequest create() => CreateSaleOfferRequest._();
  CreateSaleOfferRequest createEmptyInstance() => create();
  static $pb.PbList<CreateSaleOfferRequest> createRepeated() => $pb.PbList<CreateSaleOfferRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateSaleOfferRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSaleOfferRequest>(create);
  static CreateSaleOfferRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get catId => $_getI64(0);
  @$pb.TagNumber(1)
  set catId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCatId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCatId() => clearField(1);

  @$pb.TagNumber(2)
  $4.Money get price => $_getN(1);
  @$pb.TagNumber(2)
  set price($4.Money v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPrice() => $_has(1);
  @$pb.TagNumber(2)
  void clearPrice() => clearField(2);
  @$pb.TagNumber(2)
  $4.Money ensurePrice() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get comment => $_getSZ(2);
  @$pb.TagNumber(3)
  set comment($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasComment() => $_has(2);
  @$pb.TagNumber(3)
  void clearComment() => clearField(3);
}

class SaleOfferInfo extends $pb.GeneratedMessage {
  factory SaleOfferInfo({
    $core.String? id,
    $fixnum.Int64? catId,
    $4.Money? price,
    $core.String? comment,
    $fixnum.Int64? sellerOwnerId,
    $core.String? status,
    $7.Timestamp? created,
    $7.Timestamp? modified,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (catId != null) {
      $result.catId = catId;
    }
    if (price != null) {
      $result.price = price;
    }
    if (comment != null) {
      $result.comment = comment;
    }
    if (sellerOwnerId != null) {
      $result.sellerOwnerId = sellerOwnerId;
    }
    if (status != null) {
      $result.status = status;
    }
    if (created != null) {
      $result.created = created;
    }
    if (modified != null) {
      $result.modified = modified;
    }
    return $result;
  }
  SaleOfferInfo._() : super();
  factory SaleOfferInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SaleOfferInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SaleOfferInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'xplago'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'catId', protoName: 'catId')
    ..aOM<$4.Money>(3, _omitFieldNames ? '' : 'price', subBuilder: $4.Money.create)
    ..aOS(4, _omitFieldNames ? '' : 'comment')
    ..aInt64(5, _omitFieldNames ? '' : 'sellerOwnerId', protoName: 'sellerOwnerId')
    ..aOS(6, _omitFieldNames ? '' : 'status')
    ..aOM<$7.Timestamp>(7, _omitFieldNames ? '' : 'created', subBuilder: $7.Timestamp.create)
    ..aOM<$7.Timestamp>(8, _omitFieldNames ? '' : 'modified', subBuilder: $7.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SaleOfferInfo clone() => SaleOfferInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SaleOfferInfo copyWith(void Function(SaleOfferInfo) updates) => super.copyWith((message) => updates(message as SaleOfferInfo)) as SaleOfferInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SaleOfferInfo create() => SaleOfferInfo._();
  SaleOfferInfo createEmptyInstance() => create();
  static $pb.PbList<SaleOfferInfo> createRepeated() => $pb.PbList<SaleOfferInfo>();
  @$core.pragma('dart2js:noInline')
  static SaleOfferInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SaleOfferInfo>(create);
  static SaleOfferInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get catId => $_getI64(1);
  @$pb.TagNumber(2)
  set catId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCatId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCatId() => clearField(2);

  @$pb.TagNumber(3)
  $4.Money get price => $_getN(2);
  @$pb.TagNumber(3)
  set price($4.Money v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => clearField(3);
  @$pb.TagNumber(3)
  $4.Money ensurePrice() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get comment => $_getSZ(3);
  @$pb.TagNumber(4)
  set comment($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasComment() => $_has(3);
  @$pb.TagNumber(4)
  void clearComment() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get sellerOwnerId => $_getI64(4);
  @$pb.TagNumber(5)
  set sellerOwnerId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSellerOwnerId() => $_has(4);
  @$pb.TagNumber(5)
  void clearSellerOwnerId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get status => $_getSZ(5);
  @$pb.TagNumber(6)
  set status($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => clearField(6);

  @$pb.TagNumber(7)
  $7.Timestamp get created => $_getN(6);
  @$pb.TagNumber(7)
  set created($7.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreated() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreated() => clearField(7);
  @$pb.TagNumber(7)
  $7.Timestamp ensureCreated() => $_ensure(6);

  @$pb.TagNumber(8)
  $7.Timestamp get modified => $_getN(7);
  @$pb.TagNumber(8)
  set modified($7.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasModified() => $_has(7);
  @$pb.TagNumber(8)
  void clearModified() => clearField(8);
  @$pb.TagNumber(8)
  $7.Timestamp ensureModified() => $_ensure(7);
}

class SaleOfferFullInfo extends $pb.GeneratedMessage {
  factory SaleOfferFullInfo({
    $core.String? id,
    CatShortInfo? cat,
    $4.Money? price,
    $core.String? comment,
    $fixnum.Int64? sellerOwnerId,
    $core.String? status,
    $7.Timestamp? created,
    $7.Timestamp? modified,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (cat != null) {
      $result.cat = cat;
    }
    if (price != null) {
      $result.price = price;
    }
    if (comment != null) {
      $result.comment = comment;
    }
    if (sellerOwnerId != null) {
      $result.sellerOwnerId = sellerOwnerId;
    }
    if (status != null) {
      $result.status = status;
    }
    if (created != null) {
      $result.created = created;
    }
    if (modified != null) {
      $result.modified = modified;
    }
    return $result;
  }
  SaleOfferFullInfo._() : super();
  factory SaleOfferFullInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SaleOfferFullInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SaleOfferFullInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'xplago'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOM<CatShortInfo>(2, _omitFieldNames ? '' : 'cat', subBuilder: CatShortInfo.create)
    ..aOM<$4.Money>(3, _omitFieldNames ? '' : 'price', subBuilder: $4.Money.create)
    ..aOS(4, _omitFieldNames ? '' : 'comment')
    ..aInt64(5, _omitFieldNames ? '' : 'sellerOwnerId', protoName: 'sellerOwnerId')
    ..aOS(6, _omitFieldNames ? '' : 'status')
    ..aOM<$7.Timestamp>(7, _omitFieldNames ? '' : 'created', subBuilder: $7.Timestamp.create)
    ..aOM<$7.Timestamp>(8, _omitFieldNames ? '' : 'modified', subBuilder: $7.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SaleOfferFullInfo clone() => SaleOfferFullInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SaleOfferFullInfo copyWith(void Function(SaleOfferFullInfo) updates) => super.copyWith((message) => updates(message as SaleOfferFullInfo)) as SaleOfferFullInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SaleOfferFullInfo create() => SaleOfferFullInfo._();
  SaleOfferFullInfo createEmptyInstance() => create();
  static $pb.PbList<SaleOfferFullInfo> createRepeated() => $pb.PbList<SaleOfferFullInfo>();
  @$core.pragma('dart2js:noInline')
  static SaleOfferFullInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SaleOfferFullInfo>(create);
  static SaleOfferFullInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  CatShortInfo get cat => $_getN(1);
  @$pb.TagNumber(2)
  set cat(CatShortInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCat() => $_has(1);
  @$pb.TagNumber(2)
  void clearCat() => clearField(2);
  @$pb.TagNumber(2)
  CatShortInfo ensureCat() => $_ensure(1);

  @$pb.TagNumber(3)
  $4.Money get price => $_getN(2);
  @$pb.TagNumber(3)
  set price($4.Money v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearPrice() => clearField(3);
  @$pb.TagNumber(3)
  $4.Money ensurePrice() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get comment => $_getSZ(3);
  @$pb.TagNumber(4)
  set comment($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasComment() => $_has(3);
  @$pb.TagNumber(4)
  void clearComment() => clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get sellerOwnerId => $_getI64(4);
  @$pb.TagNumber(5)
  set sellerOwnerId($fixnum.Int64 v) { $_setInt64(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSellerOwnerId() => $_has(4);
  @$pb.TagNumber(5)
  void clearSellerOwnerId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get status => $_getSZ(5);
  @$pb.TagNumber(6)
  set status($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => clearField(6);

  @$pb.TagNumber(7)
  $7.Timestamp get created => $_getN(6);
  @$pb.TagNumber(7)
  set created($7.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreated() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreated() => clearField(7);
  @$pb.TagNumber(7)
  $7.Timestamp ensureCreated() => $_ensure(6);

  @$pb.TagNumber(8)
  $7.Timestamp get modified => $_getN(7);
  @$pb.TagNumber(8)
  set modified($7.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasModified() => $_has(7);
  @$pb.TagNumber(8)
  void clearModified() => clearField(8);
  @$pb.TagNumber(8)
  $7.Timestamp ensureModified() => $_ensure(7);
}

class CatShortInfo extends $pb.GeneratedMessage {
  factory CatShortInfo({
    $fixnum.Int64? id,
    $core.String? name,
    $7.Timestamp? birthday,
    $fixnum.Int64? ownerId,
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
    if (avatarId != null) {
      $result.avatarId = avatarId;
    }
    return $result;
  }
  CatShortInfo._() : super();
  factory CatShortInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CatShortInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CatShortInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'xplago'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOM<$7.Timestamp>(3, _omitFieldNames ? '' : 'birthday', subBuilder: $7.Timestamp.create)
    ..aInt64(4, _omitFieldNames ? '' : 'ownerId', protoName: 'ownerId')
    ..aOS(6, _omitFieldNames ? '' : 'avatarId', protoName: 'avatarId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CatShortInfo clone() => CatShortInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CatShortInfo copyWith(void Function(CatShortInfo) updates) => super.copyWith((message) => updates(message as CatShortInfo)) as CatShortInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CatShortInfo create() => CatShortInfo._();
  CatShortInfo createEmptyInstance() => create();
  static $pb.PbList<CatShortInfo> createRepeated() => $pb.PbList<CatShortInfo>();
  @$core.pragma('dart2js:noInline')
  static CatShortInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CatShortInfo>(create);
  static CatShortInfo? _defaultInstance;

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

  @$pb.TagNumber(6)
  $core.String get avatarId => $_getSZ(4);
  @$pb.TagNumber(6)
  set avatarId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasAvatarId() => $_has(4);
  @$pb.TagNumber(6)
  void clearAvatarId() => clearField(6);
}

class BuyTransactionInfo extends $pb.GeneratedMessage {
  factory BuyTransactionInfo({
    $core.String? status,
    $core.String? reason,
  }) {
    final $result = create();
    if (status != null) {
      $result.status = status;
    }
    if (reason != null) {
      $result.reason = reason;
    }
    return $result;
  }
  BuyTransactionInfo._() : super();
  factory BuyTransactionInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BuyTransactionInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BuyTransactionInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'xplago'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'status')
    ..aOS(2, _omitFieldNames ? '' : 'reason')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BuyTransactionInfo clone() => BuyTransactionInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BuyTransactionInfo copyWith(void Function(BuyTransactionInfo) updates) => super.copyWith((message) => updates(message as BuyTransactionInfo)) as BuyTransactionInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BuyTransactionInfo create() => BuyTransactionInfo._();
  BuyTransactionInfo createEmptyInstance() => create();
  static $pb.PbList<BuyTransactionInfo> createRepeated() => $pb.PbList<BuyTransactionInfo>();
  @$core.pragma('dart2js:noInline')
  static BuyTransactionInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BuyTransactionInfo>(create);
  static BuyTransactionInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get status => $_getSZ(0);
  @$pb.TagNumber(1)
  set status($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get reason => $_getSZ(1);
  @$pb.TagNumber(2)
  set reason($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearReason() => clearField(2);
}

class BuyRequest extends $pb.GeneratedMessage {
  factory BuyRequest({
    $core.String? saleOfferId,
  }) {
    final $result = create();
    if (saleOfferId != null) {
      $result.saleOfferId = saleOfferId;
    }
    return $result;
  }
  BuyRequest._() : super();
  factory BuyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BuyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BuyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'xplago'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'saleOfferId', protoName: 'saleOfferId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BuyRequest clone() => BuyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BuyRequest copyWith(void Function(BuyRequest) updates) => super.copyWith((message) => updates(message as BuyRequest)) as BuyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BuyRequest create() => BuyRequest._();
  BuyRequest createEmptyInstance() => create();
  static $pb.PbList<BuyRequest> createRepeated() => $pb.PbList<BuyRequest>();
  @$core.pragma('dart2js:noInline')
  static BuyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BuyRequest>(create);
  static BuyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get saleOfferId => $_getSZ(0);
  @$pb.TagNumber(1)
  set saleOfferId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSaleOfferId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSaleOfferId() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
