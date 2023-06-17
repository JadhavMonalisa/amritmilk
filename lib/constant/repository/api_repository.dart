
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:amritmilk/screens/dashbaord/dashboard_model.dart';
import 'package:amritmilk/screens/login/login_model.dart';
import 'package:dio/dio.dart';
import '../api_endpoint.dart';
import '../provider/api.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  final ApiClient apiClient;

  ApiRepository({required this.apiClient});
  Map<String, String> headers = { "Content-Type":"application/json", "X-API-KEY":"amritmayamilk050512"};
  Map<String, String> multipartHeaders = { "Content-Type": "multipart/form-data"};

  String firmId = "";
  String userId = "";

  getData(){

  }
  ///login api
  Future<LoginModel> doLogin({String? email,String? password,String? token}) async {
    final FormData formData = FormData.fromMap({
    "email":email,"password":password,"token":token
    },);
    final response = await apiClient.post(
      ApiEndpoint.loginUrl, body: formData, headers: headers
    );
    return LoginModel.fromJson(response);
  }
  ///customer list
  Future<CustomerListModel> getCustomerList() async {
    final response = await apiClient.get(
      ApiEndpoint.customerListUrl, headers: headers
    );
    return CustomerListModel.fromJson(response);
  }
}
