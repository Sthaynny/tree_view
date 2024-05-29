import 'package:equatable/equatable.dart';
import 'package:tree_view/features/home/utils/sensor_status_enum.dart';

class AssetsEntity extends Equatable {
  final String id;
  final String name;
  final SensorStatusEnum status;
  final String? locationId;
  final String? parentId;
  final String? gatewayId;
  final String? sensorId;
  final String? sensorType;

  const AssetsEntity({
    required this.id,
    required this.name,
    this.status = SensorStatusEnum.empty,
    this.locationId,
    this.parentId,
    this.gatewayId,
    this.sensorId,
    this.sensorType,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        locationId,
        parentId,
        gatewayId,
        sensorId,
        sensorType,
      ];
}
