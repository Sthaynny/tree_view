import 'package:tree_view/features/common/domain/entities/asset_entity.dart';
import 'package:tree_view/features/home/utils/sensor_status_enum.dart';

class AssetsModel extends AssetsEntity {
  const AssetsModel({
    required super.id,
    required super.name,
    super.status = SensorStatusEnum.empty,
    super.locationId,
    super.parentId,
    super.gatewayId,
    super.sensorId,
    super.sensorType,
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'status': status.name,
      'locationId': locationId,
      'parentId': parentId,
      'gatewayId': gatewayId,
      'sensorId': sensorId,
      'sensorType': sensorType,
    };
  }

  factory AssetsModel.fromMap(Map<String, dynamic> map) {
    return AssetsModel(
      id: map['id'] as String,
      name: map['name'] as String,
      status: SensorStatusEnum.values.firstWhere(
        (element) => element.name.compareTo(map['status'] ?? '') == 0,
        orElse: () => SensorStatusEnum.empty,
      ),
      locationId:
          map['locationId'] != null ? map['locationId'] as String : null,
      parentId: map['parentId'] != null ? map['parentId'] as String : null,
      gatewayId: map['gatewayId'] != null ? map['gatewayId'] as String : null,
      sensorId: map['sensorId'] != null ? map['sensorId'] as String : null,
      sensorType:
          map['sensorType'] != null ? map['sensorType'] as String : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory AssetsEntity.fromJson(String source) => AssetsEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
