import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/authentication/domain/entities/user.dart';
import 'package:clean_architecture_project/features/authentication/domain/repositories/user_repository.dart';

class RegisterUseCase
    implements UseCase<DataState<LoginResponseEntity>, RegisterRequestEntity> {
  final UserRepository repository;

  RegisterUseCase(this.repository);

  @override
  Future<DataState<LoginResponseEntity>> call({RegisterRequestEntity? params}) {
    return repository.register(
      body: params,
    );
  }
}
