import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import '../../../core/colors.dart';
import 'package:cool_dropdown/cool_dropdown.dart';
//import 'dart:ui';
import '../../../core/app_textstyle.dart';

class Airtime extends StatefulWidget {
  Airtime({Key? key}) : super(key: key);

  @override
  State<Airtime> createState() => _AirtimeState();
}

class _AirtimeState extends State<Airtime> with SingleTickerProviderStateMixin {
  PageController? _pageController;

  int _selectedPage = 0;

  void _changePage(int pageNumber) {
    setState(() {
      _selectedPage = pageNumber;
      _pageController!.animateToPage(pageNumber,
          duration: const Duration(microseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn);
      print(pageNumber);
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        // bottomNavigationBar: BottomNavBar(),
        body: SafeArea(
      child: SingleChildScrollView(
          child: Container(
        height: height,
        // margin: const EdgeInsets.only(
        //   bottom: 50,
        // ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 26, top: 20),
                  child: Column(
                    children: [
                      Text("Buy Airtime",
                          style: AppTextStyles.gradient(
                            color1: Color(0xFF26CFAD),
                            color2: Color(0xFF2196F3),
                          ))
                    ],
                  )),
              Container(
                  //  margin: EdgeInsets.symmetric(vertical: 26),
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(26),
                    child: const Text("Choose your network"),
                  ),
                  Row(
                    children: [
                      TabButton(
                        onTap: () {
                          _changePage(0);
                        },
                        imageName: "glo",
                        pageNumber: 0,
                        backgroundColor: Color(0xFF39C251),
                        tabIndex: _selectedPage,
                      ),
                      TabButton(
                        onTap: () {
                          _changePage(1);
                        },
                        imageName: "mtn",
                        pageNumber: 1,
                        backgroundColor: Color(0xFFFFC403),
                        tabIndex: _selectedPage,
                      ),
                      TabButton(
                        onTap: () {
                          _changePage(2);
                        },
                        imageName: "airtel",
                        pageNumber: 2,
                        backgroundColor: Color(0xFFE20010),
                        tabIndex: _selectedPage,
                      ),
                      TabButton(
                        onTap: () {
                          _changePage(3);
                        },
                        imageName: "9mobile",
                        pageNumber: 3,
                        backgroundColor: Color(0xFFE1F1F1F),
                        tabIndex: _selectedPage,
                      ),
                    ],
                  ),
                ],
              )),
              Expanded(
                //flex: 2,
                child: PageView(
                    onPageChanged: (int page) {
                      setState(() {
                        _selectedPage = page;
                      });
                    },
                    controller: _pageController,
                    children: const [
                      AirtimeForm(
                        imageName: "glo",
                        backgroundColor: Color(0xFF39C251),
                      ),
                      AirtimeForm(
                        imageName: "mtn",
                        color: AppColors.black,
                        backgroundColor: Color(0xFFFFC403),
                      ),
                      AirtimeForm(
                        imageName: "airtel",
                        backgroundColor: Color(0xFFE20010),
                      ),
                      AirtimeForm(
                        color: Colors.green,
                        imageName: "9mobile",
                        backgroundColor: Color(0xFF1F1F1F),
                      ),
                    ]),
              ),
            ]),
      )),
    ));
  }
}

class TabButton extends StatelessWidget {
  final int tabIndex;
  final int pageNumber;
  final VoidCallback? onTap;
  final String imageName;
  final Color backgroundColor;
  TabButton(
      {Key? key,
      required this.pageNumber,
      required this.tabIndex,
      required this.imageName,
      required this.backgroundColor,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(left: 29),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: tabIndex == pageNumber
                            ? Color(0xFFE6E6E6)
                            : Colors.transparent,
                        width: 4),
                  ),
                  child: Image.asset("assets/images/airtime/$imageName.png")),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                padding: const EdgeInsets.all(18.0),
                child: Text(imageName.toUpperCase(),
                    style: TextStyle(
                        color: tabIndex == pageNumber
                            ? backgroundColor
                            : AppColors.black

                        //|| tabIndex == pageNumber ? backgroundColor : Colors.green

                        )),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class BuyTextfield extends StatefulWidget {
  BuyTextfield({Key? key}) : super(key: key);

  @override
  State<BuyTextfield> createState() => _BuyTextfieldState();
}

