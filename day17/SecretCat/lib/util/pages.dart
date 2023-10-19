import 'package:assignment2/util/routes.dart';
import 'package:assignment2/view/pages/Login_page.dart';
import 'package:assignment2/view/pages/author_page.dart';
import 'package:assignment2/view/pages/main_page.dart';
import 'package:assignment2/view/pages/secret_page.dart';
import 'package:assignment2/view/pages/signup_page.dart';
import 'package:assignment2/view/pages/upload_page.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.main, page: () => MainPage()),
    GetPage(name: AppRoutes.login, page: () => LoginPage()),
    GetPage(name: AppRoutes.signup, page: () => SignUpPage()),
    GetPage(name: AppRoutes.author, page: () => AuthorPage()),
    GetPage(name: AppRoutes.secret, page: () => SecretPage()),
    GetPage(name: AppRoutes.upload, page: () => UploadPage()),
  ];
}
