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

  // Map<String, dynamic> toMap() {
  //   return <String, dynamic>{
  //     'id': id,
  //     'name': name,
  //     'status': status.toMap(),
  //     'locationId': locationId,
  //     'parentId': parentId,
  //     'gatewayId': gatewayId,
  //     'sensorId': sensorId,
  //     'sensorType': sensorType,
  //   };
  // }

  // factory AssetsEntity.fromMap(Map<String, dynamic> map) {
  //   return AssetsEntity(
  //     id: map['id'] as String,
  //     name: map['name'] as String,
  //     status: SensorStatusEnum.fromMap(map['status'] as Map<String,dynamic>),
  //     locationId: map['locationId'] != null ? map['locationId'] as String : null,
  //     parentId: map['parentId'] != null ? map['parentId'] as String : null,
  //     gatewayId: map['gatewayId'] != null ? map['gatewayId'] as String : null,
  //     sensorId: map['sensorId'] != null ? map['sensorId'] as String : null,
  //     sensorType: map['sensorType'] != null ? map['sensorType'] as String : null,
  //   );
  // }

  // String toJson() => json.encode(toMap());

  // factory AssetsEntity.fromJson(String source) => AssetsEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
