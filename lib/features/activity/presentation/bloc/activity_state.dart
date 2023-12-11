import 'package:clean_architecture_project/features/activity/domain/entities/activity_entity.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class ActivitiesState extends Equatable {
  final List<ActivityEntity>? activities;
  final ActivityEntity? activity;
  final DioException? error;

  const ActivitiesState({
    this.activities,
    this.activity,
    this.error,
  });

  @override
  List<Object> get props => [
        error!,
        activities!,
      ];
}

class ActivitiesLoading extends ActivitiesState {
  const ActivitiesLoading();
}

class ActivitiesLoaded extends ActivitiesState {
  const ActivitiesLoaded(List<ActivityEntity> activities)
      : super(activities: activities);
}

class ActivitiesError extends ActivitiesState {
  const ActivitiesError(DioException error) : super(error: error);
}

class ActivityLoading extends ActivitiesState {
  const ActivityLoading();
}

class ActivityLoaded extends ActivitiesState {
  const ActivityLoaded(ActivityEntity activity) : super(activity: activity);
}

class ActivityError extends ActivitiesState {
  const ActivityError(DioException error) : super(error: error);
}
