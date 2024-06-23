//
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use sendEmailRequestDescriptor instead')
const SendEmailRequest$json = {
  '1': 'SendEmailRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `SendEmailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendEmailRequestDescriptor = $convert.base64Decode(
    'ChBTZW5kRW1haWxSZXF1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbWFpbA==');

@$core.Deprecated('Use sendVerificationCodeRequestDescriptor instead')
const SendVerificationCodeRequest$json = {
  '1': 'SendVerificationCodeRequest',
  '2': [
    {'1': 'verificationCode', '3': 1, '4': 1, '5': 9, '10': 'verificationCode'},
  ],
};

/// Descriptor for `SendVerificationCodeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendVerificationCodeRequestDescriptor = $convert.base64Decode(
    'ChtTZW5kVmVyaWZpY2F0aW9uQ29kZVJlcXVlc3QSKgoQdmVyaWZpY2F0aW9uQ29kZRgBIAEoCV'
    'IQdmVyaWZpY2F0aW9uQ29kZQ==');

@$core.Deprecated('Use signUpRequestDescriptor instead')
const SignUpRequest$json = {
  '1': 'SignUpRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'birthday', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'birthday'},
    {'1': 'password', '3': 3, '4': 1, '5': 9, '10': 'password'},
    {'1': 'avatar', '3': 4, '4': 1, '5': 9, '10': 'avatar'},
  ],
};

/// Descriptor for `SignUpRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signUpRequestDescriptor = $convert.base64Decode(
    'Cg1TaWduVXBSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWUSNgoIYmlydGhkYXkYAiABKAsyGi'
    '5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUghiaXJ0aGRheRIaCghwYXNzd29yZBgDIAEoCVII'
    'cGFzc3dvcmQSFgoGYXZhdGFyGAQgASgJUgZhdmF0YXI=');

@$core.Deprecated('Use signInRequestDescriptor instead')
const SignInRequest$json = {
  '1': 'SignInRequest',
  '2': [
    {'1': 'password', '3': 1, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `SignInRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signInRequestDescriptor = $convert.base64Decode(
    'Cg1TaWduSW5SZXF1ZXN0EhoKCHBhc3N3b3JkGAEgASgJUghwYXNzd29yZA==');

@$core.Deprecated('Use plainTokenResponseDescriptor instead')
const PlainTokenResponse$json = {
  '1': 'PlainTokenResponse',
  '2': [
    {'1': 'accessToken', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
  ],
};

/// Descriptor for `PlainTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List plainTokenResponseDescriptor = $convert.base64Decode(
    'ChJQbGFpblRva2VuUmVzcG9uc2USIAoLYWNjZXNzVG9rZW4YASABKAlSC2FjY2Vzc1Rva2Vu');

@$core.Deprecated('Use verifiedTokenResponseDescriptor instead')
const VerifiedTokenResponse$json = {
  '1': 'VerifiedTokenResponse',
  '2': [
    {'1': 'accessToken', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'userExists', '3': 2, '4': 1, '5': 8, '10': 'userExists'},
  ],
};

/// Descriptor for `VerifiedTokenResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List verifiedTokenResponseDescriptor = $convert.base64Decode(
    'ChVWZXJpZmllZFRva2VuUmVzcG9uc2USIAoLYWNjZXNzVG9rZW4YASABKAlSC2FjY2Vzc1Rva2'
    'VuEh4KCnVzZXJFeGlzdHMYAiABKAhSCnVzZXJFeGlzdHM=');

@$core.Deprecated('Use userInfoDescriptor instead')
const UserInfo$json = {
  '1': 'UserInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'email', '3': 2, '4': 1, '5': 9, '10': 'email'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'birthday', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'birthday'},
    {'1': 'avatar', '3': 5, '4': 1, '5': 9, '10': 'avatar'},
    {'1': 'isBlocked', '3': 6, '4': 1, '5': 8, '10': 'isBlocked'},
  ],
};

/// Descriptor for `UserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoDescriptor = $convert.base64Decode(
    'CghVc2VySW5mbxIOCgJpZBgBIAEoA1ICaWQSFAoFZW1haWwYAiABKAlSBWVtYWlsEhIKBG5hbW'
    'UYAyABKAlSBG5hbWUSNgoIYmlydGhkYXkYBCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0'
    'YW1wUghiaXJ0aGRheRIWCgZhdmF0YXIYBSABKAlSBmF2YXRhchIcCglpc0Jsb2NrZWQYBiABKA'
    'hSCWlzQmxvY2tlZA==');

@$core.Deprecated('Use tokenWithUserResponseDescriptor instead')
const TokenWithUserResponse$json = {
  '1': 'TokenWithUserResponse',
  '2': [
    {'1': 'accessToken', '3': 1, '4': 1, '5': 9, '10': 'accessToken'},
    {'1': 'userInfo', '3': 2, '4': 1, '5': 11, '6': '.xplago.UserInfo', '10': 'userInfo'},
  ],
};

/// Descriptor for `TokenWithUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tokenWithUserResponseDescriptor = $convert.base64Decode(
    'ChVUb2tlbldpdGhVc2VyUmVzcG9uc2USIAoLYWNjZXNzVG9rZW4YASABKAlSC2FjY2Vzc1Rva2'
    'VuEiwKCHVzZXJJbmZvGAIgASgLMhAueHBsYWdvLlVzZXJJbmZvUgh1c2VySW5mbw==');

@$core.Deprecated('Use getUserByEmailRequestDescriptor instead')
const GetUserByEmailRequest$json = {
  '1': 'GetUserByEmailRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `GetUserByEmailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserByEmailRequestDescriptor = $convert.base64Decode(
    'ChVHZXRVc2VyQnlFbWFpbFJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWls');

