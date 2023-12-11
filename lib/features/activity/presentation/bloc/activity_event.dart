import 'package:clean_architecture_project/features/activity/data/models/activity.dart';

abstract class ActivitiesEvent {
  const ActivitiesEvent();
}

class GetActivitiesEvent extends ActivitiesEvent {
  final String? establishmentId;

  const GetActivitiesEvent({
    this.establishmentId,
  });
}

class GetActivityByIdEvent extends ActivitiesEvent {
  final String? activityId;

  const GetActivityByIdEvent({
    this.activityId,
  });
}

class CreateActivityEvent extends ActivitiesEvent {
  final ActivityRequest? body;

  const CreateActivityEvent({
    this.body,
  });
}

class UpdateActivityEvent extends ActivitiesEvent {
  final String? activityId;
  final ActivityRequest? body;

  const UpdateActivityEvent({
    this.activityId,
    this.body,
  });
}
