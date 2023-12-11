import 'package:clean_architecture_project/features/authentication/domain/entities/user.dart';
import 'package:clean_architecture_project/features/establishment/domain/entities/establishment_entity.dart';
import 'package:equatable/equatable.dart';

class DogEntity extends Equatable {

  final String? id;
  final UserEntity? owner;
  final EstablishmentEntity? establishment;
  final String? nationalId;
  final String? name;
  final String? imageUrl;
  final String? gender;
  final String? breed;
  final String? birthDate;
  final int? height;
  final int? weight;

  const DogEntity({
    this.id,
    this.owner,
    this.establishment,
    this.name,
    this.nationalId,
    this.imageUrl,
    this.birthDate,
    this.breed,
    this.gender,
    this.height,
    this.weight,
  });

  @override
  List<Object?> get props {
    return [
      id,
      owner,
      establishment,
      name,
      nationalId,
      imageUrl,
      gender,
      breed,
      birthDate,
      height,
      weight,
    ];
  }
}

class DogRequestEntity extends Equatable {

  final String? owner;
  final String? establishment;
  final String? nationalId;
  final String? name;
  final String? imageUrl;
  final String? gender;
  final String? breed;
  final int? weight;
  final int? height;

  const DogRequestEntity({
    this.breed,
    this.establishment,
    this.gender,
    this.height,
    this.imageUrl,
    this.name,
    this.nationalId,
    this.owner,
    this.weight,
  });

  @override
  List<Object?> get props => [
    breed,
    owner,
    establishment,
    nationalId,
    name,
    weight,
    gender,
    height,
    imageUrl,
  ];
}
