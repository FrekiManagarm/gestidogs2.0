import 'package:clean_architecture_project/features/holidays/domain/entities/holiday_entity.dart';
import 'package:dio/dio.dart';

abstract class HolidaysState {
  final List<HolidayEntity>? holidays;
  final HolidayEntity? holiday;
  final DioException? error;

  const HolidaysState({
    this.error,
    this.holiday,
    this.holidays,
  });
}

class HolidaysInitial extends HolidaysState {
  const HolidaysInitial();
}

class HolidaysLoading extends HolidaysState {
  const HolidaysLoading();
}

class HolidaysLoaded extends HolidaysState {
  const HolidaysLoaded(List<HolidayEntity> holidays)
      : super(holidays: holidays);
}

class HolidaysError extends HolidaysState {
  const HolidaysError(DioException error) : super(error: error);
}

class HolidayLoading extends HolidaysState {
  const HolidayLoading();
}

class HolidayLoaded extends HolidaysState {
  const HolidayLoaded(HolidayEntity holiday) : super(holiday: holiday);
}

class HolidayError extends HolidaysState {
  const HolidayError(DioException error) : super(error: error);
}
