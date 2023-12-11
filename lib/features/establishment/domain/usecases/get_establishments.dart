import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/establishment/domain/entities/establishment_entity.dart';
import 'package:clean_architecture_project/features/establishment/domain/repositories/establishment_repository.dart';

class GetEstablishmentsUseCaseParameters {
  final String? ownerId;
  final String? clientId;

  GetEstablishmentsUseCaseParameters({
    this.clientId,
    this.ownerId,
  });
}

class GetEstablishmentsUseCase
    implements
        UseCase<DataState<List<EstablishmentEntity>>,
            GetEstablishmentsUseCaseParameters> {
  final EstablishmentRepository establishmentRepository;

  GetEstablishmentsUseCase(this.establishmentRepository);

  @override
  Future<DataState<List<EstablishmentEntity>>> call(
      {GetEstablishmentsUseCaseParameters? params}) {
    return establishmentRepository.getEstablishments(
        params!.ownerId, params.clientId);
  }
}
