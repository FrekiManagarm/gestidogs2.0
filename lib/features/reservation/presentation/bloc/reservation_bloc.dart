import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/features/reservation/domain/usecases/approved_reservation.dart';
import 'package:clean_architecture_project/features/reservation/domain/usecases/create_reservation.dart';
import 'package:clean_architecture_project/features/reservation/domain/usecases/get_reservations.dart';
import 'package:clean_architecture_project/features/reservation/domain/usecases/update_reservation.dart';
import 'package:clean_architecture_project/features/reservation/presentation/bloc/reservation_event.dart';
import 'package:clean_architecture_project/features/reservation/presentation/bloc/reservation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReservationsBloc extends Bloc<ReservationsEvent, ReservationsState> {
  final GetReservationsUseCase getReservationsUseCase;
  final CreateReservationUseCase createReservationUseCase;
  final ApprovedReservationUseCase approvedReservationUseCase;
  final UpdateReservationUseCase updateReservationUseCase;

  ReservationsBloc(
    this.approvedReservationUseCase,
    this.createReservationUseCase,
    this.getReservationsUseCase,
    this.updateReservationUseCase,
  ) : super(const ReservationsLoading()) {
    on<GetReservationsEvent>(getReservations);
    on<CreateReservationEvent>(createReservation);
    on<ApprovedReservationEvent>(approvedReservation);
    on<UpdateReservationEvent>(updateReservation);
  }

  void getReservations(
      GetReservationsEvent event, Emitter<ReservationsState> emit) async {
    final data = await getReservationsUseCase(
      params: GetReservationUseCaseParameters(
          establishmentId: event.establishmentId,
          sessionId: event.sessionId,
          status: event.status),
    );

    if (data is DataSuccess) {
      emit(ReservationsLoaded(data.data!));
    }

    if (data is DataFailed) {
      emit(ReservationsError(data.error!));
    }
  }

  void createReservation(
      CreateReservationEvent event, Emitter<ReservationsState> emit) async {
    final data = await createReservationUseCase(
      params: event.body,
    );

    if (data is DataSuccess) {
      emit(ReservationLoaded(data.data!));
    }

    if (data is DataFailed) {
      emit(ReservationError(data.error!));
    }
  }

  void approvedReservation(
      ApprovedReservationEvent event, Emitter<ReservationsState> emit) async {
    final data = await approvedReservationUseCase(
      params: ApprovedReservationUseCaseParameters(
        educatorId: event.educatorId,
        reservationId: event.reservationId,
        slot: event.slot,
      ),
    );

    if (data is DataSuccess) {
      emit(const ReservationApproved(reservationApproved: true));
    }

    if (data is DataFailed) {
      emit(ReservationApproved(reservationApproved: false, error: data.error));
    }
  }

  void updateReservation(
      UpdateReservationEvent event, Emitter<ReservationsState> emit) async {
    final data = await updateReservationUseCase(
      params: UpdateReservationUseCaseParameters(
        request: event.body,
        reservationId: event.reservationId,
      ),
    );

    if (data is DataSuccess) {
      emit(ReservationLoaded(data.data!));
    }

    if (data is DataFailed) {
      emit(ReservationError(data.error!));
    }
  }
}
