import 'package:clean_architecture_project/features/dog/domain/entities/dog_entity.dart';

abstract class DogEvent {
  const DogEvent();
}

class CreateDogEvent extends DogEvent {
  final DogRequestEntity? body;

  const CreateDogEvent({
    this.body,
  });
}

class GetDogsEvent extends DogEvent {
  final String? ownerId;
  final String? establishmentId;

  const GetDogsEvent({
    this.establishmentId,
    this.ownerId,
  });
}

class GetDogByIdEvent extends DogEvent {
  final String? dogId;

  const GetDogByIdEvent({
    this.dogId,
  });
}

class UpdateDogEvent extends DogEvent {
  final String? dogId;
  final DogRequestEntity? body;

  const UpdateDogEvent({
    this.body,
    this.dogId,
  });
}
