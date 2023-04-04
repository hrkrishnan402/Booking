import 'package:bookingapp/api/services/interface/iquery_resource_service.dart';
import 'package:bookingapp/api/services/v1/query_resource_service.dart';
import 'package:bookingapp/core/api_bridge.dart';
import 'package:bookingapp/core/platform/local_storage_service.dart';
import 'package:bookingapp/core/platform/package_info_service.dart';
import 'package:bookingapp/core/util.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

/// Dependency Injection
///
/// This Function Registeres All The dependencies required by the app
/// This should be called before initializing the app [runApp()]
///
/// Example
/// -------
/// Use the Registered Dependencies in any file
/// ExampleService exampleService = GetIt.I.get<ExampleService>();
///
Future<void> setupDependencies() async {

  getIt.registerSingleton<LocalStorageService>(LocalStorageService());
  getIt.registerSingleton<PackageInfoService>(PackageInfoService());
  getIt.registerSingleton<Util>(Util());
  // getIt.registerSingleton<NetworkConnectionService>(networkConnectionService);
  getIt.registerSingleton<IQueryResourceService>(QueryResourceService());
  getIt.registerSingleton<ApiBridge>(ApiBridge());
}
