import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'service_locator.config.dart';

GetIt di = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<void> configureDependencies() => $initGetIt(di);
