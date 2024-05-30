import 'package:tree_view/features/common/domain/entities/base_entity.dart';

class LocationEntity extends BaseEntity {
  final String? parentId;

  const LocationEntity({
    required super.id,
    required super.name,
    this.parentId,
  });

  @override
  List<Object?> get props => [
        super.props,
        parentId,
      ];

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'name': name,
  //     'parentId': parentId,
  //   };
  // }

  // factory LocationEntity.fromMap(Map<String, dynamic> map) {
  //   return LocationEntity(
  //     id: map['id'] as String,
  //     name: map['name'] as String,
  //     parentId: map['parentId'] != null ? map['parentId'] as String : null,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory LocationEntity.fromJson(String source) => LocationEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
