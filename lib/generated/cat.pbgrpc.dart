//
//  Generated code. Do not modify.
//  source: cat.proto
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

import 'cat.pb.dart' as $2;
import 'google/protobuf/empty.pb.dart' as $1;
import 'google/protobuf/wrappers.pb.dart' as $3;

export 'cat.pb.dart';

@$pb.GrpcServiceName('xplago.OwnerService')
class OwnerServiceClient extends $grpc.Client {
  static final _$getMyOwner = $grpc.ClientMethod<$1.Empty, $2.OwnerInfo>(
      '/xplago.OwnerService/getMyOwner',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.OwnerInfo.fromBuffer(value));
  static final _$myOwnerExists = $grpc.ClientMethod<$1.Empty, $3.BoolValue>(
      '/xplago.OwnerService/myOwnerExists',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $3.BoolValue.fromBuffer(value));
  static final _$createMyOwner = $grpc.ClientMethod<$1.Empty, $2.OwnerInfo>(
      '/xplago.OwnerService/createMyOwner',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.OwnerInfo.fromBuffer(value));
  static final _$getOwnerByUserId = $grpc.ClientMethod<$3.Int64Value, $2.OwnerInfo>(
      '/xplago.OwnerService/getOwnerByUserId',
      ($3.Int64Value value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.OwnerInfo.fromBuffer(value));

  OwnerServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$2.OwnerInfo> getMyOwner($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getMyOwner, request, options: options);
  }

  $grpc.ResponseFuture<$3.BoolValue> myOwnerExists($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$myOwnerExists, request, options: options);
  }

  $grpc.ResponseFuture<$2.OwnerInfo> createMyOwner($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createMyOwner, request, options: options);
  }

  $grpc.ResponseFuture<$2.OwnerInfo> getOwnerByUserId($3.Int64Value request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getOwnerByUserId, request, options: options);
  }
}

@$pb.GrpcServiceName('xplago.OwnerService')
abstract class OwnerServiceBase extends $grpc.Service {
  $core.String get $name => 'xplago.OwnerService';

  OwnerServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.Empty, $2.OwnerInfo>(
        'getMyOwner',
        getMyOwner_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($2.OwnerInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $3.BoolValue>(
        'myOwnerExists',
        myOwnerExists_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($3.BoolValue value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $2.OwnerInfo>(
        'createMyOwner',
        createMyOwner_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($2.OwnerInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.Int64Value, $2.OwnerInfo>(
        'getOwnerByUserId',
        getOwnerByUserId_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $3.Int64Value.fromBuffer(value),
        ($2.OwnerInfo value) => value.writeToBuffer()));
  }

  $async.Future<$2.OwnerInfo> getMyOwner_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return getMyOwner(call, await request);
  }

  $async.Future<$3.BoolValue> myOwnerExists_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return myOwnerExists(call, await request);
  }

  $async.Future<$2.OwnerInfo> createMyOwner_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return createMyOwner(call, await request);
  }

  $async.Future<$2.OwnerInfo> getOwnerByUserId_Pre($grpc.ServiceCall call, $async.Future<$3.Int64Value> request) async {
    return getOwnerByUserId(call, await request);
  }

  $async.Future<$2.OwnerInfo> getMyOwner($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$3.BoolValue> myOwnerExists($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$2.OwnerInfo> createMyOwner($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$2.OwnerInfo> getOwnerByUserId($grpc.ServiceCall call, $3.Int64Value request);
}
@$pb.GrpcServiceName('xplago.CatService')
class CatServiceClient extends $grpc.Client {
  static final _$getCat = $grpc.ClientMethod<$2.GetCatRequest, $2.CatInfo>(
      '/xplago.CatService/getCat',
      ($2.GetCatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.CatInfo.fromBuffer(value));
  static final _$getCats = $grpc.ClientMethod<$2.GetCatRequest, $2.CatInfo>(
      '/xplago.CatService/getCats',
      ($2.GetCatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.CatInfo.fromBuffer(value));
  static final _$createCat = $grpc.ClientMethod<$2.CreateCatRequest, $2.CatInfo>(
      '/xplago.CatService/createCat',
      ($2.CreateCatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.CatInfo.fromBuffer(value));

  CatServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$2.CatInfo> getCat($2.GetCatRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCat, request, options: options);
  }

  $grpc.ResponseStream<$2.CatInfo> getCats($async.Stream<$2.GetCatRequest> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getCats, request, options: options);
  }

  $grpc.ResponseFuture<$2.CatInfo> createCat($2.CreateCatRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createCat, request, options: options);
  }
}

@$pb.GrpcServiceName('xplago.CatService')
abstract class CatServiceBase extends $grpc.Service {
  $core.String get $name => 'xplago.CatService';

  CatServiceBase() {
    $addMethod($grpc.ServiceMethod<$2.GetCatRequest, $2.CatInfo>(
        'getCat',
        getCat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.GetCatRequest.fromBuffer(value),
        ($2.CatInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.GetCatRequest, $2.CatInfo>(
        'getCats',
        getCats,
        true,
        true,
        ($core.List<$core.int> value) => $2.GetCatRequest.fromBuffer(value),
        ($2.CatInfo value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.CreateCatRequest, $2.CatInfo>(
        'createCat',
        createCat_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.CreateCatRequest.fromBuffer(value),
        ($2.CatInfo value) => value.writeToBuffer()));
  }

  $async.Future<$2.CatInfo> getCat_Pre($grpc.ServiceCall call, $async.Future<$2.GetCatRequest> request) async {
    return getCat(call, await request);
  }

  $async.Future<$2.CatInfo> createCat_Pre($grpc.ServiceCall call, $async.Future<$2.CreateCatRequest> request) async {
    return createCat(call, await request);
  }

  $async.Future<$2.CatInfo> getCat($grpc.ServiceCall call, $2.GetCatRequest request);
  $async.Stream<$2.CatInfo> getCats($grpc.ServiceCall call, $async.Stream<$2.GetCatRequest> request);
  $async.Future<$2.CatInfo> createCat($grpc.ServiceCall call, $2.CreateCatRequest request);
}
