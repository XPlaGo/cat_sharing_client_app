import 'package:cat_sharing_client_app/generated/auth.pb.dart';

extension ToMapExtension on UserInfo {
  Map<String, dynamic> toMap() {
    return {
      "id": id.toString(),
      "email": email,
      "name": name,
      "birthday": birthday.toString(),
      "avatar": avatar,
      "isBlocked": isBlocked.toString(),
    };
  }
}