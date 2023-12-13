import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/authentication/domain/entities/user.dart';
import 'package:clean_architecture_project/features/establishment/domain/repositories/establishment_repository.dart';

class AddNewEmployeeUseCaseParameters {
  final String? establishmentId;
  final UserRequestEntity? body;

  const AddNewEmployeeUseCaseParameters({
    this.body,
    this.establishmentId,
  });
}

class AddNewEmployeeUseCase extends UseCase<DataState<List<UserEntity>>,
    AddNewEmployeeUseCaseParameters> {
  final EstablishmentRepository repository;

  AddNewEmployeeUseCase(this.repository);

  @override
  Future<DataState<List<UserEntity>>> call(
      {AddNewEmployeeUseCaseParameters? params}) {
    return repository.addNewEmployee(
      body: params!.body,
      establishmentId: params.establishmentId,
    );
  }
}
