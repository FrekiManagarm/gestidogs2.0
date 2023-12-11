import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/reservation/domain/entities/reservation_entity.dart';
import 'package:clean_architecture_project/features/reservation/domain/repositories/reservation_repository.dart';

class CreateReservationUseCase
    implements UseCase<DataState<ReservationEntity>, ReservationRequestEntity> {
  final ReservationRepository reservationRepository;

  CreateReservationUseCase(this.reservationRepository);

  @override
  Future<DataState<ReservationEntity>> call(
      {ReservationRequestEntity? params}) {
    return reservationRepository.createReservation(params);
  }
}
