import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/authentication/domain/entities/user.dart';
import 'package:clean_architecture_project/features/authentication/domain/repositories/user_repository.dart';

class RefreshTokenUseCase
    implements UseCase<DataState<RefreshTokensEntity>, String> {
  final UserRepository repository;

  RefreshTokenUseCase(this.repository);

  @override
  Future<DataState<RefreshTokensEntity>> call({String? params}) {
    return repository.refreshToken(
      refreshToken: params,
    );
  }
}
