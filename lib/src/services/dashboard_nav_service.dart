// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class DashboardNavigationService {
//   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//   Future<T?>? navigateToNamed<T extends Object?>(String routeName,
//       {Object? arguments}) {
//     return navigatorKey.currentState
//         ?.pushNamed(routeName, arguments: arguments);
//   }

//   Future<T?>? navigateOffNamed<T extends Object?, TO extends Object?>(
//     String routeName, {
//     Object? arguments,
//     TO? result,
//   }) {
//     return navigatorKey.currentState?.pushReplacementNamed(
//       routeName,
//       result: result,
//       arguments: arguments,
//     );
//   }

//   Future<T?>? navigateOffAll<T extends Object?>(
//       Route<T> newRoute, bool Function(Route<dynamic>) predicate) {
//     return navigatorKey.currentState?.pushAndRemoveUntil(
//       newRoute,
//       predicate,
//     );
//   }

//   Future<bool>? maybePop<T extends Object?>([T? result]) {
//     return navigatorKey.currentState?.maybePop(result);
//   }

//   void navigateToFirst() {
//     navigatorKey.currentState?.popUntil((route) => route.isFirst);
//   }

//   void navigateBack<T extends Object?>([T? result]) {
//     navigatorKey.currentState?.pop(result);
//   }
// }

// final dashboardNavService = Provider((ref) => DashboardNavigationService());
