import 'dart:io';

import 'package:flutter/services.dart';
import 'package:mindful/app/bootstrap.dart';
import 'package:mindful/util/logging.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchasesRepository {
  Future<void> initPlatformState() async {
    await Purchases.setDebugLogsEnabled(true);

    if (Platform.isAndroid) {
      if (kAppFlavor == Flavor.production) {
        await Purchases.setup('goog_WCYbnmhhMDOaVdHfduaKXxYnHbS');
      } else {
        await Purchases.setup('goog_CZbkYOqTsTTIhantquYLBWDNRqy');
      }
    } else if (Platform.isIOS) {
      await Purchases.setup('public_ios_sdk_key');
      // OR: if building for Amazon, be sure to follow the installation instructions then:
      // await Purchases.setup("public_amazon_sdk_key", useAmazon: true);
    }
  }

  Future<Offering?> getOffering() async {
    try {
      final offerings = await Purchases.getOfferings();
      // TODO make more stable
      return offerings.current;
      // if (offerings.current != null) {
      //   // offerings.current.monthly.
      //   // Display current offering with offerings.current
      // }
    } on PlatformException catch (e) {
      // optional error handling
      logger.e(e);
    }
    return null;
  }

  Future<SubscriptionLevel> makePurchase(Package package) async {
    try {
      final purchaserInfo = await Purchases.purchasePackage(package);
      return purchaserInfo.getSubscriptionLevel();
    } on PlatformException catch (e) {
      final errorCode = PurchasesErrorHelper.getErrorCode(e);
      if (errorCode != PurchasesErrorCode.purchaseCancelledError) {
        logger.e(e);
      }
      return SubscriptionLevel.free;
    }
  }

  Future<SubscriptionLevel> login(String userId) async {
    try {
      await Purchases.logIn(userId);
      return getEntitlement();
    } on Exception catch (e) {
      logger.e(e.toString());
      return SubscriptionLevel.free;
    }
  }

  Future<void> logout() async {
    try {
      await Purchases.logOut();
    } on Exception catch (e) {
      logger.e(e.toString());
      return;
    }
  }

  Future<SubscriptionLevel> getEntitlement() async {
    final purchaserInfo = await Purchases.getPurchaserInfo();
    return purchaserInfo.getSubscriptionLevel();
  }
}

const _premiumEntitlement = 'premium';

enum SubscriptionLevel { free, premium }

extension EntitlementGetter on PurchaserInfo {
  Future<SubscriptionLevel> getSubscriptionLevel() async {
    if (entitlements.all[_premiumEntitlement]?.isActive == true) {
      return SubscriptionLevel.premium;
    } else {
      return SubscriptionLevel.free;
    }
  }
}
