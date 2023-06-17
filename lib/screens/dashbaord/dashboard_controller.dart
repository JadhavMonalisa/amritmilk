import 'dart:developer';

import 'package:amritmilk/constant/provider/custom_exception.dart';
import 'package:amritmilk/constant/repository/api_repository.dart';
import 'package:amritmilk/screens/dashbaord/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class DashboardController extends GetxController {
  final ApiRepository repository;

  // ignore: unnecessary_null_comparison
  DashboardController({required this.repository}) : assert(repository != null);

  List<CustomerList> customerDataList = [];
  bool customerListLoader = true;
  String userId = "";
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;
  String scanBarcode = '';

  @override
  void onInit() {
    super.onInit();
    userId = GetStorage().read("userId");
    callCustomerList();
  }

  void callCustomerList() async {
    customerDataList.clear();

    try {

      print("customer list api");
      CustomerListModel? response = (await repository.getCustomerList());

      if (response.success!) {
        if (response.customerList!.isEmpty) {
          customerListLoader = false;
        }
        else{
          customerDataList.addAll(response.customerList!);
          customerListLoader = false;
        }

        print("customerDataList.length");
        print(customerDataList.length);
        update();
      } else {
        customerListLoader = false;
        update();
      }
    } on CustomException {
      customerListLoader = false;
      update();
    } catch (error) {
      customerListLoader = false;
      update();
    }
  }

  buildQr(BuildContext context){
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => onPermissionSet(context, ctrl, p),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if(scanData.code == "" || scanData.code == null){

      }
      else{
        controller.pauseCamera();
        controller.stopCamera();
        result = scanData;
        scanBarcode = result!.code!;
        print("result!.code");
        print(result!.code);
      }

      update();
    });
  }

  void onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
}