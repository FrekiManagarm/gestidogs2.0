import 'package:clean_architecture_project/features/establishment/domain/entities/establishment_entity.dart';
import 'package:equatable/equatable.dart';

class ActivityEntity extends Equatable {

  final String? id;
  final EstablishmentEntity? establishment;
  final String? title;
  final String? description;
  final String? imageUrl;
  final int? duration;
  final int? price;
  
  const ActivityEntity({
    this.description,
    this.duration,
    this.establishment,
    this.id,
    this.imageUrl,
    this.price,
    this.title,
  });

  @override
  List<Object?> get props {
    return [
      description,
      duration,
      establishment,
      id,
      imageUrl,
      price,
      title,
    ];
  }
}

class ActivityRequestEntity extends Equatable {
  final String? establishment;
  final String? title;
  final String? description;
  final String? imageUrl;
  final int? price;
  final int? duration;

  const ActivityRequestEntity({
    this.description,
    this.duration,
    this.establishment,
    this.imageUrl,
    this.price,
    this.title,
  });
  
  @override
  List<Object?> get props => [
    description,
    duration,
    establishment,
    imageUrl,
    price,
    title,
  ];
}
