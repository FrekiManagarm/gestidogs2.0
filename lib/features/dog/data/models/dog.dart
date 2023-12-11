import 'package:clean_architecture_project/features/authentication/data/models/user.dart';
import 'package:clean_architecture_project/features/dog/domain/entities/dog_entity.dart';
import 'package:clean_architecture_project/features/establishment/data/models/establishment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dog.g.dart';

@JsonSerializable()
class Dog extends DogEntity {
  @JsonKey(name: '_id')
  final String? id;
  final User? owner;
  final Establishment? establishment;
  final String? nationalId;
  final String? name;
  final String? imageUrl;
  final String? gender;
  final String? breed;
  final String? birthDate;
  final int? height;
  final int? weight;

  const Dog({
    this.id,
    this.owner,
    this.establishment,
    this.nationalId,
    this.name,
    this.imageUrl,
    this.gender,
    this.breed,
    this.birthDate,
    this.height,
    this.weight,
  }) : super(
          birthDate: birthDate,
          breed: breed,
          establishment: establishment,
          gender: gender,
          height: height,
          id: id,
          imageUrl: imageUrl,
          name: name,
          nationalId: nationalId,
          owner: owner,
          weight: weight,
        );

  factory Dog.fromJson(Map<String, dynamic> json) => _$DogFromJson(json);
  Map<String, dynamic> toJson() => _$DogToJson(this);

  factory Dog.fromEntity(DogEntity entity) {
    return Dog(
      birthDate: entity.birthDate,
      breed: entity.breed,
      establishment: Establishment.fromEntity(entity.establishment!),
      gender: entity.gender,
      height: entity.height,
      id: entity.id,
      imageUrl: entity.imageUrl,
      name: entity.name,
      nationalId: entity.nationalId,
      owner: User.fromEntity(entity.owner!),
      weight: entity.weight,
    );
  }
}

@JsonSerializable()
class DogRequest extends DogRequestEntity {
  final String? owner;
  final String? establishment;
  final String? nationalId;
  final String? name;
  final String? imageUrl;
  final String? gender;
  final String? breed;
  final int? weight;
  final int? height;

  const DogRequest({
    this.breed,
    this.establishment,
    this.gender,
    this.height,
    this.imageUrl,
    this.name,
    this.nationalId,
    this.owner,
    this.weight,
  }) : super(
          breed: breed,
          establishment: establishment,
          gender: gender,
          height: height,
          imageUrl: imageUrl,
          name: name,
          nationalId: nationalId,
          owner: owner,
          weight: weight,
        );

  factory DogRequest.fromJson(Map<String, dynamic> json) =>
      _$DogRequestFromJson(json);
  Map<String, dynamic> toJson() => _$DogRequestToJson(this);

  factory DogRequest.fromEntity(DogRequestEntity entity) {
    return DogRequest(
      breed: entity.breed,
      establishment: entity.establishment,
      gender: entity.gender,
      height: entity.height,
      imageUrl: entity.imageUrl,
      name: entity.name,
      nationalId: entity.nationalId,
      owner: entity.owner,
      weight: entity.weight,
    );
  }
}
