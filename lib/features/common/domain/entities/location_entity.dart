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
}
