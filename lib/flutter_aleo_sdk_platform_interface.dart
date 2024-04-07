import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_aleo_sdk_method_channel.dart';

abstract class FlutterAleoSdkPlatform extends PlatformInterface {
  /// Constructs a FlutterAleoSdkPlatform.
  FlutterAleoSdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAleoSdkPlatform _instance = MethodChannelFlutterAleoSdk();

  /// The default instance of [FlutterAleoSdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAleoSdk].
  static FlutterAleoSdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAleoSdkPlatform] when
  /// they register themselves.
  static set instance(FlutterAleoSdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
