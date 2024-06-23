//
//  Generated code. Do not modify.
//  source: auth.proto
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

import 'auth.pb.dart' as $0;
import 'google/protobuf/empty.pb.dart' as $1;

export 'auth.pb.dart';

@$pb.GrpcServiceName('xplago.AuthService')
class AuthServiceClient extends $grpc.Client {
  static final _$sendEmail = $grpc.ClientMethod<$0.SendEmailRequest, $0.PlainTokenResponse>(
      '/xplago.AuthService/sendEmail',
      ($0.SendEmailRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PlainTokenResponse.fromBuffer(value));
  static final _$sendVerificationCode = $grpc.ClientMethod<$0.SendVerificationCodeRequest, $0.VerifiedTokenResponse>(
      '/xplago.AuthService/sendVerificationCode',
      ($0.SendVerificationCodeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.VerifiedTokenResponse.fromBuffer(value));
  static final _$signUp = $grpc.ClientMethod<$0.SignUpRequest, $0.TokenWithUserResponse>(
      '/xplago.AuthService/signUp',
      ($0.SignUpRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TokenWithUserResponse.fromBuffer(value));
  static final _$signIn = $grpc.ClientMethod<$0.SignInRequest, $0.TokenWithUserResponse>(
      '/xplago.AuthService/signIn',
      ($0.SignInRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TokenWithUserResponse.fromBuffer(value));
  static final _$refresh = $grpc.ClientMethod<$1.Empty, $0.TokenWithUserResponse>(
      '/xplago.AuthService/refresh',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.TokenWithUserResponse.fromBuffer(value));

  AuthServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.PlainTokenResponse> sendEmail($0.SendEmailRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendEmail, request, options: options);
  }

  $grpc.ResponseFuture<$0.VerifiedTokenResponse> sendVerificationCode($0.SendVerificationCodeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$sendVerificationCode, request, options: options);
  }

  $grpc.ResponseFuture<$0.TokenWithUserResponse> signUp($0.SignUpRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signUp, request, options: options);
  }

  $grpc.ResponseFuture<$0.TokenWithUserResponse> signIn($0.SignInRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$signIn, request, options: options);
  }

  $grpc.ResponseFuture<$0.TokenWithUserResponse> refresh($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$refresh, request, options: options);
  }
}

@$pb.GrpcServiceName('xplago.AuthService')
abstract class AuthServiceBase extends $grpc.Service {
  $core.String get $name => 'xplago.AuthService';

  AuthServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.SendEmailRequest, $0.PlainTokenResponse>(
        'sendEmail',
        sendEmail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SendEmailRequest.fromBuffer(value),
        ($0.PlainTokenResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SendVerificationCodeRequest, $0.VerifiedTokenResponse>(
        'sendVerificationCode',
        sendVerificationCode_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SendVerificationCodeRequest.fromBuffer(value),
        ($0.VerifiedTokenResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SignUpRequest, $0.TokenWithUserResponse>(
        'signUp',
        signUp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignUpRequest.fromBuffer(value),
        ($0.TokenWithUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SignInRequest, $0.TokenWithUserResponse>(
        'signIn',
        signIn_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SignInRequest.fromBuffer(value),
        ($0.TokenWithUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.TokenWithUserResponse>(
        'refresh',
        refresh_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.TokenWithUserResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.PlainTokenResponse> sendEmail_Pre($grpc.ServiceCall call, $async.Future<$0.SendEmailRequest> request) async {
    return sendEmail(call, await request);
  }

  $async.Future<$0.VerifiedTokenResponse> sendVerificationCode_Pre($grpc.ServiceCall call, $async.Future<$0.SendVerificationCodeRequest> request) async {
    return sendVerificationCode(call, await request);
  }

  $async.Future<$0.TokenWithUserResponse> signUp_Pre($grpc.ServiceCall call, $async.Future<$0.SignUpRequest> request) async {
    return signUp(call, await request);
  }

  $async.Future<$0.TokenWithUserResponse> signIn_Pre($grpc.ServiceCall call, $async.Future<$0.SignInRequest> request) async {
    return signIn(call, await request);
  }

  $async.Future<$0.TokenWithUserResponse> refresh_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return refresh(call, await request);
  }

  $async.Future<$0.PlainTokenResponse> sendEmail($grpc.ServiceCall call, $0.SendEmailRequest request);
  $async.Future<$0.VerifiedTokenResponse> sendVerificationCode($grpc.ServiceCall call, $0.SendVerificationCodeRequest request);
  $async.Future<$0.TokenWithUserResponse> signUp($grpc.ServiceCall call, $0.SignUpRequest request);
  $async.Future<$0.TokenWithUserResponse> signIn($grpc.ServiceCall call, $0.SignInRequest request);
  $async.Future<$0.TokenWithUserResponse> refresh($grpc.ServiceCall call, $1.Empty request);
}
@$pb.GrpcServiceName('xplago.UserService')
class UserServiceClient extends $grpc.Client {
  static final _$getUserByEmail = $grpc.ClientMethod<$0.GetUserByEmailRequest, $0.UserInfo>(
      '/xplago.UserService/getUserByEmail',
      ($0.GetUserByEmailRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserInfo.fromBuffer(value));

  UserServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.UserInfo> getUserByEmail($0.GetUserByEmailRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserByEmail, request, options: options);
  }
}

@$pb.GrpcServiceName('xplago.UserService')
abstract class UserServiceBase extends $grpc.Service {
  $core.String get $name => 'xplago.UserService';

  UserServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetUserByEmailRequest, $0.UserInfo>(
        'getUserByEmail',
        getUserByEmail_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUserByEmailRequest.fromBuffer(value),
        ($0.UserInfo value) => value.writeToBuffer()));
  }

  $async.Future<$0.UserInfo> getUserByEmail_Pre($grpc.ServiceCall call, $async.Future<$0.GetUserByEmailRequest> request) async {
    return getUserByEmail(call, await request);
  }

  $async.Future<$0.UserInfo> getUserByEmail($grpc.ServiceCall call, $0.GetUserByEmailRequest request);
}
