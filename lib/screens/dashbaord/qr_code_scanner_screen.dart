import 'package:amritmilk/screens/dashbaord/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QrCodeScanScreen extends StatefulWidget {
  const QrCodeScanScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeScanScreen> createState() => _QrCodeScanScreenState();
}

class _QrCodeScanScreenState extends State<QrCodeScanScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(builder: (cont)
    {
      return Scaffold(
        body: Center(
          child:Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
                height: MediaQuery.of(context).size.height/2.7,
                width: MediaQuery.of(context).size.width/1.4,
                child: cont.buildQr(context)
            ),
          )
        ),
      );
    });
  }
}
