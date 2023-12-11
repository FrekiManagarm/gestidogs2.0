import 'package:clean_architecture_project/features/holidays/domain/entities/holiday_entity.dart';

abstract class HolidaysEvent {
  const HolidaysEvent();
}

class GetHolidaysEvent extends HolidaysEvent {
  final String? employeeId;
  final String? establishmentId;

  const GetHolidaysEvent({
    this.employeeId,
    this.establishmentId,
  });
}

class GetHolidaysByIdEvent extends HolidaysEvent {
  final String? holidayId;

  const GetHolidaysByIdEvent({
    this.holidayId,
  });
}

class CreateHolidayEvent extends HolidaysEvent {
  final HolidaysRequestEntity? body;

  const CreateHolidayEvent({
    this.body,
  });
}

class UpdateHolidayEvent extends HolidaysEvent {
  final String? holidayId;
  final HolidaysRequestEntity? body;
  
  const UpdateHolidayEvent({
    this.body,
    this.holidayId,
  });
}
