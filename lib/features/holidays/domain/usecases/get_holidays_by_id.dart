import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/holidays/domain/entities/holiday_entity.dart';
import 'package:clean_architecture_project/features/holidays/domain/repositories/holiday_repository.dart';

class GetHolidaysByIdUseCase
    implements UseCase<DataState<HolidayEntity>, String> {
  final HolidayRepository repository;

  GetHolidaysByIdUseCase(this.repository);

  @override
  Future<DataState<HolidayEntity>> call({String? params}) {
    return repository.getHolidayById(
      holidayId: params,
    );
  }
}
