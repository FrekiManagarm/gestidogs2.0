import 'package:clean_architecture_project/features/authentication/domain/entities/user.dart';
import 'package:clean_architecture_project/features/establishment/domain/entities/establishment_entity.dart';
import 'package:equatable/equatable.dart';

class HolidayEntity extends Equatable {
  final String? id;
  final UserEntity? employee;
  final EstablishmentEntity? establishment;
  final String? beginDate;
  final String? endDate;
  final bool? isApproved;
  final int? v;

  const HolidayEntity({
    this.beginDate,
    this.employee,
    this.endDate,
    this.establishment,
    this.id,
    this.isApproved,
    this.v
  });
  
  @override
  List<Object?> get props {
    return [
      beginDate,
      employee,
      endDate,
      establishment,
      id,
      isApproved,
      v,
    ];
  }
}

class HolidaysRequestEntity extends Equatable {
  final String? employee;
  final String? establishment;
  final String? beginDate;
  final String? endDate;
  final String? status;

  const HolidaysRequestEntity({
    this.beginDate,
    this.employee,
    this.endDate,
    this.establishment,
    this.status,
  });

  @override
  List<Object?> get props => throw UnimplementedError();
}
