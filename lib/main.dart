import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '/view/auth/login.dart';
import '/view/onboard/onboard_2.dart';
import '/view/register/register.dart';
import '/view/onboard/onboard.dart';
import 'firebase_options.dart';
import 'view/main.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

SharedPreferences? prefs;
late final FirebaseApp app;
late final FirebaseAuth auth;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  app = await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  auth = FirebaseAuth.instanceFor(app: app);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
  prefs = await SharedPreferences.getInstance();
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
        initialRoute: auth.currentUser != null ? '/' : '/onboard',
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