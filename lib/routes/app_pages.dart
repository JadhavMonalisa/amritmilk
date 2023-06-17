import 'package:amritmilk/screens/common/splash_screen.dart';
import 'package:amritmilk/screens/dashbaord/dashboard_binding.dart';
import 'package:amritmilk/screens/dashbaord/dashboard_screen.dart';
import 'package:amritmilk/screens/dashbaord/qr_code_scanner_screen.dart';
import 'package:amritmilk/screens/login/login_binding.dart';
import 'package:amritmilk/screens/login/login_screen.dart';
import 'package:amritmilk/screens/registration/registration_binding.dart';
import 'package:amritmilk/screens/registration/registration_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.defaultRoute;

  static final all = [
    ///splash
    GetPage(
      name: AppRoutes.defaultRoute,
      page: () => const SplashScreen(),
    ),

    ///user basics
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    ///registration
    GetPage(
      name: AppRoutes.registrationScreen,
      page: () => const RegistrationScreen(),
      binding: RegiBinding(),
    ),
    ///dashboard
    GetPage(
      name: AppRoutes.dashboardScreen,
      page: () => const DashboardScreen(),
      binding: DashboardBinding(),
    ),
    ///qr code
    GetPage(
      name: AppRoutes.qrCodeScanScreen,
      page: () => const QrCodeScanScreen(),
      binding: DashboardBinding(),
    ),
  ];
}
