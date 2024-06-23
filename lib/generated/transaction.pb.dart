//
//  Generated code. Do not modify.
//  source: transaction.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $7;
import 'payment.pb.dart' as $4;

class TransactionDataInfo extends $pb.GeneratedMessage {
  factory TransactionDataInfo({
    $core.String? id,
    $4.Money? amount,
    $core.String? senderAccountId,
    $core.String? receiverAccountId,
    $core.String? status,
    $core.String? comment,
    $7.Timestamp? created,
    $7.Timestamp? modified,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (senderAccountId != null) {
      $result.senderAccountId = senderAccountId;
    }
    if (receiverAccountId != null) {
      $result.receiverAccountId = receiverAccountId;
    }
    if (status != null) {
      $result.status = status;
    }
    if (comment != null) {
      $result.comment = comment;
    }
    if (created != null) {
      $result.created = created;
    }
    if (modified != null) {
      $result.modified = modified;
    }
    return $result;
  }
  TransactionDataInfo._() : super();
  factory TransactionDataInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionDataInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionDataInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'xplago'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOM<$4.Money>(2, _omitFieldNames ? '' : 'amount', subBuilder: $4.Money.create)
    ..aOS(3, _omitFieldNames ? '' : 'senderAccountId', protoName: 'senderAccountId')
    ..aOS(4, _omitFieldNames ? '' : 'receiverAccountId', protoName: 'receiverAccountId')
    ..aOS(5, _omitFieldNames ? '' : 'status')
    ..aOS(6, _omitFieldNames ? '' : 'comment')
    ..aOM<$7.Timestamp>(7, _omitFieldNames ? '' : 'created', subBuilder: $7.Timestamp.create)
    ..aOM<$7.Timestamp>(8, _omitFieldNames ? '' : 'modified', subBuilder: $7.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionDataInfo clone() => TransactionDataInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionDataInfo copyWith(void Function(TransactionDataInfo) updates) => super.copyWith((message) => updates(message as TransactionDataInfo)) as TransactionDataInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionDataInfo create() => TransactionDataInfo._();
  TransactionDataInfo createEmptyInstance() => create();
  static $pb.PbList<TransactionDataInfo> createRepeated() => $pb.PbList<TransactionDataInfo>();
  @$core.pragma('dart2js:noInline')
  static TransactionDataInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionDataInfo>(create);
  static TransactionDataInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $4.Money get amount => $_getN(1);
  @$pb.TagNumber(2)
  set amount($4.Money v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);
  @$pb.TagNumber(2)
  $4.Money ensureAmount() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get senderAccountId => $_getSZ(2);
  @$pb.TagNumber(3)
  set senderAccountId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSenderAccountId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSenderAccountId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get receiverAccountId => $_getSZ(3);
  @$pb.TagNumber(4)
  set receiverAccountId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasReceiverAccountId() => $_has(3);
  @$pb.TagNumber(4)
  void clearReceiverAccountId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get status => $_getSZ(4);
  @$pb.TagNumber(5)
  set status($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get comment => $_getSZ(5);
  @$pb.TagNumber(6)
  set comment($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasComment() => $_has(5);
  @$pb.TagNumber(6)
  void clearComment() => clearField(6);

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

class GetMyTransactionsRequest extends $pb.GeneratedMessage {
  factory GetMyTransactionsRequest({
    $core.String? accountId,
  }) {
    final $result = create();
    if (accountId != null) {
      $result.accountId = accountId;
    }
    return $result;
  }
  GetMyTransactionsRequest._() : super();
  factory GetMyTransactionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMyTransactionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMyTransactionsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'xplago'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'accountId', protoName: 'accountId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMyTransactionsRequest clone() => GetMyTransactionsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMyTransactionsRequest copyWith(void Function(GetMyTransactionsRequest) updates) => super.copyWith((message) => updates(message as GetMyTransactionsRequest)) as GetMyTransactionsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMyTransactionsRequest create() => GetMyTransactionsRequest._();
  GetMyTransactionsRequest createEmptyInstance() => create();
  static $pb.PbList<GetMyTransactionsRequest> createRepeated() => $pb.PbList<GetMyTransactionsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetMyTransactionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMyTransactionsRequest>(create);
  static GetMyTransactionsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get accountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set accountId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAccountId() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
