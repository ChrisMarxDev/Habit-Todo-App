import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindful/app/service_locator.dart';
import 'package:mindful/logic/cubits/brightness/brightness_cubit.dart';
import 'package:mindful/logic/cubits/color_palette/color_palette_cubit.dart';
import 'package:mindful/logic/cubits/login/login_cubit.dart';
import 'package:mindful/logic/cubits/premium_subscription/premium_subscription_cubit.dart';
import 'package:mindful/screens/edit_daily_routine/edit_routine_cubit.dart';
import 'package:mindful/widgets/dialogs/premium_subscription_dialog/premium_offering_cubit.dart';

class CubitInit extends StatelessWidget {
  final Widget child;

  const CubitInit({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
          create: (_) => LoginCubit(di.get(), di.get())..init(),
        ),
        BlocProvider(create: (_) => BrightnessCubit(di.get())),
        BlocProvider(
          lazy: true,
          create: (_) =>
              PremiumOfferingCubit(purchasesRepository: di.get())..init(),
        ),
        BlocProvider(
          lazy: true,
          create: (_) => PremiumSubscriptionCubit(
            purchasesRepository: di.get(),
          ),
        ),
        BlocProvider(
          create: (_) => ColorPaletteCubit(
            sharedPreferencesRepository: di.get(),
          ),
        ),
        BlocProvider(
          lazy: true,
          create: (context) => EditRoutineCubit(firestoreManager: di.get()),
        ),
      ],
      child: child,
    );
  }
}
