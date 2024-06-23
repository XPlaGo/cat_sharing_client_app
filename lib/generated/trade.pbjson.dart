//
//  Generated code. Do not modify.
//  source: trade.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createSaleOfferRequestDescriptor instead')
const CreateSaleOfferRequest$json = {
  '1': 'CreateSaleOfferRequest',
  '2': [
    {'1': 'catId', '3': 1, '4': 1, '5': 3, '10': 'catId'},
    {'1': 'price', '3': 2, '4': 1, '5': 11, '6': '.xplago.Money', '10': 'price'},
    {'1': 'comment', '3': 3, '4': 1, '5': 9, '10': 'comment'},
  ],
};

/// Descriptor for `CreateSaleOfferRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSaleOfferRequestDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVTYWxlT2ZmZXJSZXF1ZXN0EhQKBWNhdElkGAEgASgDUgVjYXRJZBIjCgVwcmljZR'
    'gCIAEoCzINLnhwbGFnby5Nb25leVIFcHJpY2USGAoHY29tbWVudBgDIAEoCVIHY29tbWVudA==');

@$core.Deprecated('Use saleOfferInfoDescriptor instead')
const SaleOfferInfo$json = {
  '1': 'SaleOfferInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'catId', '3': 2, '4': 1, '5': 3, '10': 'catId'},
    {'1': 'price', '3': 3, '4': 1, '5': 11, '6': '.xplago.Money', '10': 'price'},
    {'1': 'comment', '3': 4, '4': 1, '5': 9, '10': 'comment'},
    {'1': 'sellerOwnerId', '3': 5, '4': 1, '5': 3, '10': 'sellerOwnerId'},
    {'1': 'status', '3': 6, '4': 1, '5': 9, '10': 'status'},
    {'1': 'created', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'created'},
    {'1': 'modified', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'modified'},
  ],
};

/// Descriptor for `SaleOfferInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saleOfferInfoDescriptor = $convert.base64Decode(
    'Cg1TYWxlT2ZmZXJJbmZvEg4KAmlkGAEgASgJUgJpZBIUCgVjYXRJZBgCIAEoA1IFY2F0SWQSIw'
    'oFcHJpY2UYAyABKAsyDS54cGxhZ28uTW9uZXlSBXByaWNlEhgKB2NvbW1lbnQYBCABKAlSB2Nv'
    'bW1lbnQSJAoNc2VsbGVyT3duZXJJZBgFIAEoA1INc2VsbGVyT3duZXJJZBIWCgZzdGF0dXMYBi'
    'ABKAlSBnN0YXR1cxI0CgdjcmVhdGVkGAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFt'
    'cFIHY3JlYXRlZBI2Cghtb2RpZmllZBgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbX'
    'BSCG1vZGlmaWVk');

@$core.Deprecated('Use saleOfferFullInfoDescriptor instead')
const SaleOfferFullInfo$json = {
  '1': 'SaleOfferFullInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'cat', '3': 2, '4': 1, '5': 11, '6': '.xplago.CatShortInfo', '10': 'cat'},
    {'1': 'price', '3': 3, '4': 1, '5': 11, '6': '.xplago.Money', '10': 'price'},
    {'1': 'comment', '3': 4, '4': 1, '5': 9, '10': 'comment'},
    {'1': 'sellerOwnerId', '3': 5, '4': 1, '5': 3, '10': 'sellerOwnerId'},
    {'1': 'status', '3': 6, '4': 1, '5': 9, '10': 'status'},
    {'1': 'created', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'created'},
    {'1': 'modified', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'modified'},
  ],
};

/// Descriptor for `SaleOfferFullInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saleOfferFullInfoDescriptor = $convert.base64Decode(
    'ChFTYWxlT2ZmZXJGdWxsSW5mbxIOCgJpZBgBIAEoCVICaWQSJgoDY2F0GAIgASgLMhQueHBsYW'
    'dvLkNhdFNob3J0SW5mb1IDY2F0EiMKBXByaWNlGAMgASgLMg0ueHBsYWdvLk1vbmV5UgVwcmlj'
    'ZRIYCgdjb21tZW50GAQgASgJUgdjb21tZW50EiQKDXNlbGxlck93bmVySWQYBSABKANSDXNlbG'
    'xlck93bmVySWQSFgoGc3RhdHVzGAYgASgJUgZzdGF0dXMSNAoHY3JlYXRlZBgHIAEoCzIaLmdv'
    'b2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSB2NyZWF0ZWQSNgoIbW9kaWZpZWQYCCABKAsyGi5nb2'
    '9nbGUucHJvdG9idWYuVGltZXN0YW1wUghtb2RpZmllZA==');

@$core.Deprecated('Use catShortInfoDescriptor instead')
const CatShortInfo$json = {
  '1': 'CatShortInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'birthday', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'birthday'},
    {'1': 'ownerId', '3': 4, '4': 1, '5': 3, '10': 'ownerId'},
    {'1': 'avatarId', '3': 6, '4': 1, '5': 9, '10': 'avatarId'},
  ],
};

/// Descriptor for `CatShortInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List catShortInfoDescriptor = $convert.base64Decode(
    'CgxDYXRTaG9ydEluZm8SDgoCaWQYASABKANSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSNgoIYm'
    'lydGhkYXkYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUghiaXJ0aGRheRIYCgdv'
    'd25lcklkGAQgASgDUgdvd25lcklkEhoKCGF2YXRhcklkGAYgASgJUghhdmF0YXJJZA==');

@$core.Deprecated('Use buyTransactionInfoDescriptor instead')
const BuyTransactionInfo$json = {
  '1': 'BuyTransactionInfo',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 9, '10': 'status'},
    {'1': 'reason', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'reason', '17': true},
  ],
  '8': [
    {'1': '_reason'},
  ],
};

/// Descriptor for `BuyTransactionInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buyTransactionInfoDescriptor = $convert.base64Decode(
    'ChJCdXlUcmFuc2FjdGlvbkluZm8SFgoGc3RhdHVzGAEgASgJUgZzdGF0dXMSGwoGcmVhc29uGA'
    'IgASgJSABSBnJlYXNvbogBAUIJCgdfcmVhc29u');

@$core.Deprecated('Use buyRequestDescriptor instead')
const BuyRequest$json = {
  '1': 'BuyRequest',
  '2': [
    {'1': 'saleOfferId', '3': 1, '4': 1, '5': 9, '10': 'saleOfferId'},
  ],
};

/// Descriptor for `BuyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List buyRequestDescriptor = $convert.base64Decode(
    'CgpCdXlSZXF1ZXN0EiAKC3NhbGVPZmZlcklkGAEgASgJUgtzYWxlT2ZmZXJJZA==');

