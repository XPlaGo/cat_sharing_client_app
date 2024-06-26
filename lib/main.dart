import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cat_sharing_client_app/generated/auth.pb.dart';
import 'package:cat_sharing_client_app/injection/injection.dart';
import 'package:cat_sharing_client_app/pages/about/about_page.dart';
import 'package:cat_sharing_client_app/pages/auth/auth_email_page.dart';
import 'package:cat_sharing_client_app/pages/auth/auth_signin_page.dart';
import 'package:cat_sharing_client_app/pages/auth/auth_signup_page.dart';
import 'package:cat_sharing_client_app/pages/auth/auth_verify_page.dart';
import 'package:cat_sharing_client_app/pages/home/home_page.dart';
import 'package:cat_sharing_client_app/pages/my_cat/my_cat_page.dart';
import 'package:cat_sharing_client_app/pages/my_cats/my_cats_page.dart';
import 'package:cat_sharing_client_app/pages/my_payment_account/my_payment_account_page.dart';
import 'package:cat_sharing_client_app/pages/offer_page/offer_page.dart';
import 'package:cat_sharing_client_app/pages/profile/profile_page.dart';
import 'package:cat_sharing_client_app/pages/replenish/replenish_page.dart';
import 'package:cat_sharing_client_app/pages/sale_offers/sale_offers_page.dart';
import 'package:cat_sharing_client_app/pages/search/search_page.dart';
import 'package:cat_sharing_client_app/pages/settings/settings_page.dart';
import 'package:cat_sharing_client_app/pages/transactions_history/transaction_history_page.dart';
import 'package:cat_sharing_client_app/pages/transfer/transfer_page.dart';
import 'package:cat_sharing_client_app/services/auth_service.dart';
import 'package:cat_sharing_client_app/themes/default_dark_theme.dart';
import 'package:cat_sharing_client_app/themes/default_light_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';
import 'package:global_configuration/global_configuration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await loadConfiguration();
  await configureDependencies();
  bool authSuccessfully = await refreshAuth();
  FlutterNativeSplash.remove();
  runApp(MyApp(authSuccessfully: authSuccessfully));
}

Future<bool> refreshAuth() async {
  AuthService authService = GetIt.instance<AuthService>();
  try {
    TokenWithUserResponse response = await authService.refresh();
    if (response.hasAccessToken()) {
      return true;
    }
    return false;
  } catch (e) {
    return false;
  }
}

Future<void> loadConfiguration() async {
  await GlobalConfiguration().loadFromAsset("prod");
}

class MyApp extends StatelessWidget {

  final bool authSuccessfully;

  const MyApp({
    super.key,
    required this.authSuccessfully
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: getDefaultLightTheme(context),
        dark: getDefaultDarkTheme(context),
        initial: AdaptiveThemeMode.system,
        builder: (theme, darkTheme) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Cat Sharing',
            theme: theme,
            darkTheme: darkTheme,
            initialRoute: authSuccessfully ? "/" : "/auth_email",
            routes: {
              "/": settingPageParameters(const HomePage()),
              "/mycats": settingPageParameters(const MyCatsPage()),
              "/search": settingPageParameters(const SearchPage()),
              "/settings": settingPageParameters(const SettingsPage()),
              "/about": settingPageParameters(const AboutPage()),
              "/profile": settingPageParameters(const ProfilePage()),
              "/auth_email": settingPageParameters(const AuthEmailPage()),
              "/auth_verify": settingPageParameters(const AuthVerifyPage()),
              "/auth_signin": settingPageParameters(const AuthSigninPage()),
              "/auth_signup": settingPageParameters(const AuthSignupPage()),
              "/my_cat": settingPageParameters(const MyCatPage()),
              "/my_payment_account": settingPageParameters(const MyPaymentAccountPage()),
              TransferPage.pageRoute: settingPageParameters(const TransferPage()),
              ReplenishPage.pageRoute: settingPageParameters(const ReplenishPage()),
              TransactionHistoryPage.pageRoute: settingPageParameters(const TransactionHistoryPage()),
              SaleOffersPage.pageRoute: settingPageParameters(const SaleOffersPage()),
              OfferPage.pageRoute: settingPageParameters(const OfferPage()),
            },
          );
        },
    );
  }

  Widget Function(BuildContext) settingPageParameters(Widget page) {
    return (context) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Theme.of(context).brightness == Brightness.dark ?
        Brightness.light : Brightness.dark,
        statusBarIconBrightness: Theme.of(context).brightness == Brightness.dark ?
        Brightness.light : Brightness.dark,
      ));
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      return page;
    };
  }
}