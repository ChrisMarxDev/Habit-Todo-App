import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mindful/logic/repositories/purchases_repository.dart';
import 'package:mindful/util/logging.dart';
import 'package:purchases_flutter/models/offering_wrapper.dart';

part 'premium_offering_state.dart';

part 'premium_offering_cubit.freezed.dart';

class PremiumOfferingCubit extends Cubit<PremiumOfferingState> {
  final PurchasesRepository purchasesRepository;

  PremiumOfferingCubit({required this.purchasesRepository})
      : super(const PremiumOfferingInitialState());

  Future<void> init() async {
    try {
      final offering = await purchasesRepository.getOffering();
      if (offering != null) {
        emit(PremiumOfferingContentState(offering: offering));
      } else {
        emit(const PremiumOfferingErrorState());
      }
    } on Exception catch (e) {
      logger.e(e.toString());
      // await di.get<FirebaseCrashlytics>()recordError(
      //     error,
      //     stackTrace,
      //     reason: 'a non-fatal error'
      // );
      emit(const PremiumOfferingErrorState());
    }
  }
}
