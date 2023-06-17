import 'package:amritmilk/constant/provider/api.dart';
import 'package:amritmilk/screens/registration/registration_controller.dart';
import 'package:get/get.dart';
import '../../constant/repository/api_repository.dart';

class RegiBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegiController(repository: ApiRepository(apiClient: ApiClient())));
  }
}
