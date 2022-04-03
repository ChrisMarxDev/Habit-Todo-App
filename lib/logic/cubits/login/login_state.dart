part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.loading() = LoginLoadingState;
  const factory LoginState.loggedIn({required User user}) = LoginLoggedIn;
  const factory LoginState.loggedOut() = LoginNotLoggedIn;
  // const factory LoginState.onboarding() = OnboardingState;
}
