import 'package:clean_architecture_project/core/resources/data_state.dart';
import 'package:clean_architecture_project/features/authentication/domain/entities/user.dart';
import 'package:clean_architecture_project/features/authentication/domain/usecases/get_clients_of_establishment.dart';
import 'package:clean_architecture_project/features/authentication/domain/usecases/get_logged_user.dart';
import 'package:clean_architecture_project/features/authentication/domain/usecases/get_users.dart';
import 'package:clean_architecture_project/features/authentication/domain/usecases/log_out.dart';
import 'package:clean_architecture_project/features/authentication/domain/usecases/refresh_token.dart';
import 'package:clean_architecture_project/features/authentication/domain/usecases/user_login.dart';
import 'package:clean_architecture_project/features/authentication/domain/usecases/user_register.dart';
import 'package:clean_architecture_project/features/authentication/presentation/bloc/user_event.dart';
import 'package:clean_architecture_project/features/authentication/presentation/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetClientsOfEstablishmentUseCase getClientsOfEstablishmentUseCase;
  final GetLoggedUserUseCase getLoggedUserUseCase;
  final GetUsersUseCase getUsersUseCase;
  final LogOutUseCase logOutUseCase;
  final RefreshTokenUseCase refreshTokenUseCase;
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  UserBloc(
    this.getClientsOfEstablishmentUseCase,
    this.getLoggedUserUseCase,
    this.getUsersUseCase,
    this.logOutUseCase,
    this.loginUseCase,
    this.refreshTokenUseCase,
    this.registerUseCase,
  ) : super(const UserInitial()) {
    on<GetClientsOfEstablishmentEvent>(getClientsOfEstablishment);
    on<GetLoggedUserEvent>(getLoggedUser);
    on<GetUsersEvent>(getUsers);
    on<LogOutEvent>(logOut);
    on<RefreshTokenEvent>(refreshToken);
    on<LoginEvent>(login);
    on<RegisterEvent>(register);
  }

  void getClientsOfEstablishment(
      GetClientsOfEstablishmentEvent event, Emitter<UserState> emit) async {
    final data = await getClientsOfEstablishmentUseCase(
      params: event.establishmentId,
    );

    if (state is DataSuccess) {
      emit(UsersLoaded(data.data!));
    }

    if (state is DataFailed) {
      emit(UsersError(data.error!));
    }
  }

  void getLoggedUser(GetLoggedUserEvent event, Emitter<UserState> emit) async {
    final data = await getLoggedUserUseCase();

    if (data is DataSuccess) {
      emit(UserLoaded(data.data!));
    }

    if (data is DataFailed) {
      emit(UserError(data.error!));
    }
  }

  void getUsers(GetUsersEvent event, Emitter<UserState> emit) async {
    final data = await getUsersUseCase(
      params: GetUsersUseCaseParameters(
        establishmentId: event.establishmentId,
        role: event.role,
      ),
    );

    if (data is DataSuccess) {
      emit(UsersLoaded(data.data!));
    }

    if (data is DataFailed) {
      emit(UsersError(data.error!));
    }
  }

  void logOut(LogOutEvent event, Emitter<UserState> emit) async {
    // final data = await logOutUseCase();

    //TODO: implement removal of tokens
  }

  void refreshToken(RefreshTokenEvent event, Emitter<UserState> emit) async {
    // final data = await refreshTokenUseCase(
    //   params: "",
    // );

    //TODO: implement reset of refresh_token
  }

  void login(LoginEvent event, Emitter<UserState> emit) async {
    final data = await loginUseCase(
      params: LoginRequestEntity(
        email: event.email,
        password: event.password,
      ),
    );

    if (data is DataSuccess) {
      //TODO: implement login and set of tokens and redirect
    }

    if (data is DataFailed) {
      emit(UserError(data.error!));
    }
  }

  void register(RegisterEvent event, Emitter<UserState> emit) async {
    final data = await registerUseCase(
      params: RegisterRequestEntity(
        emailAddress: event.email,
        firstname: event.firstname,
        lastname: event.lastname,
        password: event.password,
      ),
    );

    if (data is DataSuccess) {
      //TODO: implement register and set tokens and redirect
    }

    if (data is DataFailed) {
      emit(UserError(data.error!));
    }
  }
}
