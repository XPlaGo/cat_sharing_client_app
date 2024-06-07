import 'package:cat_sharing_client_app/generated/auth.pb.dart';
import 'package:protobuf/protobuf.dart' as pb;
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static final factories = <Type, Function>{
    UserInfo: (String json) => UserInfo.fromJson(json),
    TokenWithUserResponse: (String json) => TokenWithUserResponse.fromJson(json),
  };

  static T make<T extends pb.GeneratedMessage>(String json) {
    return factories[T]!(json);
  }

  static Future<T?> getGeneratedMessage<T extends pb.GeneratedMessage>(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(key);
    if (data == null) return null;
    return make<T>(data);
  }

  static Future<void> saveString(String key, String? value) async {
    if (value == null) throw Exception("Passed by key: \"$key\" value is null");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(key);
    if (data == null) throw Exception("Value by key: \"$key\" is null");
    return data;
  }

  static Future<void> saveGeneratedMessage<T extends pb.GeneratedMessage>(String key, T generatedMessage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, generatedMessage.writeToJson());
  }

  static Future<void> remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }
}