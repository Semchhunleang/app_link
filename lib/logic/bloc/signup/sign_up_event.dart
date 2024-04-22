part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

// class SignUpEventName extends SignUpEvent {
//   final String name;

//   const SignUpEventName(this.name);

//   @override
//   List<Object> get props => [name];
// }

class SignUpEventFirstName extends SignUpEvent {
  final String firstName;

  const SignUpEventFirstName(this.firstName);

  @override
  List<Object> get props => [firstName];
}

class SignUpEventLastName extends SignUpEvent {
  final String lastName;

  const SignUpEventLastName(this.lastName);

  @override
  List<Object> get props => [lastName];
}

class SignUpEventEmail extends SignUpEvent {
  final String email;

  const SignUpEventEmail(this.email);

  @override
  List<Object> get props => [email];
}

class SignUpEventPhone extends SignUpEvent {
  final String phone;
  final String countryCode;
  final String refCode;

  const SignUpEventPhone(this.phone, this.countryCode, this.refCode);

  @override
  List<Object> get props => [phone, countryCode];
}

// class SignUpEventCountryCode extends SignUpEvent {
//   final String code;

//   const SignUpEventCountryCode(this.code);

//   @override
//   List<Object> get props => [code];
// }

// class SignUpEventRefCode extends SignUpEvent {
//   final String refCode;

//   const SignUpEventRefCode(this.refCode);

//   @override
//   List<Object> get props => [refCode];
// }

class SignUpEventPassword extends SignUpEvent {
  final String password;

  const SignUpEventPassword(this.password);

  @override
  List<Object> get props => [password];
}

class SignUpEventPasswordConfirm extends SignUpEvent {
  final String passwordConfirm;

  const SignUpEventPasswordConfirm(this.passwordConfirm);

  @override
  List<Object> get props => [passwordConfirm];
}

class SignUpEventAgree extends SignUpEvent {
  final int agree;

  const SignUpEventAgree(this.agree);

  @override
  List<Object> get props => [agree];
}

class SignUpEventSubmit extends SignUpEvent {}

class AccountActivateCodeSubmit extends SignUpEvent {
  final String code;

  const AccountActivateCodeSubmit(this.code);

  @override
  List<Object> get props => [code];
}

class SignUpEventFormDataClear extends SignUpEvent {
  const SignUpEventFormDataClear();
}

class SignUpEventResendCodeSubmit extends SignUpEvent {
  final String email;

  const SignUpEventResendCodeSubmit(this.email);

  @override
  List<Object> get props => [email];
}
