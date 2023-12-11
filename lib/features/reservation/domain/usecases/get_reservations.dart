import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/reservation/domain/entities/reservation_entity.dart';
import 'package:clean_architecture_project/features/reservation/domain/repositories/reservation_repository.dart';

class GetReservationUseCaseParameters {
  final String? sessionId;
  final String? establishmentId;
  final String? status;

  GetReservationUseCaseParameters(
      {this.sessionId, this.establishmentId, this.status});
}

class GetReservationsUseCase
    implements
        UseCase<DataState<List<ReservationEntity>>,
            GetReservationUseCaseParameters> {
  final ReservationRepository reservationRepository;

  GetReservationsUseCase(this.reservationRepository);

  @override
  Future<DataState<List<ReservationEntity>>> call(
      {GetReservationUseCaseParameters? params}) {
    return reservationRepository.getReservations(
        params!.sessionId, params.establishmentId, params.status);
  }
}
