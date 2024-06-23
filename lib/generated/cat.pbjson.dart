//
//  Generated code. Do not modify.
//  source: cat.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use ownerInfoDescriptor instead')
const OwnerInfo$json = {
  '1': 'OwnerInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'userId', '3': 2, '4': 1, '5': 3, '10': 'userId'},
    {'1': 'cats_ids', '3': 3, '4': 3, '5': 3, '10': 'catsIds'},
    {'1': 'rented_cats_ids', '3': 4, '4': 3, '5': 3, '10': 'rentedCatsIds'},
  ],
};

/// Descriptor for `OwnerInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List ownerInfoDescriptor = $convert.base64Decode(
    'CglPd25lckluZm8SDgoCaWQYASABKANSAmlkEhYKBnVzZXJJZBgCIAEoA1IGdXNlcklkEhkKCG'
    'NhdHNfaWRzGAMgAygDUgdjYXRzSWRzEiYKD3JlbnRlZF9jYXRzX2lkcxgEIAMoA1INcmVudGVk'
    'Q2F0c0lkcw==');

@$core.Deprecated('Use catInfoDescriptor instead')
const CatInfo$json = {
  '1': 'CatInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'birthday', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'birthday'},
    {'1': 'ownerId', '3': 4, '4': 1, '5': 3, '10': 'ownerId'},
    {'1': 'tenantId', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Int64Value', '10': 'tenantId'},
    {'1': 'avatarId', '3': 6, '4': 1, '5': 9, '10': 'avatarId'},
  ],
};

/// Descriptor for `CatInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List catInfoDescriptor = $convert.base64Decode(
    'CgdDYXRJbmZvEg4KAmlkGAEgASgDUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEjYKCGJpcnRoZG'
    'F5GAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIIYmlydGhkYXkSGAoHb3duZXJJ'
    'ZBgEIAEoA1IHb3duZXJJZBI3Cgh0ZW5hbnRJZBgFIAEoCzIbLmdvb2dsZS5wcm90b2J1Zi5Jbn'
    'Q2NFZhbHVlUgh0ZW5hbnRJZBIaCghhdmF0YXJJZBgGIAEoCVIIYXZhdGFySWQ=');

@$core.Deprecated('Use getCatRequestDescriptor instead')
const GetCatRequest$json = {
  '1': 'GetCatRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
  ],
};

/// Descriptor for `GetCatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCatRequestDescriptor = $convert.base64Decode(
    'Cg1HZXRDYXRSZXF1ZXN0Eg4KAmlkGAEgASgDUgJpZA==');

@$core.Deprecated('Use createCatRequestDescriptor instead')
const CreateCatRequest$json = {
  '1': 'CreateCatRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'birthday', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'birthday'},
    {'1': 'avatarId', '3': 3, '4': 1, '5': 9, '10': 'avatarId'},
  ],
};

/// Descriptor for `CreateCatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCatRequestDescriptor = $convert.base64Decode(
    'ChBDcmVhdGVDYXRSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWUSNgoIYmlydGhkYXkYAiABKA'
    'syGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUghiaXJ0aGRheRIaCghhdmF0YXJJZBgDIAEo'
    'CVIIYXZhdGFySWQ=');

