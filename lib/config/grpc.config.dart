class GrpcServiceConfig {
  final String host;
  final int port;

  GrpcServiceConfig({
    required this.host,
    required this.port,
  });

  Map<String, dynamic> toMap() {
    return {
      "host": host,
      "port": port,
    };
  }

  GrpcServiceConfig.fromMap(Map<String, dynamic> map)
      : host = map["host"] as String,
        port = map["port"] as int;
}
