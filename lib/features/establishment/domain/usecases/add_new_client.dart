import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/authentication/domain/entities/user.dart';
import 'package:clean_architecture_project/features/establishment/domain/repositories/establishment_repository.dart';

class AddNewClientUseCaseParameters {
  final String? establishmentId;
  final UserRequestEntity? body;

  const AddNewClientUseCaseParameters({
    this.body,
    this.establishmentId,
  });
}

class AddNewClientUseCase
    implements
        UseCase<DataState<List<UserEntity>>, AddNewClientUseCaseParameters> {
  final EstablishmentRepository repository;

  AddNewClientUseCase(this.repository);

  @override
  Future<DataState<List<UserEntity>>> call(
      {AddNewClientUseCaseParameters? params}) {
    return repository.addNewClient(
      body: params!.body,
      establishmentId: params.establishmentId,
    );
  }
}
