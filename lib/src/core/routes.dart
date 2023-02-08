import 'package:flutter/material.dart';

//import '../features/notification/views/notifcation_screen.dart';
import '../features/onboarding/view/onboarding.dart';
import '../features/airtime/view/airtime.dart';
import '../features/dashboard/view/dashboard.dart';
import '../features/paybills/view/paybills_home_view.dart';

class Routes {
  static const splash = '/splash';
  static const onboarding = "/onboarding";
  static const paybills = "/paybills";
  static const airtime = "/airtime";

  static const changePassword = "/changePassword";
  static const forgotPassword = "/forgotPassword";
  static const resetPassword = "/resetPassword";
  static const signinView = "/signinView";
  static const signupView = "/signupView";
  static const verifyCode = "/verifyCode";
  static const loginWithPhone = "/loginWithPhone";
  static const loginWithEmail = "/loginWithEmail";
  static const verifyPhoneNumber = "/verifyPhoneNumber";
  static const notification = '/notification';
  static const pushNotification = '/pushNotification';
  static const openPushNotification = '/openPushNotification';
  static const dashboard = "/dashboard";

  static const menuDetailsView = "/menuDetailsView";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboarding:
        return MaterialPageRoute(builder: (_) => const Onboarding());
      case paybills:
        return MaterialPageRoute(builder: (_) => PayBillsView());
      case airtime:
        return MaterialPageRoute(builder: (_) => Airtime());
      case dashboard:
        return MaterialPageRoute(builder: (_) => const Dashboard());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
