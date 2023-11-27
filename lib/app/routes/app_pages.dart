import 'package:get/get.dart';
// import 'package:modul2/app/modules/home/views/Authentication_view.dart';
import 'package:modul2/app/modules/home/views/intro_page.dart';
import 'package:modul2/app/modules/home/views/list_product.dart';
import 'package:modul2/app/modules/home/views/login_page.dart';
import 'package:modul2/app/modules/home/views/profile_view.dart';
import 'package:modul2/app/modules/home/views/register_page.dart';
import 'package:modul2/app/modules/home/views/web_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const HomeRoute = Routes.HOME;
  static const IntroRoute = Routes.INTRO;
  static const ProfileRoute = Routes.PROFILE;
  static const ListRoute = Routes.LIST;
  static const RegistRoute = Routes.REGIST;
  static const LoginRoute = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRO,
      page: () => IntroPage(),
    ),
    GetPage(
      name: _Paths.LIST,
      page: () => ListProduct(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
    ),
    GetPage(
      name: _Paths.REGIST,
      page: () => RegisterPage(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
    ),
  ];
}
