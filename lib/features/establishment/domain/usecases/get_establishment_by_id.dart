import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/establishment/domain/entities/establishment_entity.dart';
import 'package:clean_architecture_project/features/establishment/domain/repositories/establishment_repository.dart';

class GetEstablishmentByIdUseCase
    implements UseCase<DataState<EstablishmentEntity>, String> {
  final EstablishmentRepository establishmentRepository;

  GetEstablishmentByIdUseCase(this.establishmentRepository);

  @override
  Future<DataState<EstablishmentEntity>> call({String? params}) {
    return establishmentRepository.getEstablishmentById(params);
  }
}
