import 'package:amritmilk/constant/repository/api_repository.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RegiController extends GetxController {
  final ApiRepository repository;

  // ignore: unnecessary_null_comparison
  RegiController({required this.repository}) : assert(repository != null);
}