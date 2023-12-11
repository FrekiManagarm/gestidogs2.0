import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/features/holidays/domain/entities/holiday_entity.dart';

abstract class HolidayRepository {
  Future<DataState<List<HolidayEntity>>> getHolidays({
    String? employeeId,
    String? establishmentId,
  });

  Future<DataState<HolidayEntity>> getHolidayById({String? holidayId});

  Future<DataState<HolidayEntity>> createHoliday({
    HolidaysRequestEntity? body,
  });

  Future<DataState<HolidayEntity>> modifyHoliday({
    String? holidayId,
    HolidaysRequestEntity? body,
  });
}
