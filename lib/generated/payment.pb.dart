//
//  Generated code. Do not modify.
//  source: payment.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'auth.pb.dart' as $0;

class Money extends $pb.GeneratedMessage {
  factory Money({
    $fixnum.Int64? units,
    $core.int? nanos,
  }) {
    final $result = create();
    if (units != null) {
      $result.units = units;
    }
    if (nanos != null) {
      $result.nanos = nanos;
    }
    return $result;
  }
  Money._() : super();
  factory Money.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Money.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Money', package: const $pb.PackageName(_omitMessageNames ? '' : 'xplago'), createEmptyInstance: create)
    ..aInt64(2, _omitFieldNames ? '' : 'units')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'nanos', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Money clone() => Money()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Money copyWith(void Function(Money) updates) => super.copyWith((message) => updates(message as Money)) as Money;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Money create() => Money._();
  Money createEmptyInstance() => create();
  static $pb.PbList<Money> createRepeated() => $pb.PbList<Money>();
  @$core.pragma('dart2js:noInline')
  static Money getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Money>(create);
  static Money? _defaultInstance;

  @$pb.TagNumber(2)
  $fixnum.Int64 get units => $_getI64(0);
  @$pb.TagNumber(2)
  set units($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasUnits() => $_has(0);
  @$pb.TagNumber(2)
  void clearUnits() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get nanos => $_getIZ(1);
  @$pb.TagNumber(3)
  set nanos($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasNanos() => $_has(1);
  @$pb.TagNumber(3)
  void clearNanos() => clearField(3);
}

class AccountInfo extends $pb.GeneratedMessage {
  factory AccountInfo({
    $core.String? id,
    Money? amount,
    $fixnum.Int64? userId,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  AccountInfo._() : super();
  factory AccountInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AccountInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'xplago'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOM<Money>(2, _omitFieldNames ? '' : 'amount', subBuilder: Money.create)
    ..aInt64(3, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccountInfo clone() => AccountInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccountInfo copyWith(void Function(AccountInfo) updates) => super.copyWith((message) => updates(message as AccountInfo)) as AccountInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccountInfo create() => AccountInfo._();
  AccountInfo createEmptyInstance() => create();
  static $pb.PbList<AccountInfo> createRepeated() => $pb.PbList<AccountInfo>();
  @$core.pragma('dart2js:noInline')
  static AccountInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountInfo>(create);
  static AccountInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  Money get amount => $_getN(1);
  @$pb.TagNumber(2)
  set amount(Money v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => clearField(2);
  @$pb.TagNumber(2)
  Money ensureAmount() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get userId => $_getI64(2);
  @$pb.TagNumber(3)
  set userId($fixnum.Int64 v) { $_setInt64(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => clearField(3);
}

class AccountsInfo extends $pb.GeneratedMessage {
  factory AccountsInfo({
    $core.Iterable<AccountInfo>? accounts,
  }) {
    final $result = create();
    if (accounts != null) {
      $result.accounts.addAll(accounts);
    }
    return $result;
  }
  AccountsInfo._() : super();
  factory AccountsInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AccountsInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AccountsInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'xplago'), createEmptyInstance: create)
    ..pc<AccountInfo>(1, _omitFieldNames ? '' : 'accounts', $pb.PbFieldType.PM, subBuilder: AccountInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AccountsInfo clone() => AccountsInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AccountsInfo copyWith(void Function(AccountsInfo) updates) => super.copyWith((message) => updates(message as AccountsInfo)) as AccountsInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AccountsInfo create() => AccountsInfo._();
  AccountsInfo createEmptyInstance() => create();
  static $pb.PbList<AccountsInfo> createRepeated() => $pb.PbList<AccountsInfo>();
  @$core.pragma('dart2js:noInline')
  static AccountsInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AccountsInfo>(create);
  static AccountsInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<AccountInfo> get accounts => $_getList(0);
}

class PublicAccountInfo extends $pb.GeneratedMessage {
  factory PublicAccountInfo({
    $core.String? id,
    $0.UserInfo? user,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (user != null) {
      $result.user = user;
    }
    return $result;
  }
  PublicAccountInfo._() : super();
  factory PublicAccountInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PublicAccountInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PublicAccountInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'xplago'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOM<$0.UserInfo>(2, _omitFieldNames ? '' : 'user', subBuilder: $0.UserInfo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PublicAccountInfo clone() => PublicAccountInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PublicAccountInfo copyWith(void Function(PublicAccountInfo) updates) => super.copyWith((message) => updates(message as PublicAccountInfo)) as PublicAccountInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PublicAccountInfo create() => PublicAccountInfo._();
  PublicAccountInfo createEmptyInstance() => create();
  static $pb.PbList<PublicAccountInfo> createRepeated() => $pb.PbList<PublicAccountInfo>();
  @$core.pragma('dart2js:noInline')
  static PublicAccountInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PublicAccountInfo>(create);
  static PublicAccountInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $0.UserInfo get user => $_getN(1);
  @$pb.TagNumber(2)
  set user($0.UserInfo v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasUser() => $_has(1);
  @$pb.TagNumber(2)
  void clearUser() => clearField(2);
  @$pb.TagNumber(2)
  $0.UserInfo ensureUser() => $_ensure(1);
}

class GetAccountByEmailRequest extends $pb.GeneratedMessage {
  factory GetAccountByEmailRequest({
    $core.String? email,
  }) {
    final $result = create();
    if (email != null) {
      $result.email = email;
    }
    return $result;
  }
  GetAccountByEmailRequest._() : super();
  factory GetAccountByEmailRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAccountByEmailRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAccountByEmailRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'xplago'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAccountByEmailRequest clone() => GetAccountByEmailRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAccountByEmailRequest copyWith(void Function(GetAccountByEmailRequest) updates) => super.copyWith((message) => updates(message as GetAccountByEmailRequest)) as GetAccountByEmailRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAccountByEmailRequest create() => GetAccountByEmailRequest._();
  GetAccountByEmailRequest createEmptyInstance() => create();
  static $pb.PbList<GetAccountByEmailRequest> createRepeated() => $pb.PbList<GetAccountByEmailRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAccountByEmailRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAccountByEmailRequest>(create);
  static GetAccountByEmailRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);
}

class PaymentAccountExistsByIdAndUserIdRequest extends $pb.GeneratedMessage {
  factory PaymentAccountExistsByIdAndUserIdRequest({
    $core.String? id,
    $fixnum.Int64? userId,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (userId != null) {
      $result.userId = userId;
    }
    return $result;
  }
  PaymentAccountExistsByIdAndUserIdRequest._() : super();
  factory PaymentAccountExistsByIdAndUserIdRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PaymentAccountExistsByIdAndUserIdRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PaymentAccountExistsByIdAndUserIdRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'xplago'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aInt64(2, _omitFieldNames ? '' : 'userId', protoName: 'userId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PaymentAccountExistsByIdAndUserIdRequest clone() => PaymentAccountExistsByIdAndUserIdRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PaymentAccountExistsByIdAndUserIdRequest copyWith(void Function(PaymentAccountExistsByIdAndUserIdRequest) updates) => super.copyWith((message) => updates(message as PaymentAccountExistsByIdAndUserIdRequest)) as PaymentAccountExistsByIdAndUserIdRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PaymentAccountExistsByIdAndUserIdRequest create() => PaymentAccountExistsByIdAndUserIdRequest._();
  PaymentAccountExistsByIdAndUserIdRequest createEmptyInstance() => create();
  static $pb.PbList<PaymentAccountExistsByIdAndUserIdRequest> createRepeated() => $pb.PbList<PaymentAccountExistsByIdAndUserIdRequest>();
  @$core.pragma('dart2js:noInline')
  static PaymentAccountExistsByIdAndUserIdRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PaymentAccountExistsByIdAndUserIdRequest>(create);
  static PaymentAccountExistsByIdAndUserIdRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
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
}

class TransferRequest extends $pb.GeneratedMessage {
  factory TransferRequest({
    $core.String? senderAccountId,
    $core.String? receiverAccountId,
    Money? amount,
    $core.String? comment,
  }) {
    final $result = create();
    if (senderAccountId != null) {
      $result.senderAccountId = senderAccountId;
    }
    if (receiverAccountId != null) {
      $result.receiverAccountId = receiverAccountId;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (comment != null) {
      $result.comment = comment;
    }
    return $result;
  }
  TransferRequest._() : super();
  factory TransferRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransferRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransferRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'xplago'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'senderAccountId', protoName: 'senderAccountId')
    ..aOS(2, _omitFieldNames ? '' : 'receiverAccountId', protoName: 'receiverAccountId')
    ..aOM<Money>(3, _omitFieldNames ? '' : 'amount', subBuilder: Money.create)
    ..aOS(4, _omitFieldNames ? '' : 'comment')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransferRequest clone() => TransferRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransferRequest copyWith(void Function(TransferRequest) updates) => super.copyWith((message) => updates(message as TransferRequest)) as TransferRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferRequest create() => TransferRequest._();
  TransferRequest createEmptyInstance() => create();
  static $pb.PbList<TransferRequest> createRepeated() => $pb.PbList<TransferRequest>();
  @$core.pragma('dart2js:noInline')
  static TransferRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransferRequest>(create);
  static TransferRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get senderAccountId => $_getSZ(0);
  @$pb.TagNumber(1)
  set senderAccountId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSenderAccountId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSenderAccountId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get receiverAccountId => $_getSZ(1);
  @$pb.TagNumber(2)
  set receiverAccountId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasReceiverAccountId() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiverAccountId() => clearField(2);

  @$pb.TagNumber(3)
  Money get amount => $_getN(2);
  @$pb.TagNumber(3)
  set amount(Money v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);
  @$pb.TagNumber(3)
  Money ensureAmount() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get comment => $_getSZ(3);
  @$pb.TagNumber(4)
  set comment($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasComment() => $_has(3);
  @$pb.TagNumber(4)
  void clearComment() => clearField(4);
}

class TransactionInfo extends $pb.GeneratedMessage {
  factory TransactionInfo({
    $core.String? id,
    $core.String? status,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  TransactionInfo._() : super();
  factory TransactionInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransactionInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransactionInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'xplago'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransactionInfo clone() => TransactionInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransactionInfo copyWith(void Function(TransactionInfo) updates) => super.copyWith((message) => updates(message as TransactionInfo)) as TransactionInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransactionInfo create() => TransactionInfo._();
  TransactionInfo createEmptyInstance() => create();
  static $pb.PbList<TransactionInfo> createRepeated() => $pb.PbList<TransactionInfo>();
  @$core.pragma('dart2js:noInline')
  static TransactionInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransactionInfo>(create);
  static TransactionInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
