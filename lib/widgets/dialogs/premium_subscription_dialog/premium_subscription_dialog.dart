import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mindful/widgets/misc/loading_widget.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import 'premium_offering_cubit.dart';

class PremiumSubscriptionDialog extends StatelessWidget {
  const PremiumSubscriptionDialog({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return const PremiumSubscriptionDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocBuilder<PremiumOfferingCubit, PremiumOfferingState>(
        builder: (context, state) {
          return state.map<Widget>(
            init: (state) => const LoadingWidget(),
            content: (state) => BuyPremiumDialogContent(
              offering: state.offering,
            ),
            error: (state) {
              // TODO add retry button
              return const LoadingWidget();
            },
          );
        },
      ),
    );
  }
}

class BuyPremiumDialogContent extends StatelessWidget {
  final Offering offering;

  const BuyPremiumDialogContent({
    required this.offering,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.633,
      child: Padding(
        padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
        child: Column(
          children: [
            Text(
              tr('buy_premium_title'),
            ),
            Text(
              tr('buy_premium_description'),
            ),
            Row(
              children: [
                OfferingCard(offering.monthly!),
                OfferingCard(offering.annual!),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OfferingCard extends StatelessWidget {
  final Package package;

  const OfferingCard(this.package, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          package.product.title,
        ),
        Text(
          package.product.description,
        ),
        Text(
          package.product.priceString,
        ),
      ],
    );
  }
}
