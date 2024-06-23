import 'dart:async';
import 'package:cat_sharing_client_app/config/app.config.dart';
import 'package:cat_sharing_client_app/generated/auth.pbgrpc.dart';
import 'package:cat_sharing_client_app/generated/google/protobuf/empty.pb.dart';
import 'package:cat_sharing_client_app/services/storage_service.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthService {

  late final ClientChannel channel;
  late final AuthServiceClient stub;

  AuthService(AppConfig appConfig) {
    channel = ClientChannel(
      appConfig.authService.host,
      port: appConfig.authService.port,
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    stub = AuthServiceClient(channel);
  }

  Future<PlainTokenResponse> sendEmail(String email) async {
    PlainTokenResponse response = await stub.sendEmail(SendEmailRequest(email: email)).onError((error, stackTrace) async {
      throw error as GrpcError;
    });
    await StorageService.saveString("accessToken", response.accessToken);
    return response;
  }

  Future<VerifiedTokenResponse> sendVerificationCode(String verificationCode) async {
    VerifiedTokenResponse response = await stub.sendVerificationCode(
      SendVerificationCodeRequest(verificationCode: verificationCode),
      options: await getAuthCallOptions(),
    );
    await StorageService.saveString("accessToken", response.accessToken);
    return response;
  }

  Future<TokenWithUserResponse> signIn(SignInRequest request) async {
    TokenWithUserResponse response = await stub.signIn(request, options: await getAuthCallOptions());
    await StorageService.saveString("accessToken", response.accessToken);
    await StorageService.saveGeneratedMessage("userInfo", response.userInfo);
    return response;
  }

  Future<TokenWithUserResponse> signUp(SignUpRequest request) async {
    TokenWithUserResponse response = await stub.signUp(request, options: await getAuthCallOptions());
    await StorageService.saveString("accessToken", response.accessToken);
    await StorageService.saveGeneratedMessage("userInfo", response.userInfo);
    return response;
  }

  Future<TokenWithUserResponse> refresh() async {
    TokenWithUserResponse response = await stub.refresh(Empty(), options: await getAuthCallOptions());
    await StorageService.saveString("accessToken", response.accessToken);
    await StorageService.saveGeneratedMessage("userInfo", response.userInfo);
    return response;
  }

  static Future<void> logoutLocal() async {
    await StorageService.remove("accessToken");
    await StorageService.remove("userInfo");
  }

  static Future<CallOptions> getAuthCallOptions() async {
    return CallOptions(
      metadata: {
        "Authorization": await getBearerToken(),
      }
    );
  }

  static Future<String> getBearerToken() async {
    return "Bearer ${await StorageService.getString("accessToken")}";
  }
}