// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:tree_view/features/common/domain/entities/base_entity.dart';

class CompanyEntity extends BaseEntity {
  const CompanyEntity({
    required super.id,
    required super.name,
  });

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'name': name,
  //   };
  // }

  // factory CompanyEntity.fromMap(Map<String, dynamic> map) {
  //   return CompanyEntity(
  //     id: map['id'] as String,
  //     name: map['name'] as String,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory CompanyEntity.fromJson(String source) => CompanyEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
