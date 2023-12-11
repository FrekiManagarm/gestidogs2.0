import 'package:clean_architecture_project/features/authentication/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class EstablishmentEntity extends Equatable {
  final String? id;
  final UserEntity? owner;
  final String? name;
  final String? description;
  final String? address;
  final String? phoneNumber;
  final String? emailAddress;
  final List<UserEntity?>? employees;
  final List<UserEntity?>? clients;
  final List<String?>? schedules;

  const EstablishmentEntity({
    this.id,
    this.owner,
    this.name,
    this.description,
    this.address,
    this.phoneNumber,
    this.emailAddress,
    this.employees,
    this.clients,
    this.schedules,
  });

  @override
  List<Object?> get props {
    return [
      id,
      owner,
      name,
      description,
      address,
      phoneNumber,
      emailAddress,
      employees,
      clients,
      schedules,
    ];
  }
}

class EstablishmentRequestEntity extends Equatable {

  final String? owner;
  final String? name;
  final String? description;
  final String? address;
  final String? phoneNumber;
  final String? emailAddress;
  final List<String>? schedules;

  const EstablishmentRequestEntity({
    this.address,
    this.description,
    this.emailAddress,
    this.name,
    this.owner,
    this.phoneNumber,
    this.schedules,
  });

  @override
  List<Object?> get props {
    return [
      owner,
      name,
      description,
      address,
      phoneNumber,
      emailAddress,
      schedules,
    ];
  }
}
