import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/establishment/domain/entities/establishment_entity.dart';
import 'package:clean_architecture_project/features/establishment/domain/repositories/establishment_repository.dart';

class UpdateEstablishmentUseCaseParameters {
  final String? establishmentId;
  final EstablishmentRequestEntity? request;

  UpdateEstablishmentUseCaseParameters({
    this.establishmentId,
    this.request,
  });
}

class UpdateEstablishmentUseCase
    implements
        UseCase<DataState<EstablishmentEntity>,
            UpdateEstablishmentUseCaseParameters> {
  final EstablishmentRepository repository;

  UpdateEstablishmentUseCase(this.repository);

  @override
  Future<DataState<EstablishmentEntity>> call(
      {UpdateEstablishmentUseCaseParameters? params}) {
    return repository.updateEstablishment(
        params!.request, params.establishmentId);
  }
}
