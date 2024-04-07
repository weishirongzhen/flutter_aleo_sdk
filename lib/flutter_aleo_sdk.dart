export 'rust/api/aleo_api.dart';

import 'flutter_aleo_sdk_platform_interface.dart';
import 'rust/frb_generated.dart';

class FlutterAleoSdk {
  Future<String?> getPlatformVersion() {
    return FlutterAleoSdkPlatform.instance.getPlatformVersion();
  }

  static Future<void> initALeoLib() async {
    return await RustLib.init();
  }
}
