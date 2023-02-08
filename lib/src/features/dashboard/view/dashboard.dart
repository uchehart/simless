import "package:flutter/material.dart";
import '../../../core/dashboard_routes.dart';
//import '../../../services/dashboard_nav_service.dart';

import '../../../services/navigation_service.dart';
import '../../../core/app_textstyle.dart';
import '../../../core/colors.dart';
import '../../../core/images.dart';
//import '../../../core/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
//import '../../../features/airtime/view/airtime.dart';

class Dashboard extends ConsumerWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          toolbarTextStyle: TextStyle(color: AppColors.black),
          foregroundColor: Colors.black,
          // iconTheme: Icon(
          //   Icons.menu,
          // ),
          elevation: 0.0,
        ),
        drawer: const NavigationDrawer(),
        bottomNavigationBar: const BottomNavBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              color: AppColors.white,
              margin: const EdgeInsets.only(bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   margin: const EdgeInsets.symmetric(
                  //       horizontal: 26, vertical: 10),
                  //   child: const Icon(Icons.menu),
                  // ),
                  const BalanceBox(),

                  GestureDetector(
                    onTap: () {
                      print("clicked");
                      print("run code");
                      ;
                      ref
                          .read(navigationService)
                          .navigateToNamed(DashboardRoutes.airtime);

                      print("finished");
                    },
                    child: const MenuBox(
                        title: "Buy airtime",
                        firstColor: Color(0xFF2196F3),
                        secondColor: Color(0xFF24B8C9),
                        image: AppImage.airtime),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("clicked");
                      print("run code");
                      ;
                      ref
                          .read(navigationService)
                          .navigateToNamed(DashboardRoutes.paybills);

                      print("finished");
                    },
                    child: const MenuBox(
                        borderColor: Color(0xFFF7505C),
                        title: "Paybills",
                        firstColor: Color(0xFFF0940B),
                        secondColor: Color(0xFFF7505C),
                        image: AppImage.paybills),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("clicked");
                      print("run code");
                      ;
                      ref
                          .read(navigationService)
                          .navigateToNamed(DashboardRoutes.paybills);

                      print("finished");
                    },
                    child: const MenuBox(
                        title: "Send\nBulk SMS",
                        borderColor: Color(0xFFFFA126),
                        image: AppImage.sms),
                  ),
                  //BottomNavBar(),
                ],
              ),
            ),
          ),
        ));
  }
}

class BalanceBox extends StatelessWidget {
  const BalanceBox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
      width: 374,
      height: 195,
      decoration: BoxDecoration(
          color: AppColors.mainColor, borderRadius: BorderRadius.circular(20)),
      child: Stack(
        children: [
          const Positioned(
              left: 20,
              top: 27,
              child: Text("Credit",
                  style: TextStyle(
                      color: AppColors.white,
                      fontFamily: "Mulish",
                      fontSize: 18,
                      fontWeight: FontWeight.w700))),
          Positioned(
              left: 20,
              top: 50,
              child: Text("₦ 5,600.73",
                  style: AppTextStyles.bigHeader(context,
                      color: AppColors.white))),
          Positioned(
            left: 20,
            top: 141,
            child: MaterialButton(
                elevation: 10,
                minWidth: 115,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  //side: const BorderSide(color: AppColors.orange)
                ),
                onPressed: () {},
                child: const Text(
                  "Fund",
                  style: TextStyle(color: AppColors.blue),
                ),
                color: AppColors.white),
          )
        ],
      ),
    );
  }
}

class MenuBox extends StatelessWidget {
  const MenuBox(
      {Key? key,
      this.firstColor,
      this.secondColor,
      this.begin,
      this.end,
      this.image,
      this.borderColor,
      this.title,
      this.onPress})
      : super(key: key);
  final VoidCallback? onPress;
  final Color? firstColor;
  final Color? secondColor;
  final Color? borderColor;
  final Alignment? begin;
  final Alignment? end;
  final String? image;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 26, horizontal: 46),
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: begin ?? Alignment.bottomRight,
              end: end ?? Alignment.topCenter, //,
              colors: [
                firstColor ?? const Color(0xFFFFD93B),
                secondColor ?? const Color(0xFFFF7816),
              ],
              // stops: [
              //   100,
              //   50,

              //   //   // 107.69,
              // ],
            ),
            // color: Color(0xFF24B8C9),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              width: 4,
              color: borderColor ?? const Color(0xFF24B8C9),
            )),
        height: 112,
        width: 338,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Image.asset("$image"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "$title",
                style: AppTextStyles.heading1(context, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 26,
      ),
      decoration: BoxDecoration(
          color: const Color(0xFF2773FB).withOpacity(0.1),
          borderRadius: BorderRadius.circular(100)),
      // width: 500,
      child: Row(children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
          child: NavIcon(icon: Icons.send),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
          child: NavIcon(icon: Icons.home),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 10),
          child: NavIcon(icon: Icons.person),
        ),
      ]),
    );
  }
}

class NavIcon extends StatelessWidget {
  const NavIcon({Key? key, required this.icon}) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.blue, borderRadius: BorderRadius.circular(50)),
        child: Icon(
          icon,
          color: AppColors.white,
        ));
  }
}

class NavigationDrawer extends ConsumerWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: Material(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildMenuItems(context),
          ],
        )),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Column();
  Widget buildMenuItems(BuildContext context) => Column();
}
