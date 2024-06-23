//
//  Generated code. Do not modify.
//  source: transaction.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use transactionDataInfoDescriptor instead')
const TransactionDataInfo$json = {
  '1': 'TransactionDataInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'amount', '3': 2, '4': 1, '5': 11, '6': '.xplago.Money', '10': 'amount'},
    {'1': 'senderAccountId', '3': 3, '4': 1, '5': 9, '10': 'senderAccountId'},
    {'1': 'receiverAccountId', '3': 4, '4': 1, '5': 9, '10': 'receiverAccountId'},
    {'1': 'status', '3': 5, '4': 1, '5': 9, '10': 'status'},
    {'1': 'comment', '3': 6, '4': 1, '5': 9, '10': 'comment'},
    {'1': 'created', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'created'},
    {'1': 'modified', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'modified'},
  ],
};

/// Descriptor for `TransactionDataInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionDataInfoDescriptor = $convert.base64Decode(
    'ChNUcmFuc2FjdGlvbkRhdGFJbmZvEg4KAmlkGAEgASgJUgJpZBIlCgZhbW91bnQYAiABKAsyDS'
    '54cGxhZ28uTW9uZXlSBmFtb3VudBIoCg9zZW5kZXJBY2NvdW50SWQYAyABKAlSD3NlbmRlckFj'
    'Y291bnRJZBIsChFyZWNlaXZlckFjY291bnRJZBgEIAEoCVIRcmVjZWl2ZXJBY2NvdW50SWQSFg'
    'oGc3RhdHVzGAUgASgJUgZzdGF0dXMSGAoHY29tbWVudBgGIAEoCVIHY29tbWVudBI0CgdjcmVh'
    'dGVkGAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIHY3JlYXRlZBI2Cghtb2RpZm'
    'llZBgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCG1vZGlmaWVk');

@$core.Deprecated('Use getMyTransactionsRequestDescriptor instead')
const GetMyTransactionsRequest$json = {
  '1': 'GetMyTransactionsRequest',
  '2': [
    {'1': 'accountId', '3': 1, '4': 1, '5': 9, '10': 'accountId'},
  ],
};

/// Descriptor for `GetMyTransactionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMyTransactionsRequestDescriptor = $convert.base64Decode(
    'ChhHZXRNeVRyYW5zYWN0aW9uc1JlcXVlc3QSHAoJYWNjb3VudElkGAEgASgJUglhY2NvdW50SW'
    'Q=');

