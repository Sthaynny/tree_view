import 'package:tree_view/features/common/domain/entities/company_entity.dart';

class CompanyModel extends CompanyEntity {
  const CompanyModel({
    required super.id,
    required super.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      id: map['id'] as String,
      name: map['name'] as String,
    );
  }
}
