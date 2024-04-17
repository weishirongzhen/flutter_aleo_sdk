export 'rust/api/aleo_api.dart';
export 'aleo/aleo_hd_key.dart';
export 'aleo/transfer_util.dart';

import 'dart:developer';

import 'flutter_aleo_sdk_platform_interface.dart';
import 'rust/frb_generated.dart';

class FlutterAleoSdk {
  static bool _libInit = false;

  Future<String?> getPlatformVersion() {
    return FlutterAleoSdkPlatform.instance.getPlatformVersion();
  }

  static Future<void> initAleo() async {
    if (!_libInit) {
      try {
        await RustLib.init();
        _libInit = true;
      } catch (e) {
        _libInit = false;
        log("RustLib init failed: $e");
      }
    }
  }

  static void deposeAleo() {
    RustLib.dispose();
    _libInit = false;
    log("RustLib disposed");
  }
}
