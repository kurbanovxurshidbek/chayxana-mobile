import 'package:chayxana/models/role_model.dart';

class User {
  String? fullName;
  String? phoneNumber;
  String? verificationCode;
  int? id;
  String? updatedAt;
  String? updatedBy;
  String? createdBy;
  String? createdAt;
  Role role;
  String? address;
  String? language;
  String? imageUrl;
  String? bronCount;
  String? spamTime;
  String? disabled;
  String? accountNonExpired;
  String? accountNonLocked;
  String? credentialsNonExpired;
  bool? enabled;
  String? username;
  String? password;
  List<Map<String, dynamic>?> authorities;

  User({
    this.accountNonExpired,
    this.accountNonLocked,
    this.address,
    required this.authorities,
    this.bronCount,
    this.createdAt,
    this.createdBy,
    this.credentialsNonExpired,
    this.disabled,
    this.enabled,
    this.fullName,
    this.id,
    this.imageUrl,
    this.language,
    this.password,
    this.phoneNumber,
    required this.role,
    this.spamTime,
    this.updatedAt,
    this.updatedBy,
    this.username,
    this.verificationCode,
  });

  joJson() {
    return {
      "fullName": fullName,
      "phoneNumber": phoneNumber,
      "verificationCode": verificationCode,
      "id": id,
      "updatedAt": updatedAt,
      "updatedBy": updatedBy,
      "createdBy": createdBy,
      "createdAt": createdAt,
      "role": role.toJson(),
      "address": address,
      "language": language,
      "imageUrl": imageUrl,
      "bronCount": bronCount,
      "spamTime": spamTime,
      "disabled": disabled,
      "accountNonExpired": accountNonExpired,
      "accountNonLocked": accountNonLocked,
      "credentialsNonExpired": credentialsNonExpired,
      "enabled": enabled,
      "username": username,
      "password": password,
      "authorities": authorities,
    };
  }

  fromJson(Map<String, dynamic> json) {
    fullName = json["fullName"];
    phoneNumber = json["phoneNumber"];
    verificationCode = json["verificationCode"];
    id = json["id"];
    updatedAt = json["updatedAt"];
    updatedBy = json["updatedBy"];
    createdBy = json["createdBy"];
    createdAt = json["createdAt"];
    role = Role.fromJson(json["role"]);
    address = json["address"];
    language = json["language"];
    imageUrl = json["imageUrl"];
    bronCount = json["bronCount"];
    spamTime = json["spamTime"];
    disabled = json["disabled"];
    accountNonExpired = json["accountNonExpired"];
    accountNonLocked = json["accountNonLocked"];
    credentialsNonExpired = json["credentialsNonExpired"];
    enabled = json["enabled"];
    username = json["username"];
    password = json["password"];
    authorities = json["authorities"];
  }
}
