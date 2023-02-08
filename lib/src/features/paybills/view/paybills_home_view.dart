import 'package:flutter/material.dart';
import 'package:simless/src/core/app_textstyle.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:simless/src/core/colors.dart';

import '../../../widgets/sucess_sheet.dart';

class PayBillsView extends StatefulWidget {
  PayBillsView({Key? key}) : super(key: key);

  @override
  State<PayBillsView> createState() => _PayBillsViewState();
}

class _PayBillsViewState extends State<PayBillsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Container(
        height: height,
        child: Column(
          children: [
            Container(),
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 26),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 26, vertical: 10),
                        child: const Icon(Icons.menu),
                      ),
                      Container(
                          margin: const EdgeInsets.only(left: 26, bottom: 20),
                          child: Text("Pay Bills",
                              style: AppTextStyles.gradient(
                                color1: const Color(0xFFF0940B),
                                color2: const Color(0xFFFD0DAB),
                              ))),
                      Row(
                        children: [
                          BillBox(
                            width: 168,
                            height: 146,
                            onTap: () => showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))),
                                context: context,
                                builder: (context) => const CableSheet()),
                            billName: "Cable",
                            imageName: "cable",
                          ),
                          BillBox(
                            width: 168,
                            height: 146,
                            onTap: () => showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))),
                                context: context,
                                builder: (context) => ElectricitySheet()),
                            billName: "Electricity",
                            imageName: "electricity",
                          ),
                          // BS()
                        ],
                      ),
                      const More(),
                    ]),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class BillBox extends StatelessWidget {
  const BillBox(
      {Key? key,
      required this.imageName,
      this.billName,
      this.onTap,
      required this.height,
      required this.width})
      : super(key: key);

  final String? billName;
  final String imageName;
  final VoidCallback? onTap;
  final double height;
  final double width;
  static bool istext = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(left: 15),
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: const Color(0xFFDDF1FD),
              border: Border.all(width: 4, color: const Color(0XFF2773FB)),
              borderRadius: const BorderRadius.all(Radius.circular(16.2727))),
          child: Column(
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Image.asset(
                    "assets/images/paybills/$imageName.png",
                    height: 30,
                  )),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Text(
                  billName ?? "",
                  style: const TextStyle(
                      color: Color(0xFF2773FB),
                      fontSize: 24,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          )),
    );
  }
}

class More extends StatelessWidget {
  const More({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370,
      height: 146,
      margin: const EdgeInsets.only(
        top: 52,
      ),
      decoration: BoxDecoration(
          color: const Color(0xFF676767).withOpacity(0.1),
          borderRadius: const BorderRadius.all(Radius.circular(16.2727))),
      child: const Center(
        child: Text("More coming soon...",
            style: TextStyle(
                color: Color(0xFF2773FB),
                fontSize: 24,
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}

class CableSheet extends StatefulWidget {
  const CableSheet({Key? key}) : super(key: key);

  @override
  State<CableSheet> createState() => _CableSheetState();
}

class _CableSheetState extends State<CableSheet> {
  List<Map> items = [];
  //List<String> itemList = ["Airtime", "Data"];
  List<String> itemList = ["Airtime", "Data"];
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < itemList.length; i++) {
      items.add({
        'label': '${itemList[i]}',
        'value': '${itemList[i]}',
        'icon': Container(height: 20, width: 55, child: Text("${itemList[i]}")),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 26),
      height: 247,
      width: 428,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 8),
            child: Text("Cable",
                style: AppTextStyles.gradient(
                  color1: Color(0xFFFD0DAB),
                  color2: Color(0xFFF0940B),
                )),
          ),
          Row(children: [
            GestureDetector(
              onTap: () => showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  context: context,
                  builder: (context) => CableBox()),
              child: const BillBox(
                width: 100.33,
                height: 100.33,
                //   billName: "Electricity",
                imageName: "dstv",
              ),
            ),
            const BillBox(
              width: 100.33,
              height: 100.33,
              //   billName: "Electricity",
              imageName: "showmax",
            ),
            const BillBox(
              width: 100.33,
              height: 100.33,
              //   billName: "Electricity",
              imageName: "startimes",
            ),
          ]),
        ],
      ),
    );
  }
}

class CableBox extends StatefulWidget {
  CableBox({Key? key}) : super(key: key);

  @override
  State<CableBox> createState() => _CableBoxState();
}

