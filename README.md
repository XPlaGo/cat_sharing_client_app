# cat_sharing_client_app

CatSharing client application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# gRPC proto generation
```bash
protoc -I protos/ protos/auth.proto google/protobuf/timestamp.proto google/protobuf/empty.proto --dart_out=grpc:lib/generated
```