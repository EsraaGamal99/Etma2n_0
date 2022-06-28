class RegisterInitialState extends RegisterStates {}

abstract class RegisterStates {}
class RegisterLoadingState extends RegisterStates {}
class RegisterChangePasswordVisibilityState extends RegisterStates {}
class RegisterSuccessState extends RegisterStates {}
class RegisterErrorState extends RegisterStates {
  final String error;
  RegisterErrorState(this.error) ;
//
}