class _CableBoxState extends State<CableBox> {
  List<Map> items = [];
  //List<String> itemList = ["Airtime", "Data"];
  List<String> itemList = ["Airtime", "Data"];
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < itemList.length; i++) {
      items.add({
        'label': '${itemList[i]}',
        'value': '${itemList[i]}',
        'icon': Container(height: 20, width: 55, child: Text("${itemList[i]}")),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 457,
      width: 343,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 45, vertical: 20),
            child: Text(
              "Cable",
              style: AppTextStyles.gradient(
                color1: Color(0xFFFD0DAB),
                color2: Color(0xFFF0940B),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 43, top: 20),
            height: 57,
            width: 343,
            child: TextField(
              decoration: InputDecoration(
                  focusColor: Colors.green,
                  // constraints: BoxConstraints(minHeight: 15),
                  filled: true,
                  fillColor: Color(0xFFDDF1FD),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)),
              keyboardType: TextInputType.number,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 43, top: 20),
            child: CoolDropdown(
              defaultValue: items[0],
              dropdownList: items,
              dropdownItemPadding: EdgeInsets.zero,
              onChange: (dropdownItem) {},
              resultHeight: 57,
              resultWidth: 343,
              dropdownWidth: 150,
              dropdownHeight: 100,
              dropdownItemHeight: 30,
              dropdownItemGap: 10,
              resultIcon: Container(
                width: 343,
                height: 45,
                color: Color(0xFFDDF1FD),
                margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      itemList[0].toString(),
                      style: const TextStyle(
                          fontSize: 10,
                          // height: 10,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 260.0),
                      child: const Icon(
                        Icons.arrow_drop_down,
                        size: 10,
                      ),
                    ),
                  ],
                ),
              ),
              resultIconLeftGap: 0,
              resultPadding: EdgeInsets.zero,
              resultIconRotation: true,
              resultIconRotationValue: 0,
              isDropdownLabel: false,
              isResultLabel: true,
              isResultIconLabel: false,
              dropdownPadding: EdgeInsets.zero,
              resultAlign: Alignment.topLeft,
              resultMainAxis: MainAxisAlignment.start,
              dropdownItemMainAxis: MainAxisAlignment.center,
              resultBD: const BoxDecoration(color: Color(0xFFDDF1FD)),
              selectedItemBD: BoxDecoration(
                  color: Color(0xFFDDF1FD),
                  border: Border(
                      left: BorderSide(
                          color: Colors.black.withOpacity(0.7), width: 3))),
              triangleWidth: 10,
              triangleHeight: 10,
              triangleAlign: 'center',
              dropdownAlign: 'center',
              gap: 20,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 43, top: 20),
            child: CoolDropdown(
              defaultValue: items[0],
              dropdownList: items,
              dropdownItemPadding: EdgeInsets.zero,
              onChange: (dropdownItem) {},
              resultHeight: 57,
              resultWidth: 343,
              dropdownWidth: 150,
              dropdownHeight: 100,
              dropdownItemHeight: 30,
              dropdownItemGap: 10,
              resultIcon: Container(
                width: 343,
                height: 45,
                color: const Color(0xFFDDF1FD),
                margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      itemList[0].toString(),
                      style: const TextStyle(
                          fontSize: 10,
                          // height: 10,
                          fontWeight: FontWeight.w500),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 260.0),
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: 10,
                      ),
                    ),
                  ],
                ),
              ),
              resultIconLeftGap: 0,
              resultPadding: EdgeInsets.zero,
              resultIconRotation: true,
              resultIconRotationValue: 0,
              isDropdownLabel: false,
              isResultLabel: true,
              isResultIconLabel: false,
              dropdownPadding: EdgeInsets.zero,
              resultAlign: Alignment.topLeft,
              resultMainAxis: MainAxisAlignment.start,
              dropdownItemMainAxis: MainAxisAlignment.center,
              resultBD: const BoxDecoration(color: Color(0xFFDDF1FD)),
              selectedItemBD: BoxDecoration(
                  color: const Color(0xFFDDF1FD),
                  border: Border(
                      left: BorderSide(
                          color: Colors.black.withOpacity(0.7), width: 3))),
              triangleWidth: 10,
              triangleHeight: 10,
              triangleAlign: 'center',
              dropdownAlign: 'center',
              gap: 20,
            ),
          ),
          Container(
            /// color: Colors.red,
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
              child: GestureDetector(
                onTap: () => showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    context: context,
                    builder: (context) => const SuccessButtomSheet()),
                child: const Text(
                  "Proceed",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ElectricitySheet extends StatefulWidget {
  const ElectricitySheet({Key? key}) : super(key: key);

  @override
  _ElectricitySheetState createState() => _ElectricitySheetState();
}

class _ElectricitySheetState extends State<ElectricitySheet> {
  List<Map> items = [];
  //List<String> itemList = ["Airtime", "Data"];
  List<String> itemList = ["Airtime", "Data"];
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < itemList.length; i++) {
      items.add({
        'label': '${itemList[i]}',
        'value': '${itemList[i]}',
        'icon': Container(height: 20, width: 55, child: Text("${itemList[i]}")),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 457,
      width: 343,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
            child: Text(
              "Electricity",
              style: AppTextStyles.gradient(
                color1: const Color(0xFFFD0DAB),
                color2: const Color(0xFFF0940B),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 43, top: 20),
            child: CoolDropdown(
              defaultValue: items[0],
              dropdownList: items,
              dropdownItemPadding: EdgeInsets.zero,
              onChange: (dropdownItem) {},
              resultHeight: 57,
              resultWidth: 343,
              dropdownWidth: 150,
              dropdownHeight: 100,
              dropdownItemHeight: 30,
              dropdownItemGap: 10,
              resultIcon: Container(
                width: 343,
                height: 45,
                color: const Color(0xFFDDF1FD),
                margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      itemList[0].toString(),
                      style: const TextStyle(
                          fontSize: 10,
                          // height: 10,
                          fontWeight: FontWeight.w500),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 260.0),
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: 10,
                      ),
                    ),
                  ],
                ),
              ),
              resultIconLeftGap: 0,
              resultPadding: EdgeInsets.zero,
              resultIconRotation: true,
              resultIconRotationValue: 0,
              isDropdownLabel: false,
              isResultLabel: true,
              isResultIconLabel: false,
              dropdownPadding: EdgeInsets.zero,
              resultAlign: Alignment.topLeft,
              resultMainAxis: MainAxisAlignment.start,
              dropdownItemMainAxis: MainAxisAlignment.center,
              resultBD: const BoxDecoration(color: Color(0xFFDDF1FD)),
              selectedItemBD: BoxDecoration(
                  color: const Color(0xFFDDF1FD),
                  border: Border(
                      left: BorderSide(
                          color: Colors.black.withOpacity(0.7), width: 3))),
              triangleWidth: 10,
              triangleHeight: 10,
              triangleAlign: 'center',
              dropdownAlign: 'center',
              gap: 20,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 43, top: 20),
            child: CoolDropdown(
              defaultValue: items[0],
              dropdownList: items,
              dropdownItemPadding: EdgeInsets.zero,
              onChange: (dropdownItem) {},
              resultHeight: 57,
              resultWidth: 343,
              dropdownWidth: 150,
              dropdownHeight: 100,
              dropdownItemHeight: 30,
              dropdownItemGap: 10,
              resultIcon: Container(
                width: 343,
                height: 45,
                color: const Color(0xFFDDF1FD),
                margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.all(15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      itemList[0].toString(),
                      style: const TextStyle(
                          fontSize: 10,
                          // height: 10,
                          fontWeight: FontWeight.w500),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 260.0),
                      child: Icon(
                        Icons.arrow_drop_down,
                        size: 10,
                      ),
                    ),
                  ],
                ),
              ),
              resultIconLeftGap: 0,
              resultPadding: EdgeInsets.zero,
              resultIconRotation: true,
              resultIconRotationValue: 0,
              isDropdownLabel: false,
              isResultLabel: true,
              isResultIconLabel: false,
              dropdownPadding: EdgeInsets.zero,
              resultAlign: Alignment.topLeft,
              resultMainAxis: MainAxisAlignment.start,
              dropdownItemMainAxis: MainAxisAlignment.center,
              resultBD: const BoxDecoration(color: Color(0xFFDDF1FD)),
              selectedItemBD: BoxDecoration(
                  color: const Color(0xFFDDF1FD),
                  border: Border(
                      left: BorderSide(
                          color: Colors.black.withOpacity(0.7), width: 3))),
              triangleWidth: 10,
              triangleHeight: 10,
              triangleAlign: 'center',
              dropdownAlign: 'center',
              gap: 20,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 83, vertical: 60),
            //padding: const EdgeInsets.only(top: 8.0),
            child: MaterialButton(
              onPressed: () => showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  context: context,
                  builder: (context) => const SuccessButtomSheet()),
              color: const Color(0xFF2773FB),
              elevation: 10,
              minWidth: 261,
              height: 60,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () => showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    context: context,
                    builder: (context) => const SuccessButtomSheet()),
                child: const Text(
                  "Proceed",
                  style: TextStyle(color: AppColors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container electricityForm() {
    return Container(
      height: 457,
      width: 343,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
            child: Text(
              "Electricity",
              style: AppTextStyles.gradient(
                color1: const Color(0xFFFD0DAB),
                color2: const Color(0xFFF0940B),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 43, top: 20),
            height: 57,
            width: 343,
            child: TextField(
              decoration: InputDecoration(
                  focusColor: Colors.green,
                  // constraints: BoxConstraints(minHeight: 15),
                  hintText: "Meter Number",
                  filled: true,
                  fillColor: const Color(0xFFDDF1FD),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)),
              keyboardType: TextInputType.number,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 43, top: 20),
            height: 57,
            width: 343,
            child: TextField(
              decoration: InputDecoration(
                  focusColor: Colors.green,
                  // constraints: BoxConstraints(minHeight: 15),
                  hintText: "Phone Number",
                  filled: true,
                  fillColor: const Color(0xFFDDF1FD),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)),
              keyboardType: TextInputType.number,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 43, top: 20),
            height: 57,
            width: 343,
            child: TextField(
              decoration: InputDecoration(
                  focusColor: Colors.green,
                  hintText: "Amount in Naira",
                  // constraints: BoxConstraints(minHeight: 15),
                  filled: true,
                  fillColor: const Color(0xFFDDF1FD),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)),
              keyboardType: TextInputType.number,
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
                "Proceed",
                style: TextStyle(color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
