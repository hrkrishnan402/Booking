import 'package:package_info/package_info.dart';
class PackageInfoService {
  /// Fetches the current App version
 
  Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    return '${packageInfo.version}.${packageInfo.buildNumber}';
  }
}
