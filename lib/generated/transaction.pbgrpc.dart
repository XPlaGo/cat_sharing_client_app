//
//  Generated code. Do not modify.
//  source: transaction.proto
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

import 'google/protobuf/wrappers.pb.dart' as $3;
import 'transaction.pb.dart' as $6;

export 'transaction.pb.dart';

@$pb.GrpcServiceName('xplago.TransactionService')
class TransactionServiceClient extends $grpc.Client {
  static final _$getMyTransactions = $grpc.ClientMethod<$6.GetMyTransactionsRequest, $6.TransactionDataInfo>(
      '/xplago.TransactionService/getMyTransactions',
      ($6.GetMyTransactionsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.TransactionDataInfo.fromBuffer(value));
  static final _$getTransactionById = $grpc.ClientMethod<$3.StringValue, $6.TransactionDataInfo>(
      '/xplago.TransactionService/getTransactionById',
      ($3.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $6.TransactionDataInfo.fromBuffer(value));

  TransactionServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$6.TransactionDataInfo> getMyTransactions($6.GetMyTransactionsRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getMyTransactions, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$6.TransactionDataInfo> getTransactionById($3.StringValue request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTransactionById, request, options: options);
  }
}

@$pb.GrpcServiceName('xplago.TransactionService')
abstract class TransactionServiceBase extends $grpc.Service {
  $core.String get $name => 'xplago.TransactionService';

  TransactionServiceBase() {
    $addMethod($grpc.ServiceMethod<$6.GetMyTransactionsRequest, $6.TransactionDataInfo>(
        'getMyTransactions',
        getMyTransactions_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $6.GetMyTransactionsRequest.fromBuffer(value),
        ($6.TransactionDataInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.StringValue, $6.TransactionDataInfo>(
        'getTransactionById',
        getTransactionById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.StringValue.fromBuffer(value),
        ($6.TransactionDataInfo value) => value.writeToBuffer()));
  }

  $async.Stream<$6.TransactionDataInfo> getMyTransactions_Pre($grpc.ServiceCall call, $async.Future<$6.GetMyTransactionsRequest> request) async* {
    yield* getMyTransactions(call, await request);
  }

  $async.Future<$6.TransactionDataInfo> getTransactionById_Pre($grpc.ServiceCall call, $async.Future<$3.StringValue> request) async {
    return getTransactionById(call, await request);
  }

  $async.Stream<$6.TransactionDataInfo> getMyTransactions($grpc.ServiceCall call, $6.GetMyTransactionsRequest request);
  $async.Future<$6.TransactionDataInfo> getTransactionById($grpc.ServiceCall call, $3.StringValue request);
}
