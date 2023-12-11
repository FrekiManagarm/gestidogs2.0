import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/features/activity/domain/usecases/create_activity.dart';
import 'package:clean_architecture_project/features/activity/domain/usecases/get_activities.dart';
import 'package:clean_architecture_project/features/activity/domain/usecases/get_activity_by_id.dart';
import 'package:clean_architecture_project/features/activity/domain/usecases/update_activity.dart';
import 'package:clean_architecture_project/features/activity/presentation/bloc/activity_event.dart';
import 'package:clean_architecture_project/features/activity/presentation/bloc/activity_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivitiesBloc extends Bloc<ActivitiesEvent, ActivitiesState> {
  final GetActivitiesUseCase getActivitiesUseCase;
  final GetActivityByIdUseCase getActivityByIdUseCase;
  final CreateActivityUseCase createActivityUseCase;
  final UpdateActivityUseCase updateActivityUseCase;

  ActivitiesBloc(
    this.createActivityUseCase,
    this.getActivitiesUseCase,
    this.getActivityByIdUseCase,
    this.updateActivityUseCase,
  ) : super(const ActivitiesLoading()) {
    on<GetActivitiesEvent>(getActivities);
    on<GetActivityByIdEvent>(getActivityById);
    on<CreateActivityEvent>(createActivity);
    on<UpdateActivityEvent>(updateActivity);
  }

  void getActivities(
      GetActivitiesEvent event, Emitter<ActivitiesState> emit) async {
    final data = await getActivitiesUseCase(
      params: event.establishmentId,
    );

    if (data is DataSuccess) {
      emit(ActivitiesLoaded(data.data!));
    }

    if (data is DataFailed) {
      emit(ActivitiesError(data.error!));
    }
  }

  void getActivityById(
      GetActivityByIdEvent event, Emitter<ActivitiesState> emit) async {
    final data = await getActivityByIdUseCase(
      params: event.activityId,
    );

    if (data is DataSuccess) {
      emit(ActivityLoaded(data.data!));
    }

    if (data is DataFailed) {
      emit(ActivityError(data.error!));
    }
  }

  void createActivity(
      CreateActivityEvent event, Emitter<ActivitiesState> emit) async {
    final data = await createActivityUseCase(
      params: event.body,
    );

    if (data is DataSuccess) {
      add(const GetActivitiesEvent());
    }

    if (data is DataFailed) {
      emit(ActivityError(data.error!));
    }
  }

  void updateActivity(
      UpdateActivityEvent event, Emitter<ActivitiesState> emit) async {
    final data = await updateActivityUseCase(
        params: UpdateActivityUseCaseParameters(
      activityId: event.activityId,
      body: event.body,
    ));

    if (data is DataSuccess) {
      add(GetActivityByIdEvent(activityId: data.data!.id));
    }

    if (data is DataFailed) {
      emit(ActivityError(data.error!));
    }
  }
}
