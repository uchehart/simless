import 'package:flutter/material.dart';
import 'package:simless/src/features/dashboard/view/dashboard.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../src/core/routes.dart';
import '../src/services/navigation_service.dart';
// import 'package:simless/src/features/onboarding/view/onboarding.dart';
// import 'package:simless/src/features/airtime/view/airtime.dart';
//
// import 'package:simless/src/features/paybills/view/paybills_home_view.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Dashboard(),
      navigatorKey: ref.read(navigationService).navigatorKey,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
