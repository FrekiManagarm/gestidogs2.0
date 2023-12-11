import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/authentication/domain/entities/user.dart';
import 'package:clean_architecture_project/features/authentication/domain/repositories/user_repository.dart';

class GetUsersUseCaseParameters {
  final String? establishmentId;
  final String? role;

  const GetUsersUseCaseParameters({
    this.establishmentId,
    this.role,
  });
}

class GetUsersUseCase
    implements UseCase<DataState<List<UserEntity>>, GetUsersUseCaseParameters> {
  final UserRepository repository;

  GetUsersUseCase(this.repository);

  @override
  Future<DataState<List<UserEntity>>> call(
      {GetUsersUseCaseParameters? params}) {
    return repository.getUsers(
      establishmentId: params!.establishmentId,
      role: params.role,
    );
  }
}
