import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/reservation/domain/entities/reservation_entity.dart';
import 'package:clean_architecture_project/features/reservation/domain/repositories/reservation_repository.dart';

class UpdateReservationUseCaseParameters {
  final String? reservationId;
  final ReservationRequestEntity? request;

  UpdateReservationUseCaseParameters({
    this.request,
    this.reservationId,
  });
}

class UpdateReservationUseCase
    implements
        UseCase<DataState<ReservationEntity>,
            UpdateReservationUseCaseParameters> {
  final ReservationRepository reservationRepository;

  UpdateReservationUseCase(this.reservationRepository);

  @override
  Future<DataState<ReservationEntity>> call(
      {UpdateReservationUseCaseParameters? params}) {
    return reservationRepository.updateReservation(
        params!.reservationId, params.request);
  }
}
