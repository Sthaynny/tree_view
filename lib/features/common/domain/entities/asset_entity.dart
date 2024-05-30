import 'package:tree_view/features/common/domain/entities/base_entity.dart';
import 'package:tree_view/features/home/utils/sensor_status_enum.dart';

class AssetsEntity extends BaseEntity {
  final SensorStatusEnum status;
  final String? locationId;
  final String? parentId;
  final String? gatewayId;
  final String? sensorId;
  final String? sensorType;

  const AssetsEntity({
    required super.id,
    required super.name,
    this.status = SensorStatusEnum.empty,
    this.locationId,
    this.parentId,
    this.gatewayId,
    this.sensorId,
    this.sensorType,
  });

  @override
  List<Object?> get props => [
        super.props,
        status,
        locationId,
        parentId,
        gatewayId,
        sensorId,
        sensorType,
      ];
}
