import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/authentication/domain/entities/user.dart';
import 'package:clean_architecture_project/features/authentication/domain/repositories/user_repository.dart';

class LoginUseCase
    implements UseCase<DataState<LoginResponseEntity>, LoginRequestEntity> {
  final UserRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<DataState<LoginResponseEntity>> call({LoginRequestEntity? params}) {
    return repository.login(
      body: params,
    );
  }
}
