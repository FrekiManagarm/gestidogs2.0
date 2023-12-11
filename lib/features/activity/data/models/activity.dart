import 'package:clean_architecture_project/features/activity/domain/entities/activity_entity.dart';
import 'package:clean_architecture_project/features/establishment/data/models/establishment.dart';
import 'package:json_annotation/json_annotation.dart';

part 'activity.g.dart';

@JsonSerializable()
class Activity extends ActivityEntity {
  @JsonKey(name: "_id")
  final String? id;
  final Establishment? establishment;
  final String? title;
  final String? description;
  final String? imageUrl;
  final int? duration;
  final int? price;

  const Activity({
    this.description,
    this.duration,
    this.establishment,
    this.id,
    this.imageUrl,
    this.price,
    this.title,
  }) : super(
          description: description,
          duration: duration,
          establishment: establishment,
          id: id,
          imageUrl: imageUrl,
          price: price,
          title: title,
        );

  factory Activity.fromJson(Map<String, dynamic> json) =>
      _$ActivityFromJson(json);
  Map<String, dynamic> toJson() => _$ActivityToJson(this);

  factory Activity.fromEntity(ActivityEntity entity) {
    return Activity(
      description: entity.description,
      duration: entity.duration,
      establishment: Establishment.fromEntity(entity.establishment!),
      id: entity.id,
      imageUrl: entity.imageUrl,
      price: entity.price,
      title: entity.title,
    );
  }
}

@JsonSerializable()
class ActivityRequest extends ActivityRequestEntity {
  final String? establishment;
  final String? title;
  final String? description;
  final String? imageUrl;
  final int? price;
  final int? duration;

  const ActivityRequest({
    this.description,
    this.duration,
    this.establishment,
    this.imageUrl,
    this.price,
    this.title,
  }) : super(
          description: description,
          duration: duration,
          establishment: establishment,
          imageUrl: imageUrl,
          price: price,
          title: title,
        );

  factory ActivityRequest.fromJson(Map<String, dynamic> json) =>
      _$ActivityRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ActivityRequestToJson(this);

  factory ActivityRequest.fromEntity(ActivityRequestEntity entity) {
    return ActivityRequest(
      description: entity.description,
      duration: entity.duration,
      establishment: entity.establishment,
      imageUrl: entity.imageUrl,
      price: entity.price,
      title: entity.title,
    );
  }
}
