// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_person_list_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelEmployeeDataAdapter extends TypeAdapter<ModelEmployeeData> {
  @override
  final int typeId = 0;

  @override
  ModelEmployeeData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelEmployeeData(
      id: fields[0] as int?,
      name: fields[1] as String?,
      username: fields[2] as String?,
      email: fields[3] as String?,
      profileImage: fields[4] as String?,
      address: fields[5] as Address?,
      phone: fields[6] as String?,
      website: fields[7] as String?,
      company: fields[8] as Company?,
    );
  }

  @override
  void write(BinaryWriter writer, ModelEmployeeData obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.profileImage)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.phone)
      ..writeByte(7)
      ..write(obj.website)
      ..writeByte(8)
      ..write(obj.company);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelEmployeeDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class GeoAdapter extends TypeAdapter<Geo> {
  @override
  final int typeId = 1;

  @override
  Geo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Geo(
      lat: fields[0] as String?,
      lng: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Geo obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.lat)
      ..writeByte(1)
      ..write(obj.lng);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CompanyAdapter extends TypeAdapter<Company> {
  @override
  final int typeId = 2;

  @override
  Company read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Company(
      name: fields[0] as String?,
      catchPhrase: fields[1] as String?,
      bs: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Company obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.catchPhrase)
      ..writeByte(2)
      ..write(obj.bs);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AddressAdapter extends TypeAdapter<Address> {
  @override
  final int typeId = 3;

  @override
  Address read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Address(
      street: fields[0] as String?,
      suite: fields[1] as String?,
      city: fields[2] as String?,
      zipcode: fields[3] as String?,
      geo: fields[4] as Geo?,
    );
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.street)
      ..writeByte(1)
      ..write(obj.suite)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.zipcode)
      ..writeByte(4)
      ..write(obj.geo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelEmployeeData _$ModelEmployeeDataFromJson(Map<String, dynamic> json) {
  return ModelEmployeeData(
    id: json['id'] as int?,
    name: json['name'] as String?,
    username: json['username'] as String?,
    email: json['email'] as String?,
    profileImage: json['profile_image'] as String?,
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    phone: json['phone'] as String?,
    website: json['website'] as String?,
    company: json['company'] == null
        ? null
        : Company.fromJson(json['company'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ModelEmployeeDataToJson(ModelEmployeeData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'profile_image': instance.profileImage,
      'address': instance.address,
      'phone': instance.phone,
      'website': instance.website,
      'company': instance.company,
    };

Geo _$GeoFromJson(Map<String, dynamic> json) {
  return Geo(
    lat: json['lat'] as String?,
    lng: json['lng'] as String?,
  );
}

Map<String, dynamic> _$GeoToJson(Geo instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return Company(
    name: json['name'] as String?,
    catchPhrase: json['catchPhrase'] as String?,
    bs: json['bs'] as String?,
  );
}

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'name': instance.name,
      'catchPhrase': instance.catchPhrase,
      'bs': instance.bs,
    };

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    street: json['street'] as String?,
    suite: json['suite'] as String?,
    city: json['city'] as String?,
    zipcode: json['zipcode'] as String?,
    geo: json['geo'] == null
        ? null
        : Geo.fromJson(json['geo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'zipcode': instance.zipcode,
      'geo': instance.geo,
    };
