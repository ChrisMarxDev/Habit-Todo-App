part of 'premium_offering_cubit.dart';

@freezed
class PremiumOfferingState with _$PremiumOfferingState {
  const factory PremiumOfferingState.init() = PremiumOfferingInitialState;
  const factory PremiumOfferingState.content({required Offering offering}) =
      PremiumOfferingContentState;
  const factory PremiumOfferingState.error() = PremiumOfferingErrorState;
}
