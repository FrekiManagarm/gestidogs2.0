import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/features/activity/domain/entities/activity_entity.dart';

abstract class ActivityRepository {
  Future<DataState<List<ActivityEntity>>> getActivities(
    String? establishmentId,
  );

  Future<DataState<ActivityEntity>> getActivityById(
    String? activityId,
  );

  Future<DataState<ActivityEntity>> createActivity(
    ActivityRequestEntity? body,
  );

  Future<DataState<ActivityEntity>> updateActivity(
    ActivityRequestEntity? body,
    String? activityId,
  );
}
