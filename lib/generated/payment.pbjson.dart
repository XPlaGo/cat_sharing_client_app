//
//  Generated code. Do not modify.
//  source: payment.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use moneyDescriptor instead')
const Money$json = {
  '1': 'Money',
  '2': [
    {'1': 'units', '3': 2, '4': 1, '5': 3, '10': 'units'},
    {'1': 'nanos', '3': 3, '4': 1, '5': 5, '10': 'nanos'},
  ],
};

/// Descriptor for `Money`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List moneyDescriptor = $convert.base64Decode(
    'CgVNb25leRIUCgV1bml0cxgCIAEoA1IFdW5pdHMSFAoFbmFub3MYAyABKAVSBW5hbm9z');

@$core.Deprecated('Use accountInfoDescriptor instead')
const AccountInfo$json = {
  '1': 'AccountInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'amount', '3': 2, '4': 1, '5': 11, '6': '.xplago.Money', '10': 'amount'},
    {'1': 'userId', '3': 3, '4': 1, '5': 3, '10': 'userId'},
  ],
};

/// Descriptor for `AccountInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountInfoDescriptor = $convert.base64Decode(
    'CgtBY2NvdW50SW5mbxIOCgJpZBgBIAEoCVICaWQSJQoGYW1vdW50GAIgASgLMg0ueHBsYWdvLk'
    '1vbmV5UgZhbW91bnQSFgoGdXNlcklkGAMgASgDUgZ1c2VySWQ=');

@$core.Deprecated('Use accountsInfoDescriptor instead')
const AccountsInfo$json = {
  '1': 'AccountsInfo',
  '2': [
    {'1': 'accounts', '3': 1, '4': 3, '5': 11, '6': '.xplago.AccountInfo', '10': 'accounts'},
  ],
};

/// Descriptor for `AccountsInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List accountsInfoDescriptor = $convert.base64Decode(
    'CgxBY2NvdW50c0luZm8SLwoIYWNjb3VudHMYASADKAsyEy54cGxhZ28uQWNjb3VudEluZm9SCG'
    'FjY291bnRz');

@$core.Deprecated('Use publicAccountInfoDescriptor instead')
const PublicAccountInfo$json = {
  '1': 'PublicAccountInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'user', '3': 2, '4': 1, '5': 11, '6': '.xplago.UserInfo', '10': 'user'},
  ],
};

/// Descriptor for `PublicAccountInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List publicAccountInfoDescriptor = $convert.base64Decode(
    'ChFQdWJsaWNBY2NvdW50SW5mbxIOCgJpZBgBIAEoCVICaWQSJAoEdXNlchgCIAEoCzIQLnhwbG'
    'Fnby5Vc2VySW5mb1IEdXNlcg==');

@$core.Deprecated('Use getAccountByEmailRequestDescriptor instead')
const GetAccountByEmailRequest$json = {
  '1': 'GetAccountByEmailRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `GetAccountByEmailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAccountByEmailRequestDescriptor = $convert.base64Decode(
    'ChhHZXRBY2NvdW50QnlFbWFpbFJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWls');

@$core.Deprecated('Use paymentAccountExistsByIdAndUserIdRequestDescriptor instead')
const PaymentAccountExistsByIdAndUserIdRequest$json = {
  '1': 'PaymentAccountExistsByIdAndUserIdRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'userId', '3': 2, '4': 1, '5': 3, '10': 'userId'},
  ],
};

/// Descriptor for `PaymentAccountExistsByIdAndUserIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paymentAccountExistsByIdAndUserIdRequestDescriptor = $convert.base64Decode(
    'CihQYXltZW50QWNjb3VudEV4aXN0c0J5SWRBbmRVc2VySWRSZXF1ZXN0Eg4KAmlkGAEgASgJUg'
    'JpZBIWCgZ1c2VySWQYAiABKANSBnVzZXJJZA==');

@$core.Deprecated('Use transferRequestDescriptor instead')
const TransferRequest$json = {
  '1': 'TransferRequest',
  '2': [
    {'1': 'senderAccountId', '3': 1, '4': 1, '5': 9, '10': 'senderAccountId'},
    {'1': 'receiverAccountId', '3': 2, '4': 1, '5': 9, '10': 'receiverAccountId'},
    {'1': 'amount', '3': 3, '4': 1, '5': 11, '6': '.xplago.Money', '10': 'amount'},
    {'1': 'comment', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'comment', '17': true},
  ],
  '8': [
    {'1': '_comment'},
  ],
};

/// Descriptor for `TransferRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transferRequestDescriptor = $convert.base64Decode(
    'Cg9UcmFuc2ZlclJlcXVlc3QSKAoPc2VuZGVyQWNjb3VudElkGAEgASgJUg9zZW5kZXJBY2NvdW'
    '50SWQSLAoRcmVjZWl2ZXJBY2NvdW50SWQYAiABKAlSEXJlY2VpdmVyQWNjb3VudElkEiUKBmFt'
    'b3VudBgDIAEoCzINLnhwbGFnby5Nb25leVIGYW1vdW50Eh0KB2NvbW1lbnQYBCABKAlIAFIHY2'
    '9tbWVudIgBAUIKCghfY29tbWVudA==');

@$core.Deprecated('Use replenishRequestDescriptor instead')
const ReplenishRequest$json = {
  '1': 'ReplenishRequest',
  '2': [
    {'1': 'receiverAccountId', '3': 1, '4': 1, '5': 9, '10': 'receiverAccountId'},
    {'1': 'amount', '3': 2, '4': 1, '5': 11, '6': '.xplago.Money', '10': 'amount'},
    {'1': 'comment', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'comment', '17': true},
  ],
  '8': [
    {'1': '_comment'},
  ],
};

/// Descriptor for `ReplenishRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replenishRequestDescriptor = $convert.base64Decode(
    'ChBSZXBsZW5pc2hSZXF1ZXN0EiwKEXJlY2VpdmVyQWNjb3VudElkGAEgASgJUhFyZWNlaXZlck'
    'FjY291bnRJZBIlCgZhbW91bnQYAiABKAsyDS54cGxhZ28uTW9uZXlSBmFtb3VudBIdCgdjb21t'
    'ZW50GAMgASgJSABSB2NvbW1lbnSIAQFCCgoIX2NvbW1lbnQ=');

@$core.Deprecated('Use transactionInfoDescriptor instead')
const TransactionInfo$json = {
  '1': 'TransactionInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `TransactionInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionInfoDescriptor = $convert.base64Decode(
    'Cg9UcmFuc2FjdGlvbkluZm8SDgoCaWQYASABKAlSAmlkEhYKBnN0YXR1cxgCIAEoCVIGc3RhdH'
    'Vz');

