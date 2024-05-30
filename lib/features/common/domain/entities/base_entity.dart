import 'package:equatable/equatable.dart';

class BaseEntity extends Equatable {
  final String id;
  final String name;

  const BaseEntity({required this.id, required this.name});
  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
