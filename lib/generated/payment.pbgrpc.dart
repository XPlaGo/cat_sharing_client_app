//
//  Generated code. Do not modify.
//  source: payment.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/empty.pb.dart' as $1;
import 'google/protobuf/wrappers.pb.dart' as $3;
import 'payment.pb.dart' as $4;

export 'payment.pb.dart';

@$pb.GrpcServiceName('xplago.PaymentAccountService')
class PaymentAccountServiceClient extends $grpc.Client {
  static final _$getMyPaymentAccount = $grpc.ClientMethod<$1.Empty, $4.AccountInfo>(
      '/xplago.PaymentAccountService/getMyPaymentAccount',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.AccountInfo.fromBuffer(value));
  static final _$getMyPaymentAccounts = $grpc.ClientMethod<$1.Empty, $4.AccountsInfo>(
      '/xplago.PaymentAccountService/getMyPaymentAccounts',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.AccountsInfo.fromBuffer(value));
  static final _$createMyPaymentAccount = $grpc.ClientMethod<$1.Empty, $4.AccountInfo>(
      '/xplago.PaymentAccountService/createMyPaymentAccount',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.AccountInfo.fromBuffer(value));
  static final _$myAccountExists = $grpc.ClientMethod<$1.Empty, $3.BoolValue>(
      '/xplago.PaymentAccountService/myAccountExists',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.BoolValue.fromBuffer(value));
  static final _$getPaymentAccountByEmail = $grpc.ClientMethod<$4.GetAccountByEmailRequest, $4.PublicAccountInfo>(
      '/xplago.PaymentAccountService/getPaymentAccountByEmail',
      ($4.GetAccountByEmailRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.PublicAccountInfo.fromBuffer(value));
  static final _$getPaymentAccountByUserId = $grpc.ClientMethod<$3.Int64Value, $4.AccountInfo>(
      '/xplago.PaymentAccountService/getPaymentAccountByUserId',
      ($3.Int64Value value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.AccountInfo.fromBuffer(value));
  static final _$paymentAccountExistsByIdAndUserId = $grpc.ClientMethod<$4.PaymentAccountExistsByIdAndUserIdRequest, $3.BoolValue>(
      '/xplago.PaymentAccountService/paymentAccountExistsByIdAndUserId',
      ($4.PaymentAccountExistsByIdAndUserIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.BoolValue.fromBuffer(value));

  PaymentAccountServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$4.AccountInfo> getMyPaymentAccount($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMyPaymentAccount, request, options: options);
  }

  $grpc.ResponseFuture<$4.AccountsInfo> getMyPaymentAccounts($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMyPaymentAccounts, request, options: options);
  }

  $grpc.ResponseFuture<$4.AccountInfo> createMyPaymentAccount($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createMyPaymentAccount, request, options: options);
  }

  $grpc.ResponseFuture<$3.BoolValue> myAccountExists($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$myAccountExists, request, options: options);
  }

  $grpc.ResponseFuture<$4.PublicAccountInfo> getPaymentAccountByEmail($4.GetAccountByEmailRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPaymentAccountByEmail, request, options: options);
  }

  $grpc.ResponseFuture<$4.AccountInfo> getPaymentAccountByUserId($3.Int64Value request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPaymentAccountByUserId, request, options: options);
  }

  $grpc.ResponseFuture<$3.BoolValue> paymentAccountExistsByIdAndUserId($4.PaymentAccountExistsByIdAndUserIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$paymentAccountExistsByIdAndUserId, request, options: options);
  }
}

@$pb.GrpcServiceName('xplago.PaymentAccountService')
abstract class PaymentAccountServiceBase extends $grpc.Service {
  $core.String get $name => 'xplago.PaymentAccountService';

  PaymentAccountServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.Empty, $4.AccountInfo>(
        'getMyPaymentAccount',
        getMyPaymentAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($4.AccountInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $4.AccountsInfo>(
        'getMyPaymentAccounts',
        getMyPaymentAccounts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($4.AccountsInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $4.AccountInfo>(
        'createMyPaymentAccount',
        createMyPaymentAccount_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($4.AccountInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $3.BoolValue>(
        'myAccountExists',
        myAccountExists_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($3.BoolValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GetAccountByEmailRequest, $4.PublicAccountInfo>(
        'getPaymentAccountByEmail',
        getPaymentAccountByEmail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.GetAccountByEmailRequest.fromBuffer(value),
        ($4.PublicAccountInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.Int64Value, $4.AccountInfo>(
        'getPaymentAccountByUserId',
        getPaymentAccountByUserId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.Int64Value.fromBuffer(value),
        ($4.AccountInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.PaymentAccountExistsByIdAndUserIdRequest, $3.BoolValue>(
        'paymentAccountExistsByIdAndUserId',
        paymentAccountExistsByIdAndUserId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.PaymentAccountExistsByIdAndUserIdRequest.fromBuffer(value),
        ($3.BoolValue value) => value.writeToBuffer()));
  }

  $async.Future<$4.AccountInfo> getMyPaymentAccount_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getMyPaymentAccount(call, await request);
  }

  $async.Future<$4.AccountsInfo> getMyPaymentAccounts_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getMyPaymentAccounts(call, await request);
  }

  $async.Future<$4.AccountInfo> createMyPaymentAccount_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return createMyPaymentAccount(call, await request);
  }

  $async.Future<$3.BoolValue> myAccountExists_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return myAccountExists(call, await request);
  }

  $async.Future<$4.PublicAccountInfo> getPaymentAccountByEmail_Pre($grpc.ServiceCall call, $async.Future<$4.GetAccountByEmailRequest> request) async {
    return getPaymentAccountByEmail(call, await request);
  }

  $async.Future<$4.AccountInfo> getPaymentAccountByUserId_Pre($grpc.ServiceCall call, $async.Future<$3.Int64Value> request) async {
    return getPaymentAccountByUserId(call, await request);
  }

  $async.Future<$3.BoolValue> paymentAccountExistsByIdAndUserId_Pre($grpc.ServiceCall call, $async.Future<$4.PaymentAccountExistsByIdAndUserIdRequest> request) async {
    return paymentAccountExistsByIdAndUserId(call, await request);
  }

  $async.Future<$4.AccountInfo> getMyPaymentAccount($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$4.AccountsInfo> getMyPaymentAccounts($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$4.AccountInfo> createMyPaymentAccount($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$3.BoolValue> myAccountExists($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$4.PublicAccountInfo> getPaymentAccountByEmail($grpc.ServiceCall call, $4.GetAccountByEmailRequest request);
  $async.Future<$4.AccountInfo> getPaymentAccountByUserId($grpc.ServiceCall call, $3.Int64Value request);
  $async.Future<$3.BoolValue> paymentAccountExistsByIdAndUserId($grpc.ServiceCall call, $4.PaymentAccountExistsByIdAndUserIdRequest request);
}
@$pb.GrpcServiceName('xplago.PaymentService')
class PaymentServiceClient extends $grpc.Client {
  static final _$transfer = $grpc.ClientMethod<$4.TransferRequest, $4.TransactionInfo>(
      '/xplago.PaymentService/transfer',
      ($4.TransferRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.TransactionInfo.fromBuffer(value));
  static final _$replenish = $grpc.ClientMethod<$4.ReplenishRequest, $4.TransactionInfo>(
      '/xplago.PaymentService/replenish',
      ($4.ReplenishRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.TransactionInfo.fromBuffer(value));
  static final _$rollback = $grpc.ClientMethod<$3.StringValue, $1.Empty>(
      '/xplago.PaymentService/rollback',
      ($3.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  PaymentServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$4.TransactionInfo> transfer($4.TransferRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$transfer, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseStream<$4.TransactionInfo> replenish($4.ReplenishRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$replenish, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$1.Empty> rollback($3.StringValue request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$rollback, request, options: options);
  }
}

@$pb.GrpcServiceName('xplago.PaymentService')
abstract class PaymentServiceBase extends $grpc.Service {
  $core.String get $name => 'xplago.PaymentService';

  PaymentServiceBase() {
    $addMethod($grpc.ServiceMethod<$4.TransferRequest, $4.TransactionInfo>(
        'transfer',
        transfer_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $4.TransferRequest.fromBuffer(value),
        ($4.TransactionInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.ReplenishRequest, $4.TransactionInfo>(
        'replenish',
        replenish_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $4.ReplenishRequest.fromBuffer(value),
        ($4.TransactionInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.StringValue, $1.Empty>(
        'rollback',
        rollback_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.StringValue.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Stream<$4.TransactionInfo> transfer_Pre($grpc.ServiceCall call, $async.Future<$4.TransferRequest> request) async* {
    yield* transfer(call, await request);
  }

  $async.Stream<$4.TransactionInfo> replenish_Pre($grpc.ServiceCall call, $async.Future<$4.ReplenishRequest> request) async* {
    yield* replenish(call, await request);
  }

  $async.Future<$1.Empty> rollback_Pre($grpc.ServiceCall call, $async.Future<$3.StringValue> request) async {
    return rollback(call, await request);
  }

  $async.Stream<$4.TransactionInfo> transfer($grpc.ServiceCall call, $4.TransferRequest request);
  $async.Stream<$4.TransactionInfo> replenish($grpc.ServiceCall call, $4.ReplenishRequest request);
  $async.Future<$1.Empty> rollback($grpc.ServiceCall call, $3.StringValue request);
}
