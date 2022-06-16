// ignore_for_file: unused_element

class NearChayxana {
  String? chayxanaId;
  String? userId;
  _AddressDto? addressDto;
  String? chayxanaName;
  String? descriptionUz;
  String? descriptionRu;
  String? descriptionEn;
  String? startTime;
  String? endTime;
  String? phoneNumber;
  int? roomNumber;
  double? price;
  List? chayxanaDetailDtos;
  bool? active;

  NearChayxana(
      {this.active,
      this.addressDto,
      this.chayxanaDetailDtos,
      this.chayxanaId,
      this.chayxanaName,
      this.descriptionEn,
      this.descriptionRu,
      this.descriptionUz,
      this.endTime,
      this.phoneNumber,
      this.price,
      this.roomNumber,
      this.startTime,
      this.userId});

  NearChayxana.fromJson(Map<String, dynamic> json) {
    chayxanaId = json["id"];
    userId = json["userId"];
    addressDto = _AddressDto.fromJson(json["addressDto"]);
    chayxanaName = json["chayxanaName"];
    descriptionUz = json["descriptionUz"];
    descriptionEn = json["descriptionEn"];
    descriptionRu = json["descriptionRu"];
    startTime = json["startTime"];
    endTime = json["endTime"];
    phoneNumber = json["phoneNumber"];
    roomNumber = json["roomNumber"];
    price = json["price"];
    chayxanaDetailDtos = json["chayxanaDetailDtos"];
    active = json["active"];
  }
}

class _AddressDto {
  String? id;
  String? streetName;
  double? lan;
  double? lat;
  _DistrictDto? districtDto;

  _AddressDto({this.id, this.streetName, this.lan, this.districtDto, this.lat});

  _AddressDto.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    streetName = json["streetName"];
    lan = json["lan"];
    lat = json["lat"];
    districtDto = _DistrictDto.fromJson(json["districtDto"]);
  }

  toJson() {
    return {
      "id": id,
      "streetName": streetName,
      "lan": lan,
      "lat": lat,
      "districtDto": districtDto!.toJson(),
    };
  }
}

class _DistrictDto {
  String? id;
  String? name;
  double? regionDto;

  _DistrictDto({this.id, this.name, this.regionDto});

  _DistrictDto.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    regionDto = json["regionDto"];
  }

  toJson() {
    return {"id": id, "name": name, "regionDto": regionDto};
  }
}
