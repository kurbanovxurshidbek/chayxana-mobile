class Role {
  String? createdBy;
  String? createdAt;
  String? updatedBy;
  String? updatedAt;
  String? id;
  String? roleName;
  String? authority;

  Role({
    this.authority,
    this.createdAt,
    this.createdBy,
    this.id,
    this.roleName,
    this.updatedAt,
    this.updatedBy,
  });

  toJson() {
    return {
      "createdBy": createdBy,
      "createdAt": createdAt,
      "updatedBy": updatedBy,
      "updatedAt": updatedAt,
      "id": id,
      "roleName": roleName,
      "authority": authority
    };
  }

  Role.fromJson(Map<String, dynamic> json) {
    createdBy = json["createdBy"];
    createdAt = json["createdAt"];
    updatedBy = json["updatedBy"];
    updatedAt = json["updatedAt"];
    id = json["id"];
    roleName = json["roleName"];
    authority = json["authority"];
  }
}
