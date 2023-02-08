import 'package:flutter/material.dart';
import '../core/app_textstyle.dart';
import '../core/colors.dart';

class SuccessButtomSheet extends StatelessWidget {
  const SuccessButtomSheet({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 428,
        width: 428,
        child: Column(
          children: [
            Container(
              margin:
                  EdgeInsets.only(top: 47, bottom: 24, left: 124, right: 124),
              child: Image.asset(
                "assets/images/paybills/success.png",
                height: 180,
                width: 180,
              ),
            ),
            Container(
              child: Text(
                "Success!",
                style: AppTextStyles.subtitle(context, color: Colors.green),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 83, vertical: 20),
              //padding: const EdgeInsets.only(top: 8.0),
              child: MaterialButton(
                onPressed: () {},
                color: const Color(0xFF2773FB),
                elevation: 10,
                minWidth: 261,
                height: 60,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Go Back",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ),
          ],
        ));
  }
}
