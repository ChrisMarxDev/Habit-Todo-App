import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindful/logic/cubits/premium_subscription/premium_subscription_cubit.dart';
import 'package:mindful/logic/repositories/purchases_repository.dart';
import 'package:mindful/widgets/dialogs/premium_subscription_dialog/premium_subscription_dialog.dart';

class PremiumLockWrapper extends StatelessWidget {
  final Widget child;
  final bool isLocked;

  const PremiumLockWrapper({
    this.isLocked = true,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PremiumSubscriptionCubit, SubscriptionLevel>(
      builder: (context, subscription) {
        if (subscription == SubscriptionLevel.free && isLocked) {
          return GestureDetector(
            onTap: () {
              PremiumSubscriptionDialog.show(context);
            },
            child: Stack(
              children: [
                child,
                const Positioned(
                  top: 0,
                  left: 0,
                  child: Icon(Icons.lock),
                )
              ],
            ),
          );
        } else {
          return child;
        }
      },
    );
  }
}
