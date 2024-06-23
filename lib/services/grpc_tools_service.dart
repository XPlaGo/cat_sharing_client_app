import 'dart:convert';

import 'package:grpc/grpc.dart';

class GrpcToolsService {
  static Map<String, dynamic>? extractErrorsFromTrailers(GrpcError error) {
    if (error.trailers?["errors"] == null) return null;
    return json.decode(error.trailers?["errors"] as String);
  }
}