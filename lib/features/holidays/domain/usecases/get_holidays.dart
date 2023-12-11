import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/core/usecases/usecase.dart';
import 'package:clean_architecture_project/features/holidays/domain/entities/holiday_entity.dart';
import 'package:clean_architecture_project/features/holidays/domain/repositories/holiday_repository.dart';

class GetHolidaysUseCaseParameters {
  final String? employeeId;
  final String? establishmentId;

  const GetHolidaysUseCaseParameters({
    this.employeeId,
    this.establishmentId,
  });
}

class GetHolidaysUseCase
    implements UseCase<DataState<List<HolidayEntity>>, GetHolidaysUseCaseParameters> {
  final HolidayRepository repository;

  GetHolidaysUseCase(this.repository);

  @override
  Future<DataState<List<HolidayEntity>>> call({GetHolidaysUseCaseParameters? params}) {
    return repository.getHolidays(
      employeeId: params!.employeeId,
      establishmentId: params.establishmentId,
    );
  }
}
