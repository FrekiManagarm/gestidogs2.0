import 'package:clean_architecture_project/features/establishment/domain/entities/establishment_entity.dart';

abstract class EstablishmentEvent {
  const EstablishmentEvent();
}

class GetEstablishmentsEvent extends EstablishmentEvent {
  final String? ownerId;
  final String? clientId;

  const GetEstablishmentsEvent({
    this.clientId,
    this.ownerId,
  });
}

class GetEstablishmentByIdEvent extends EstablishmentEvent {
  final String? establishmentId;

  const GetEstablishmentByIdEvent({
    this.establishmentId,
  });
}

class CreateEstablishmentEvent extends EstablishmentEvent {
  final EstablishmentRequestEntity? body;

  const CreateEstablishmentEvent({
    this.body,
  });
}

class UpdateEstablishmentEvent extends EstablishmentEvent {
  final String? establishmentId;
  final EstablishmentRequestEntity? body;

  const UpdateEstablishmentEvent({
    this.body,
    this.establishmentId,
  });
}
