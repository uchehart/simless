import '../../src/core/routes.dart';
import 'package:flutter/material.dart';
import '../features/onboarding/view/onboarding.dart';
import '../features/airtime/view/airtime.dart';
import '../features/dashboard/view/dashboard.dart';
import '../features/paybills/view/paybills_home_view.dart';

class DashboardRoutes {
  static const airtime = "/airtime";
  static const paybills = "/paybills";
  static const dashboard = "/dashboard";

  // static Route<dynamic> generateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case dashboard:
  //       return MaterialPageRoute(builder: (_) => const Dashboard());
  //     case paybills:
  //       return MaterialPageRoute(builder: (_) => PayBillsView());
  //     case airtime:
  //       return MaterialPageRoute(builder: (_) => Airtime());

  //     default:
  //       return MaterialPageRoute(
  //         builder: (_) => Scaffold(
  //           body: Center(
  //             child: Text('No route defined for ${settings.name}'),
  //           ),
  //         ),
  //       );
  //   }
  // }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboard:
        return MaterialPageRoute(builder: (_) => const Dashboard());
      case paybills:
        return MaterialPageRoute(builder: (_) => PayBillsView());
      case airtime:
        return MaterialPageRoute(builder: (_) => Airtime());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text("No route defined for ${settings.name}")),
          ),
        );
    }
  }
}
