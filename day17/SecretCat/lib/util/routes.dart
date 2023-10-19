import 'package:assignment2/view/pages/Login_page.dart';
import 'package:assignment2/view/pages/author_page.dart';
import 'package:assignment2/view/pages/main_page.dart';
import 'package:assignment2/view/pages/secret_page.dart';
import 'package:assignment2/view/pages/upload_page.dart';
import '../view/pages/signup_page.dart';

class AppRoutes {
  static const main = MainPage.route;
  static const login = LoginPage.route;
  static const signup = SignUpPage.route;
  static const author = AuthorPage.route;
  static const secret = SecretPage.route;
  static const upload = UploadPage.route;
}
