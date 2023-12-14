import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/features/session/domain/usecases/create_session.dart';
import 'package:clean_architecture_project/features/session/domain/usecases/get_daily_session.dart';
import 'package:clean_architecture_project/features/session/domain/usecases/get_remaining_places.dart';
import 'package:clean_architecture_project/features/session/domain/usecases/get_sessions.dart';
import 'package:clean_architecture_project/features/session/domain/usecases/post_session_report.dart';
import 'package:clean_architecture_project/features/session/domain/usecases/update_session.dart';
import 'package:clean_architecture_project/features/session/presentation/bloc/session_event.dart';
import 'package:clean_architecture_project/features/session/presentation/bloc/session_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionsBloc extends Bloc<SessionsEvent, SessionsState> {
  final GetSessionsUseCase getSessionsUseCase;
  final CreateSessionUseCase createSessionUseCase;
  final GetDailySessionsUseCase getDailySessionsUseCase;
  final PostSessionReportUseCase postSessionReportUseCase;
  final GetSessionRemainingPlacesUseCase getSessionRemainingPlacesUseCase;
  final UpdateSessionUseCase updateSessionUseCase;

  SessionsBloc(
    this.createSessionUseCase,
    this.getDailySessionsUseCase,
    this.getSessionRemainingPlacesUseCase,
    this.getSessionsUseCase,
    this.postSessionReportUseCase,
    this.updateSessionUseCase,
  ) : super(const SessionsLoading()) {
    on<GetSessionsEvent>(getSessions);
    on<CreateSessionEvent>(createSession);
    on<GetDailySessionsEvent>(getDailySessions);
    on<CreateSessionReportEvent>(postSessionReport);
    on<GetSessionsRemainingPlacesEvent>(getRemainingPlaces);
    on<UpdateSessionEvent>(updateSession);
  }

  void getSessions(GetSessionsEvent event, Emitter<SessionsState> emit) async {
    final useCase = await getSessionsUseCase();

    if (useCase is DataSuccess) {
      emit(SessionsLoaded(useCase.data!));
    }

    if (useCase is DataFailed) {
      emit(SessionsError(useCase.error!));
    }
  }

  void createSession(
      CreateSessionEvent event, Emitter<SessionsState> emit) async {
    final data = await createSessionUseCase(
      params: event.body,
    );

    if (data is DataSuccess) {
      add(const GetDailySessionsEvent());
    }

    if (data is DataFailed) {
      emit(SessionError(data.error!));
    }
  }

  void getDailySessions(
      GetDailySessionsEvent event, Emitter<SessionsState> emit) async {
    emit(const SessionsLoading());
    final data = await getDailySessionsUseCase(
      params: GetDailySessionUseCaseParameters(
        date: event.date,
        dogId: event.dogId,
        establishmentId: event.establishmentId,
      ),
    );

    if (data is DataSuccess) {
      emit(SessionsLoaded(data.data!));
    }
  }

  void postSessionReport(
      CreateSessionReportEvent event, Emitter<SessionsState> emit) async {
    final data = await postSessionReportUseCase(
      params: PostSessionReportUseCaseParamaters(
        report: event.report,
        sessionId: event.sessionId,
      ),
    );

    if (data is DataSuccess) {
      add(const GetSessionsEvent());
    }

    if (data is DataFailed) {
      emit(SessionError(data.error!));
    }
  }

  void getRemainingPlaces(GetSessionsRemainingPlacesEvent event,
      Emitter<SessionsState> emit) async {
    final data = await getSessionRemainingPlacesUseCase(
      params: event.sessionId,
    );

    if (data is DataSuccess) {}

    if (data is DataFailed) {}
  }

  void updateSession(
      UpdateSessionEvent event, Emitter<SessionsState> emit) async {
    emit(const SessionLoading());

    final data = await updateSessionUseCase(
      params: UpdateSessionUseCaseParameters(
        request: event.body,
        sessionId: event.sessionId,
      ),
    );

    if (data is DataSuccess) {
      emit(SessionLoaded(data.data!));
    }

    if (data is DataFailed) {
      emit(SessionError(data.error!));
    }
  }
}
