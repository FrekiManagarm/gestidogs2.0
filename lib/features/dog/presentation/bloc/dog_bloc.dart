import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/features/dog/domain/usecases/create_dog.dart';
import 'package:clean_architecture_project/features/dog/domain/usecases/get_dog_by_id.dart';
import 'package:clean_architecture_project/features/dog/domain/usecases/get_dogs.dart';
import 'package:clean_architecture_project/features/dog/domain/usecases/update_dog.dart';
import 'package:clean_architecture_project/features/dog/presentation/bloc/dog_event.dart';
import 'package:clean_architecture_project/features/dog/presentation/bloc/dog_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogBloc extends Bloc<DogEvent, DogState> {
  final GetDogsUseCase getDogsUseCase;
  final GetDogByIdUseCase getDogByIdUseCase;
  final CreateDogUseCase createDogUseCase;
  final UpdateDogUseCase updateDogUseCase;

  DogBloc(
    this.createDogUseCase,
    this.getDogByIdUseCase,
    this.getDogsUseCase,
    this.updateDogUseCase,
  ) : super(const DogInitial()) {
    on<GetDogsEvent>(getDogs);
    on<GetDogByIdEvent>(getDogById);
    on<CreateDogEvent>(createDog);
    on<UpdateDogEvent>(updateDog);
  }

  void getDogs(GetDogsEvent event, Emitter<DogState> emit) async {
    final data = await getDogsUseCase(
      params: GetDogsUseCaseParameters(
        establishmentId: event.establishmentId,
        ownerId: event.ownerId,
      ),
    );

    if (data is DataSuccess) {
      emit(DogsLoaded(data.data!));
    }

    if (data is DataFailed) {
      emit(DogsError(data.error!));
    }
  }

  void getDogById(GetDogByIdEvent event, Emitter<DogState> emit) async {
    final data = await getDogByIdUseCase(
      params: event.dogId,
    );

    if (data is DataSuccess) {
      emit(DogLoaded(data.data!));
    }

    if (data is DataFailed) {
      emit(DogError(data.error!));
    }
  }

  void createDog(CreateDogEvent event, Emitter<DogState> emit) async {
    final data = await createDogUseCase(
      params: event.body,
    );

    if (data is DataSuccess) {
      emit(DogLoaded(data.data!));
    }

    if (data is DataFailed) {
      emit(DogError(data.error!));
    }
  }

  void updateDog(UpdateDogEvent event, Emitter<DogState> emit) async {
    final data = await updateDogUseCase(
      params: UpdateDogUseCaseParameters(
        body: event.body,
        dogId: event.dogId,
      ),
    );

    if (data is DataSuccess) {
      emit(DogLoaded(data.data!));
    }

    if (data is DataFailed) {
      emit(DogError(data.error!));
    }
  }
}
