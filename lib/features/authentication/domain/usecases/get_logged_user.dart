import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/authentication/domain/entities/user.dart';
import 'package:clean_architecture_project/features/authentication/domain/repositories/user_repository.dart';

class GetLoggedUserUseCase extends UseCase<DataState<UserEntity>, void> {
  final UserRepository repository;

  GetLoggedUserUseCase(this.repository);

  @override
  Future<DataState<UserEntity>> call({void params}) {
    return repository.getUserConnected();
  }
}
