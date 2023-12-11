abstract class UserEvent {
  const UserEvent();
}

class GetClientsOfEstablishmentEvent extends UserEvent {
  final String? establishmentId;

  const GetClientsOfEstablishmentEvent({
    this.establishmentId,
  });
}

class GetLoggedUserEvent extends UserEvent {
  const GetLoggedUserEvent();
}

class GetUsersEvent extends UserEvent {
  final String? establishmentId;
  final String? role;

  const GetUsersEvent({
    this.establishmentId,
    this.role,
  });
}

class LogOutEvent extends UserEvent {
  const LogOutEvent();
}

class RefreshTokenEvent extends UserEvent {
  const RefreshTokenEvent();
}

class LoginEvent extends UserEvent {
  final String? email;
  final String? password;

  const LoginEvent({
    this.email,
    this.password,
  });
}

class RegisterEvent extends UserEvent {
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? password;

  const RegisterEvent({
    this.email,
    this.firstname,
    this.lastname,
    this.password,
  });
}
