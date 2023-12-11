import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/features/establishment/domain/entities/establishment_entity.dart';

abstract class EstablishmentRepository {
  Future<DataState<List<EstablishmentEntity>>> getEstablishments(
    String? ownerId,
    String? clientId,
  );

  Future<DataState<EstablishmentEntity>> getEstablishmentById(
    String? establishmentId,
  );

  Future<DataState<EstablishmentEntity>> createEstablishment(
    EstablishmentRequestEntity? request,
  );

  Future<DataState<EstablishmentEntity>> updateEstablishment(
    EstablishmentRequestEntity? request,
    String? establishmentId,
  );
}
