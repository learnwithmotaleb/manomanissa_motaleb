import 'package:manomanissa/views/splash/controller/splash_controller.dart';

import 'core/helpers/network_manager.dart';
import 'core/languages/localization.dart';
import 'core/utils/basic_import.dart';
import 'core/widgets/offline_widget.dart';
import 'initial.dart';
import 'views/splash/screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initial.init();
  Get.put(NetworkChecker());
  Get.put(SplashController());

  final hasInternet = await NetworkManager.hasConnection();
  bool? lastStatus = hasInternet;
  NetworkManager.connectionStream().listen((isConnected) {
    if (lastStatus != null && lastStatus != isConnected) {
      if (!isConnected) {
        Get.to(() => const OfflineWidget());
      } else {
        if (Get.key.currentState?.canPop() ?? false) {
          Get.back();
        } else {
          Get.offAllNamed(Routes.splashScreen);
        }
      }
    }
    lastStatus = isConnected;
  });

  runApp(MyApp(hasInternet: hasInternet));
}

class MyApp extends StatelessWidget {
  final bool hasInternet;

  const MyApp({super.key, required this.hasInternet});

  @override
  Widget build(BuildContext context) {
    String savedLang = AppStorage.languageCode;
    final themes = Themes();
    return ScreenUtilInit(
      designSize: const Size(411, 915),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => GetMaterialApp(
        translations: Languages(),
        locale: Locale(savedLang, savedLang == 'en' ? 'US' : 'FR'),
        fallbackLocale: const Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        home: hasInternet ? const SplashScreen() : const OfflineWidget(),
        title: Strings.appName,
        theme: Themes.light,
        darkTheme: Themes.dark,
        getPages: Routes.list,
        defaultTransition: Transition.cupertino,
        transitionDuration: const Duration(milliseconds: 300),
        themeMode: themes.currentTheme,
        // themeMode: ThemeMode.light,

        // ✅ FIXED BUILDER
        builder: (context, widget) {
          return Overlay(
            initialEntries: [
              OverlayEntry(
                builder: (ctx) {
                  return Directionality(
                    textDirection: Get.locale?.languageCode == 'ar'
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(Assets.dummy.bg.path, fit: BoxFit.cover),
                        widget!,
                      ],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
