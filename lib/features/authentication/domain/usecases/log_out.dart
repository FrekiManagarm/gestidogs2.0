import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/authentication/domain/repositories/user_repository.dart';

class LogOutUseCase implements UseCase<DataState<bool>, void> {
  final UserRepository repository;

  LogOutUseCase(this.repository);

  @override
  Future<DataState<bool>> call({void params}) {
    return repository.logOut();
  }
}
