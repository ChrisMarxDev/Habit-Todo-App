import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:mindful/app/service_locator.dart';
import 'package:mindful/util/extensions/text_theme_extension.dart';
import 'package:mindful/widgets/misc/logo_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  // static final config = ActionCodeSettings(
  //   androidPackageName : 'com.innofully.christophermarx.mindful',
  //   androidMinimumVersion : '31',
  //   androidInstallApp : true,
  //   dynamicLinkDomain : '',
  //   handleCodeInApp : true,
  //   iOSBundleId : 'com.innofully.christophermarx.mindful',
  //    url : '',
  // );

  static const providerConfigs = [
    EmailProviderConfiguration(),
    AppleProviderConfiguration(),
    // TwitterProviderConfiguration(apiKey: apiKey, apiSecretKey: apiSecretKey, redirectUri: redirectUri),
    GoogleProviderConfiguration(
      clientId:
          '849001467696-stn6ejeia3q0lt1f2dmtcoumteqq9371.apps.googleusercontent.com',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
              elevation: MaterialStateProperty.all(2),
              textStyle: MaterialStateProperty.all(
                Theme.of(context).textTheme.headline5,
              ),
              backgroundColor: MaterialStateProperty.all(context.primary()),
              foregroundColor: MaterialStateProperty.all(context.onPrimary()),
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  side: BorderSide(width: 4, color: Colors.red),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),
            ),
          ),

          // scaffoldBackgroundColor: Colors.red,
          // textTheme:  textThemeGenerator()
        ),
        child: RegisterScreen(
          auth: di.get(),
          // showAuthActionSwitch: true,

          providerConfigs: providerConfigs,
          // actions: const [],
          headerBuilder: (context, constraints, shrinkOffset) {
            return const LogoWidget();
          },
          subtitleBuilder: (context, action) {
            return Text(
              tr('login_screen_subtitle_builder'),
            );
          },
          footerBuilder: (context, action) {
            return Text(
              tr('login_screen_footer_builder'),
              style: Theme.of(context).textTheme.caption,
            );
          },
        ),
      ),
    );
  }
}
