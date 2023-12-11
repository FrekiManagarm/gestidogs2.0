import 'package:clean_architecture_project/features/establishment/domain/entities/establishment_entity.dart';
import 'package:dio/dio.dart';

abstract class EstablishmentState {
  final List<EstablishmentEntity>? establishments;
  final EstablishmentEntity? establishment;
  final DioException? error;

  const EstablishmentState({
    this.error,
    this.establishment,
    this.establishments,
  });
}

class EstablishmentsInitial extends EstablishmentState {
  const EstablishmentsInitial();
}

class EstablishmentsLoading extends EstablishmentState {
  const EstablishmentsLoading();
}

class EstablishmentsLoaded extends EstablishmentState {
  const EstablishmentsLoaded(List<EstablishmentEntity> establishments)
      : super(establishments: establishments);
}

class EstablishmentsError extends EstablishmentState {
  const EstablishmentsError(DioException error) : super(error: error);
}

class EstablishmentLoading extends EstablishmentState {
  const EstablishmentLoading();
}

class EstablishmentLoaded extends EstablishmentState {
  const EstablishmentLoaded(EstablishmentEntity establishment)
      : super(establishment: establishment);
}

class EstablishmentError extends EstablishmentState {
  const EstablishmentError(DioException error) : super(error: error);
}
