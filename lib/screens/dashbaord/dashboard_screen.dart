import 'package:amritmilk/common_widget/widget.dart';
import 'package:amritmilk/routes/app_pages.dart';
import 'package:amritmilk/screens/dashbaord/dashboard_controller.dart';
import 'package:amritmilk/theme/app_colors.dart';
import 'package:amritmilk/theme/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (cont)
    {
      return Scaffold(
          appBar: AppBar(
            title: buildTextBoldWidget("Dashboard", blackColor, context, 16.0),
            actions: [
              //buildButtonWidget(context,"Scan"),
              GestureDetector(
                  onTap: () {
                      Get.toNamed(AppRoutes.qrCodeScanScreen);
                  },
                  child: const Icon(Icons.document_scanner_outlined)
              ),
              const SizedBox(width: 15.0),
              GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.logout)
              ),
              const SizedBox(width: 15.0),
            ],
          ),
          body: Container(
            child: cont.customerListLoader ? buildCircularIndicator() :
             Scrollbar(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0,top:20.0),
                  child: Table(
                    border: TableBorder.all(color: whiteColor, width: 2.0),
                    defaultColumnWidth: const IntrinsicColumnWidth(),
                    children: [
                      TableRow(
                          children: [
                            buildTableTitle(context, "Id"),
                            buildTableTitle(context, "Name"),
                            buildTableTitle(context, "Contact"),
                            buildTableTitle(context, "Email"),
                            buildTableTitle(context, "Address"),
                            buildTableTitle(context, "Barcode"),
                          ]
                      ),
                      for (var data in cont.customerDataList)
                        TableRow(
                            children: [
                              buildTableSubtitle(context, data.id!),
                              buildTableSubtitle(context, data.name!),
                              buildTableSubtitle(context, data.contact!),
                              buildTableSubtitle(context, data.email!),
                              buildTableSubtitle(context, data.address!),
                              buildTableSubtitle(context, data.barcode!),
                            ]
                        ),
                    ],
                  ),
                ),
              ),
            )
          )
      );
    });
  }
}
