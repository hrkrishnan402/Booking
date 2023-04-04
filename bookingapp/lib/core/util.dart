import 'package:bookingapp/core/platform/package_info_service.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';
import 'config/app_config.dart';

class Util {
  final logger = Logger();
  final PackageInfoService _packageInfoService = GetIt.I.get<PackageInfoService>();
  // Util Methods

  /// Open Play Store if the new App
  /// Update is Available
  Future<bool> openUpdateApp() async {
    logger.i("Update App");
    bool value = await canLaunchUrl(Uri.parse(AppConfig.PLAY_STORE_URL));
    if (value) {
      return launchUrl(Uri.parse(AppConfig.PLAY_STORE_URL));
    } else {
      throw 'Could not launch ${AppConfig.PLAY_STORE_URL}';
    }
  }

  /// Opens the EmailClient
  Future<bool> openEmail(String email, {bool isUri = false}) async {
    logger.i("Opening email $email");
    if (isUri) {
      logger.i("Opening Via URL Scheme");
      if (await canLaunchUrl(Uri.parse(email))) {
        return await launchUrl(Uri.parse(email));
      } else {
        throw 'Could not launch $email';
      }
    } else {
      if (await canLaunchUrl(Uri.parse("mailto:$email"))) {
        return await launchUrl(Uri.parse("mailto:$email"));
      } else {
        throw 'Could not launch $email';
      }
    }
  }

  /// Opens the Dialer with the specified number
  Future<bool> openPhone(String number) async {
    logger.i("Making a Call $number");
    if (await canLaunchUrl(Uri.parse('tel:$number'))) {
      return await launchUrl(Uri.parse('tel:$number'));
    } else {
      throw 'Could not launch $number';
    }
  }

  /// Opens the Browser with the specified url
  Future<bool> openBrowser(String url, {bool isWebView = false}) async {
    logger.i("Opening browser $url");
    if (await canLaunchUrl(Uri.parse(url))) {
      if (isWebView) {
        return await launchUrl(
          Uri.parse(url),
          webViewConfiguration: const WebViewConfiguration(
              enableJavaScript: true,
              enableDomStorage: true),
        );
      } else {
        return await launchUrl(Uri.parse(url));
      }
    } else {
      throw 'Could not launch $url';
    }
  }

  /// Gets the app version
  Future<String> appVersion() async {
    return await _packageInfoService.getVersion();
  }

  /// Gets the appId
  String appId() {
    return AppConfig.appID;
  }

  /// Gets the company details
  String compantDetails() {
    return AppConfig.companyDetails;
  }
}