class _BuyTextfieldState extends State<BuyTextfield> {
  List<Map> items = [];
  //List<String> itemList = ["Airtime", "Data"];
  List<String> itemList = ["Airtime", "Data"];
  // String? selectedItem = "Data";
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
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(
        left: 22,
        right: 22,
        top: 10,
      ),
      height: 120,
      // width: 358,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFFE6E6E6),
      ),

      child: Column(children: [
        Container(
          //  height: 100,
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
              // border: Border.all(color: AppColors.white, width: 5),
              ),
          child: Row(
            children: [
              Container(
                child: const Text(
                  "Buy",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w700,
                    fontSize: 18.6,
                  ),
                ),
              ),
              Container(
                // width: 100,
                // decoration: BoxDecoration(
                //   border: Border.all(color: AppColors.white, width: 5),
                // ),
                // padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: width - 190),
                height: 35,
                // width: 150,
                child: CoolDropdown(
                  defaultValue: items[0],
                  dropdownList: items,
                  dropdownItemPadding: EdgeInsets.zero,
                  onChange: (dropdownItem) {},
                  resultHeight: 50,
                  resultWidth: 55,
                  dropdownWidth: 150,
                  dropdownHeight: 100,
                  dropdownItemHeight: 30,
                  dropdownItemGap: 10,
                  resultIcon: SizedBox(
                    //width: 50,
                    height: 45,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          Text(
                            itemList[0].toString(),
                            style: const TextStyle(
                                fontSize: 10,
                                // height: 10,
                                fontWeight: FontWeight.w500),
                          ),
                          const Icon(
                            Icons.arrow_drop_down,
                            size: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  resultIconLeftGap: 0,
                  resultPadding: EdgeInsets.zero,
                  resultIconRotation: true,
                  resultIconRotationValue: 1,
                  isDropdownLabel: false,
                  isResultLabel: true,
                  isResultIconLabel: false,
                  dropdownPadding: EdgeInsets.zero,
                  resultAlign: Alignment.center,
                  resultMainAxis: MainAxisAlignment.center,
                  dropdownItemMainAxis: MainAxisAlignment.center,
                  selectedItemBD: BoxDecoration(
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
              // DropdownButtonFormField<String>(
              //     // itemHeight: 20,
              //     //icon: Icon(Icons.abc),
              //     //alignment: Alignment.topLeft,
              //     isDense: false,
              //     // style: TextStyle(
              //     //     color: AppColors.black,
              //     //     fontSize: 8,
              //     //     fontWeight: FontWeight.w500),
              //     //menuMaxHeight: 200,
              //     decoration: const InputDecoration(
              //         contentPadding: EdgeInsets.all(0),
              //         // constraints: BoxConstraints(maxHeight: 100),
              //         filled: true,
              //         fillColor: Colors.green),
              //     value: selectedItem,
              //     items: items
              //         .map((item) => DropdownMenuItem(
              //             // alignment: Alignment.topLeft,
              //             child: Text(
              //               item,
              //               // style: TextStyle(
              //               //     color: AppColors.black,
              //               //     fontSize: 10,
              //               //     fontWeight: FontWeight.w500),
              //             ),
              //             value: item))
              //         .toList(),
              //     onChanged: (item) {
              //       setState(() {
              //         selectedItem = item;
              //       });
              //     }),
              // ),
            ],
          ),
        ),
        SizedBox(
          height: 42,
          child: TextField(
            decoration: InputDecoration(
                focusColor: Colors.green,
                // constraints: BoxConstraints(minHeight: 15),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none)),
            keyboardType: TextInputType.number,
          ),
        ),
      ]),
    );
  }
}

class AirtimeForm extends StatelessWidget {
  const AirtimeForm(
      {Key? key,
      required this.imageName,
      this.color,
      required this.backgroundColor})
      : super(key: key);
  final String imageName;
  final Color? color;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: 26),
        duration: Duration(milliseconds: 1000),
        curve: Curves.fastLinearToSlowEaseIn,
        height: height,
        width: 363,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(16),
              ),
              height: 177.38,
              width: 363,
              child: Stack(
                children: [
                  Positioned(
                      top: 20,
                      left: width - 120,
                      child: Image.asset(
                          height: 23,
                          width: 23,
                          // color: Colors.black,
                          "assets/images/airtime/$imageName.png")),
                  Center(
                    child: Text(
                      "$imageName".toUpperCase(),
                      style: AppTextStyles.bigHeader(
                          color: imageName == "mtn" || imageName == "9mobile"
                              ? color
                              : AppColors.white,
                          context),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: 50, child: Center(child: Text("You selected Glo"))),
            BuyTextfield(),
            Container(
                margin: EdgeInsets.only(top: 26),
                padding: EdgeInsets.only(top: 26),
                height: 124,
                width: 358,
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Column(
                  children: [
                    Text("You're buying 500 worth of airtime",
                        style: AppTextStyles.heading3(context,
                            color: imageName == "mtn"
                                ? AppColors.black
                                : AppColors.white)),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: MaterialButton(
                          // padding: EdgeInsets.only(top: 10),
                          elevation: 5,
                          minWidth: 88,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            //side: const BorderSide(color: AppColors.orange)
                          ),
                          onPressed: () {},
                          child: Text(
                            "Confirm",
                            style: TextStyle(color: AppColors.black),
                          ),
                          color: AppColors.white),
                    )

                    // Text("This will cost you 5,000 naira",
                    //     style: TextStyle(
                    //         fontSize: 10,
                    //         fontWeight: FontWeight.w700,
                    //         color: Colors.white)),
                  ],
                )))
          ],
        ));
  }
}
