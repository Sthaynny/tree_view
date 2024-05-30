import 'package:tree_view/features/common/domain/entities/location_entity.dart';

class LocationModel extends LocationEntity {
  const LocationModel({
    required super.id,
    required super.name,
    super.parentId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'parentId': parentId,
    };
  }

  factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      id: map['id'],
      name: map['name'],
      parentId: map['parentId'],
    );
  }
}
