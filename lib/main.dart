import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:invoyse_test/providers/business_profile_providers.dart';
import 'package:invoyse_test/services/page_router.dart';
import 'package:invoyse_test/utils/injection_container.dart';
import 'package:invoyse_test/views/menu/menu_view.dart';
import 'package:provider/provider.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BusinessProfileProvider(),
      child: ScreenUtilInit(
        designSize: Size(375, 667),
        builder: (context, widget) => MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: PageRouter.instance.navigatorKey,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MenuView(),
        ),
      ),
    );
  }
}
