import 'package:clean_architecture_project/features/holidays/domain/usecases/create_holiday.dart';
import 'package:clean_architecture_project/features/holidays/domain/usecases/get_holidays.dart';
import 'package:clean_architecture_project/features/holidays/domain/usecases/get_holidays_by_id.dart';
import 'package:clean_architecture_project/features/holidays/domain/usecases/update_holiday.dart';
import 'package:clean_architecture_project/features/holidays/presentation/bloc/holidays_event.dart';
import 'package:clean_architecture_project/features/holidays/presentation/bloc/holidays_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HolidaysBloc extends Bloc<HolidaysEvent, HolidaysState> {
  final GetHolidaysUseCase getHolidaysUseCase;
  final GetHolidaysByIdUseCase getHolidaysByIdUseCase;
  final CreateHolidaysUseCase createHolidaysUseCase;
  final UpdateHolidaysUseCase updateHolidaysUseCase;

  HolidaysBloc(
    this.createHolidaysUseCase,
    this.getHolidaysByIdUseCase,
    this.getHolidaysUseCase,
    this.updateHolidaysUseCase,
  ) : super(const HolidaysInitial()) {
    on<GetHolidaysEvent>(getHolidays);
    on<GetHolidaysByIdEvent>(getHolidaysById);
    on<CreateHolidayEvent>(createHolidays);
    on<UpdateHolidayEvent>(updateHolidays);
  }

  void getHolidays(GetHolidaysEvent event, Emitter<HolidaysState> emit) async {}

  void getHolidaysById(
      GetHolidaysByIdEvent event, Emitter<HolidaysState> emit) async {}

  void createHolidays(
      CreateHolidayEvent event, Emitter<HolidaysState> emit) async {}

  void updateHolidays(
      UpdateHolidayEvent event, Emitter<HolidaysState> emit) async {}
}
