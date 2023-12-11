import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/holidays/domain/entities/holiday_entity.dart';
import 'package:clean_architecture_project/features/holidays/domain/repositories/holiday_repository.dart';

class CreateHolidaysUseCase
    implements UseCase<DataState<HolidayEntity>, HolidaysRequestEntity> {
  final HolidayRepository repository;

  CreateHolidaysUseCase(this.repository);

  @override
  Future<DataState<HolidayEntity>> call({HolidaysRequestEntity? params}) {
    return repository.createHoliday(
      body: params,
    );
  }
}
