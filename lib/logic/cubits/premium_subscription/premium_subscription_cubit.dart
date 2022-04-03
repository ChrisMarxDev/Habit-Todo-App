import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindful/logic/repositories/purchases_repository.dart';

class PremiumSubscriptionCubit extends Cubit<SubscriptionLevel> {
  final PurchasesRepository purchasesRepository;

  PremiumSubscriptionCubit({required this.purchasesRepository})
      : super(SubscriptionLevel.free);

  void init() {
    // purchasesRepository.initPlatformState();
  }

  Future<void> refreshSubscriptionState() async {
    final subscription = await purchasesRepository.getEntitlement();
    emit(subscription);
  }

  // Future<void> login(String userId) async {
  //   purchasesRepository.getOffering()
  //   final subscriptionLevel = await purchasesRepository.login(userId);
  //   emit(subscriptionLevel);
  // }
  //
  // Future<void> logout() async {
  //   await purchasesRepository.logout();
  //   emit(SubscriptionLevel.free);
  // }
}

SubscriptionLevel getSubscriptionLevel(BuildContext context) {
  return context.watch<PremiumSubscriptionCubit>().state;
}
