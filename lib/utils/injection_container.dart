import 'package:get_it/get_it.dart';
import 'package:invoyse_test/providers/business_profile_providers.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  locator.registerFactory<BusinessProfileProvider>(
    () => BusinessProfileProvider(),
  );
}
