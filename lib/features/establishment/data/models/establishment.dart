import 'package:clean_architecture_project/features/authentication/data/models/user.dart';
import 'package:clean_architecture_project/features/establishment/domain/entities/establishment_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'establishment.g.dart';

@JsonSerializable()
class Establishment extends EstablishmentEntity {
  @JsonKey(name: '_id')
  final String? id;
  final User? owner;
  final String? name;
  final String? description;
  final String? address;
  final String? phoneNumber;
  final String? emailAddress;
  final List<User?>? employees;
  final List<User?>? clients;
  final List<String?>? schedules;

  const Establishment({
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

  factory Establishment.fromJson(Map<String, dynamic> json) =>
      _$EstablishmentFromJson(json);
  Map<String, dynamic> toJson() => _$EstablishmentToJson(this);

  factory Establishment.fromEntity(EstablishmentEntity entity) {
    return Establishment(
      id: entity.id,
      address: entity.address,
      clients: entity.clients!.map((e) => User.fromEntity(e!)).toList(),
      description: entity.description,
      emailAddress: entity.emailAddress,
      employees: entity.employees!.map((e) => User.fromEntity(e!)).toList(),
      name: entity.name,
      owner: User.fromEntity(entity.owner!),
      phoneNumber: entity.phoneNumber,
      schedules: entity.schedules,
    );
  }
}

@JsonSerializable()
class EstablishmentRequest extends EstablishmentRequestEntity {
  final String? owner;
  final String? name;
  final String? description;
  final String? address;
  final String? phoneNumber;
  final String? emailAddress;
  final List<String>? schedules;

  const EstablishmentRequest({
    this.address,
    this.description,
    this.emailAddress,
    this.name,
    this.owner,
    this.phoneNumber,
    this.schedules,
  }) : super(
    address: address,
    description: description,
    emailAddress: emailAddress,
    name: name,
    owner: owner,
    phoneNumber: phoneNumber,
    schedules: schedules,
  );

  factory EstablishmentRequest.fromJson(Map<String, dynamic> json) =>
      _$EstablishmentRequestFromJson(json);
  Map<String, dynamic> toJson() => _$EstablishmentRequestToJson(this);

  factory EstablishmentRequest.fromEntity(EstablishmentRequestEntity entity) {
    return EstablishmentRequest(
      address: entity.address,
      description: entity.description,
      emailAddress: entity.emailAddress,
      name: entity.name,
      owner: entity.owner,
      phoneNumber: entity.phoneNumber,
      schedules: entity.schedules,
    );
  }
}
