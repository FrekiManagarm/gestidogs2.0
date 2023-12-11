import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/holidays/domain/entities/holiday_entity.dart';
import 'package:clean_architecture_project/features/holidays/domain/repositories/holiday_repository.dart';

class UpdateHolidaysUseCaseParameters {
  final String? holidaysId;
  final HolidaysRequestEntity? body;

  UpdateHolidaysUseCaseParameters({
    this.body,
    this.holidaysId,
  });
}

class UpdateHolidaysUseCase
    implements
        UseCase<DataState<HolidayEntity>, UpdateHolidaysUseCaseParameters> {
  final HolidayRepository repository;

  UpdateHolidaysUseCase(this.repository);

  @override
  Future<DataState<HolidayEntity>> call(
      {UpdateHolidaysUseCaseParameters? params}) {
    return repository.modifyHoliday(
      holidayId: params!.holidaysId,
      body: params.body,
    );
  }
}
