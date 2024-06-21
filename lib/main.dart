import '/view/auth/login.dart';
import '/view/onboard/onboard_2.dart';
import '/view/register/register.dart';
import '/view/onboard/onboard.dart';
import 'view/main.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  prefs = await SharedPreferences.getInstance();
  prefs?.setString('token', '');
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
              child: child!
          );
        },
        initialRoute: (prefs?.getString('token') ?? '') != '' ? '/' : '/onboard',
        getPages: [
          GetPage(name: '/', page: () => const MainView()),
          GetPage(name: '/onboard', page: () => const OnboardView()),
          GetPage(name: '/onboard_2', page: () => const Onboard2View()),
          GetPage(name: '/login', page: () => const LoginView()),
          GetPage(name: '/register', page: () => const RegisterView())
        ],
        onUnknownRoute: (settings) => CupertinoPageRoute(
            builder: (context) {
              return const MainView();
            }
        ),
        theme: theme,
        debugShowCheckedModeBanner: false,
        title: appName
    );
  }
}