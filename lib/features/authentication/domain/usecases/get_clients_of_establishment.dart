import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/authentication/domain/entities/user.dart';
import 'package:clean_architecture_project/features/authentication/domain/repositories/user_repository.dart';

class GetClientsOfEstablishmentUseCase
    implements UseCase<DataState<List<UserEntity>>, String> {
  final UserRepository repository;

  GetClientsOfEstablishmentUseCase(this.repository);

  @override
  Future<DataState<List<UserEntity>>> call({String? params}) {
    return repository.getClientsOfEstablishment(establishmentId: params);
  }
}
