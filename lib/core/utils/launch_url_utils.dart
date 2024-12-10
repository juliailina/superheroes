import 'package:url_launcher/url_launcher_string.dart';

class LaunchUrl {
  static Future<void> openUrl(
    String? url, {
    LaunchMode mode = LaunchMode.externalApplication,
  }) async {
    if (url != null) {
      if (await canLaunchUrlString(url)) {
        await launchUrlString(
          url,
          mode: mode,
        );
      }
    }
  }
}
