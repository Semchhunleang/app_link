part of 'login_bloc.dart';

class LoginModelState extends Equatable {
  // final String text;
  final String phone;
  final String password;
  final String countryCode;
  final LoginState state;
  const LoginModelState({
    // this.text = '',
    this.phone = '',
    this.password = '',
    this.countryCode = '',
    // this.text = 'koxopo2388@rockdian.com',
    // this.password = '1234',
    this.state = const LoginStateInitial(),
  });

  LoginModelState copyWith({
    //  String? text,
    String? phone,
    String? password,
    String? countryCode,
    LoginState? state,
  }) {
    return LoginModelState(
      // text: text ?? this.text,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      countryCode: countryCode ?? this.countryCode,
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    // result.addAll({'email': text.trim()});
    result.addAll({'phone': "$countryCode$phone".trim()});
    result.addAll({'password': password});
    // result.addAll({'state': state});
    return result;
  }

  factory LoginModelState.fromMap(Map<String, dynamic> map) {
    return LoginModelState(
      // text: map['text'] ?? '',
      phone: map['phone'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModelState.fromJson(String source) =>
      LoginModelState.fromMap(json.decode(source));

  @override
  String toString() =>
      'LoginModelState(phone: $phone, password: $password, country_code: $countryCode, state: $state)';

  @override
  List<Object> get props => [phone, password, countryCode, state];
}

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginStateInitial extends LoginState {
  const LoginStateInitial();
}

class LoginStateFormInvalid extends LoginState {
  final Errors error;
  const LoginStateFormInvalid(this.error);
  @override
  List<Object> get props => [error];
}

class LoginStateLoading extends LoginState {
  const LoginStateLoading();
}

class LoginStateLogOutLoading extends LoginState {
  const LoginStateLogOutLoading();
}

class LoginStateLoaded extends LoginState {
  final LoginDataModel user;

  const LoginStateLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class LoginStateUpdatedProfile extends LoginState {
  final UserLoginResponseModel user;

  const LoginStateUpdatedProfile(this.user);

  @override
  List<Object> get props => [user];
}

class LoginStateError extends LoginState {
  final String errorMsg;
  final int statusCode;

  const LoginStateError(this.errorMsg, this.statusCode);

  @override
  List<Object> get props => [errorMsg, statusCode];
}

class LoginStateSignOutError extends LoginState {
  final String errorMsg;
  final int statusCode;

  const LoginStateSignOutError(this.errorMsg, this.statusCode);

  @override
  List<Object> get props => [errorMsg, statusCode];
}

class SendAccountCodeSuccess extends LoginState {
  final String msg;

  const SendAccountCodeSuccess(this.msg);

  @override
  List<Object> get props => [msg];
}

class LoginStateLogOut extends LoginState {
  final String msg;
  final int statusCode;

  const LoginStateLogOut(this.msg, this.statusCode);

  @override
  List<Object> get props => [msg, statusCode];
}
