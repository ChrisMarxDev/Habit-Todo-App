import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double widthFactor;

  const LoadingWidget({this.widthFactor = 0.4, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: widthFactor,
        child: const AspectRatio(
          aspectRatio: 1,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
//
// class LoadingDailyEntryWidget extends StatelessWidget {
//   final double widthFactor;
//
//   const LoadingDailyEntryWidget({this.widthFactor = 0.4, Key? key})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(
//         left: Dimens.unit2,
//         right: Dimens.unit2,
//         bottom: Dimens.unit3,
//       ),
//       child: Shimmer(
//         child: BaseCard(
//           borderRaidus: Dimens.borderRadiusInputCard,
//           innerPadding: const EdgeInsets.symmetric(
//             horizontal: Dimens.unit3,
//             vertical: Dimens.unit3,
//           ),
//           color: Colors.grey,
//           child: SizedBox(width: 100,),
//         ),
//       ),
//     );
//   }
// }
