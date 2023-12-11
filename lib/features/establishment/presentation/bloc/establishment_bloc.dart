import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/features/establishment/domain/usecases/create_establishment.dart';
import 'package:clean_architecture_project/features/establishment/domain/usecases/get_establishment_by_id.dart';
import 'package:clean_architecture_project/features/establishment/domain/usecases/get_establishments.dart';
import 'package:clean_architecture_project/features/establishment/domain/usecases/update_establishment.dart';
import 'package:clean_architecture_project/features/establishment/presentation/bloc/establishment_event.dart';
import 'package:clean_architecture_project/features/establishment/presentation/bloc/establishment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EstablishmentBloc extends Bloc<EstablishmentEvent, EstablishmentState> {
  final GetEstablishmentsUseCase getEstablishmentsUseCase;
  final GetEstablishmentByIdUseCase getEstablishmentByIdUseCase;
  final CreateEstablishmentUseCase createEstablishmentUseCase;
  final UpdateEstablishmentUseCase updateEstablishmentUseCase;

  EstablishmentBloc(
    this.createEstablishmentUseCase,
    this.getEstablishmentByIdUseCase,
    this.getEstablishmentsUseCase,
    this.updateEstablishmentUseCase,
  ) : super(const EstablishmentsInitial()) {
    on<GetEstablishmentsEvent>(getEstablishments);
    on<GetEstablishmentByIdEvent>(getEstablishmentById);
    on<CreateEstablishmentEvent>(createEstablishment);
    on<UpdateEstablishmentEvent>(updateEstablishment);
  }

  void getEstablishments(
      GetEstablishmentsEvent event, Emitter<EstablishmentState> emit) async {
    final data = await getEstablishmentsUseCase(
      params: GetEstablishmentsUseCaseParameters(
        clientId: event.clientId,
        ownerId: event.ownerId,
      ),
    );

    if (data is DataSuccess) {
      emit(EstablishmentsLoaded(data.data!));
    }

    if (data is DataFailed) {
      emit(EstablishmentsError(data.error!));
    }
  }

  void getEstablishmentById(
      GetEstablishmentByIdEvent event, Emitter<EstablishmentState> emit) async {
    final data = await getEstablishmentByIdUseCase(
      params: event.establishmentId,
    );

    if (data is DataSuccess) {
      emit(EstablishmentLoaded(data.data!));
    }

    if (data is DataFailed) {
      emit(EstablishmentError(data.error!));
    }
  }

  void createEstablishment(
      CreateEstablishmentEvent event, Emitter<EstablishmentState> emit) async {
    final data = await createEstablishmentUseCase(
      params: event.body,
    );

    if (data is DataSuccess) {
      emit(EstablishmentLoaded(data.data!));
    }

    if (data is DataSuccess) {
      emit(EstablishmentError(data.error!));
    }
  }

  void updateEstablishment(
      UpdateEstablishmentEvent event, Emitter<EstablishmentState> emit) async {
    final data = await updateEstablishmentUseCase(
      params: UpdateEstablishmentUseCaseParameters(
        establishmentId: event.establishmentId,
        request: event.body,
      ),
    );

    if (data is DataSuccess) {
      emit(EstablishmentLoaded(data.data!));
    }

    if (data is DataFailed) {
      emit(EstablishmentError(data.error!));
    }
  }
}
