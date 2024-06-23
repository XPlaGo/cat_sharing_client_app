//
//  Generated code. Do not modify.
//  source: trade.proto
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
import 'trade.pb.dart' as $5;

export 'trade.pb.dart';

@$pb.GrpcServiceName('xplago.SaleOfferService')
class SaleOfferServiceClient extends $grpc.Client {
  static final _$createSaleOffer = $grpc.ClientMethod<$5.CreateSaleOfferRequest, $5.SaleOfferInfo>(
      '/xplago.SaleOfferService/createSaleOffer',
      ($5.CreateSaleOfferRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.SaleOfferInfo.fromBuffer(value));
  static final _$getSaleOfferById = $grpc.ClientMethod<$3.StringValue, $5.SaleOfferInfo>(
      '/xplago.SaleOfferService/getSaleOfferById',
      ($3.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.SaleOfferInfo.fromBuffer(value));
  static final _$getSaleFullOfferById = $grpc.ClientMethod<$3.StringValue, $5.SaleOfferFullInfo>(
      '/xplago.SaleOfferService/getSaleFullOfferById',
      ($3.StringValue value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.SaleOfferFullInfo.fromBuffer(value));
  static final _$getSaleOfferByCatId = $grpc.ClientMethod<$3.Int64Value, $5.SaleOfferInfo>(
      '/xplago.SaleOfferService/getSaleOfferByCatId',
      ($3.Int64Value value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.SaleOfferInfo.fromBuffer(value));
  static final _$getSaleOffersIds = $grpc.ClientMethod<$1.Empty, $3.StringValue>(
      '/xplago.SaleOfferService/getSaleOffersIds',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.StringValue.fromBuffer(value));
  static final _$buy = $grpc.ClientMethod<$5.BuyRequest, $5.BuyTransactionInfo>(
      '/xplago.SaleOfferService/buy',
      ($5.BuyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.BuyTransactionInfo.fromBuffer(value));

  SaleOfferServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$5.SaleOfferInfo> createSaleOffer($5.CreateSaleOfferRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createSaleOffer, request, options: options);
  }

  $grpc.ResponseFuture<$5.SaleOfferInfo> getSaleOfferById($3.StringValue request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSaleOfferById, request, options: options);
  }

  $grpc.ResponseFuture<$5.SaleOfferFullInfo> getSaleFullOfferById($3.StringValue request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSaleFullOfferById, request, options: options);
  }

  $grpc.ResponseFuture<$5.SaleOfferInfo> getSaleOfferByCatId($3.Int64Value request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSaleOfferByCatId, request, options: options);
  }

  $grpc.ResponseStream<$3.StringValue> getSaleOffersIds($1.Empty request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getSaleOffersIds, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseStream<$5.BuyTransactionInfo> buy($5.BuyRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$buy, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('xplago.SaleOfferService')
abstract class SaleOfferServiceBase extends $grpc.Service {
  $core.String get $name => 'xplago.SaleOfferService';

  SaleOfferServiceBase() {
    $addMethod($grpc.ServiceMethod<$5.CreateSaleOfferRequest, $5.SaleOfferInfo>(
        'createSaleOffer',
        createSaleOffer_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.CreateSaleOfferRequest.fromBuffer(value),
        ($5.SaleOfferInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.StringValue, $5.SaleOfferInfo>(
        'getSaleOfferById',
        getSaleOfferById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.StringValue.fromBuffer(value),
        ($5.SaleOfferInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.StringValue, $5.SaleOfferFullInfo>(
        'getSaleFullOfferById',
        getSaleFullOfferById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.StringValue.fromBuffer(value),
        ($5.SaleOfferFullInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.Int64Value, $5.SaleOfferInfo>(
        'getSaleOfferByCatId',
        getSaleOfferByCatId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.Int64Value.fromBuffer(value),
        ($5.SaleOfferInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $3.StringValue>(
        'getSaleOffersIds',
        getSaleOffersIds_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($3.StringValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.BuyRequest, $5.BuyTransactionInfo>(
        'buy',
        buy_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $5.BuyRequest.fromBuffer(value),
        ($5.BuyTransactionInfo value) => value.writeToBuffer()));
  }

  $async.Future<$5.SaleOfferInfo> createSaleOffer_Pre($grpc.ServiceCall call, $async.Future<$5.CreateSaleOfferRequest> request) async {
    return createSaleOffer(call, await request);
  }

  $async.Future<$5.SaleOfferInfo> getSaleOfferById_Pre($grpc.ServiceCall call, $async.Future<$3.StringValue> request) async {
    return getSaleOfferById(call, await request);
  }

  $async.Future<$5.SaleOfferFullInfo> getSaleFullOfferById_Pre($grpc.ServiceCall call, $async.Future<$3.StringValue> request) async {
    return getSaleFullOfferById(call, await request);
  }

  $async.Future<$5.SaleOfferInfo> getSaleOfferByCatId_Pre($grpc.ServiceCall call, $async.Future<$3.Int64Value> request) async {
    return getSaleOfferByCatId(call, await request);
  }

  $async.Stream<$3.StringValue> getSaleOffersIds_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async* {
    yield* getSaleOffersIds(call, await request);
  }

  $async.Stream<$5.BuyTransactionInfo> buy_Pre($grpc.ServiceCall call, $async.Future<$5.BuyRequest> request) async* {
    yield* buy(call, await request);
  }

  $async.Future<$5.SaleOfferInfo> createSaleOffer($grpc.ServiceCall call, $5.CreateSaleOfferRequest request);
  $async.Future<$5.SaleOfferInfo> getSaleOfferById($grpc.ServiceCall call, $3.StringValue request);
  $async.Future<$5.SaleOfferFullInfo> getSaleFullOfferById($grpc.ServiceCall call, $3.StringValue request);
  $async.Future<$5.SaleOfferInfo> getSaleOfferByCatId($grpc.ServiceCall call, $3.Int64Value request);
  $async.Stream<$3.StringValue> getSaleOffersIds($grpc.ServiceCall call, $1.Empty request);
  $async.Stream<$5.BuyTransactionInfo> buy($grpc.ServiceCall call, $5.BuyRequest request);
}
