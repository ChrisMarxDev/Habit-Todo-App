import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mindful/logic/repositories/purchases_repository.dart';
import 'package:mindful/logic/repositories/user_repository.dart';
import 'package:mindful/util/logging.dart';

part 'login_cubit.freezed.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository authRepository;
  final PurchasesRepository purchasesRepository;

  LoginCubit(this.authRepository, this.purchasesRepository)
      : super(const LoginLoadingState());

  Future<void> init() async {
    // initial check
    final currentUser = authRepository.currentLogin();
    if (currentUser != null) {
      _foundUser(currentUser);
    } else {
      emit(const LoginNotLoggedIn());
    }
    // listen for change
    authRepository.listenToAuth().listen((user) {
      logger.i('listenToAuth user: $user');
      if (user != null) {
        _foundUser(user);
      } else {
        emit(const LoginNotLoggedIn());
      }
    });
  }

  void _foundUser(User user) {
    purchasesRepository.login(user.uid);
    emit(LoginLoggedIn(user: user));
  }

  void logout() {
    authRepository.forceLogout();
    purchasesRepository.logout();
    emit(const LoginNotLoggedIn());
  }
}
