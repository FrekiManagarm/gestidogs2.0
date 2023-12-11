import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/reservation/domain/repositories/reservation_repository.dart';

class ApprovedReservationUseCaseParameters {
  final String? reservationId;
  final String? educatorId;
  final String? slot;

  ApprovedReservationUseCaseParameters({
    this.educatorId,
    this.reservationId,
    this.slot,
  });
}

class ApprovedReservationUseCase
    implements
        UseCase<DataState<String>, ApprovedReservationUseCaseParameters> {
  final ReservationRepository reservationRepository;

  ApprovedReservationUseCase(this.reservationRepository);

  @override
  Future<DataState<String>> call(
      {ApprovedReservationUseCaseParameters? params}) {
    return reservationRepository.approvedReservation(
        params!.reservationId, params.educatorId, params.slot);
  }
}
