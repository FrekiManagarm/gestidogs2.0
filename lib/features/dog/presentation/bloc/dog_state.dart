import 'package:clean_architecture_project/features/dog/domain/entities/dog_entity.dart';
import 'package:dio/dio.dart';

abstract class DogState {
  final DogEntity? dog;
  final List<DogEntity>? dogs;
  final DioException? error;

  const DogState({
    this.dog,
    this.dogs,
    this.error,
  });
}

class DogInitial extends DogState {
  const DogInitial();
}

class DogsLoading extends DogState {
  const DogsLoading();
}

class DogsLoaded extends DogState {
  const DogsLoaded(List<DogEntity> dogs) : super(dogs: dogs);
}

class DogsError extends DogState {
  const DogsError(DioException error) : super(error: error);
}

class DogLoading extends DogState {
  const DogLoading();
}

class DogLoaded extends DogState {
  const DogLoaded(DogEntity dog) : super(dog: dog);
}

class DogError extends DogState {
  const DogError(DioException error) : super(error: error);
}
