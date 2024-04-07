import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_aleo_sdk/flutter_aleo_sdk.dart';
import 'package:flutter_aleo_sdk/flutter_aleo_sdk_platform_interface.dart';
import 'package:flutter_aleo_sdk/flutter_aleo_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAleoSdkPlatform
    with MockPlatformInterfaceMixin
    implements FlutterAleoSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterAleoSdkPlatform initialPlatform = FlutterAleoSdkPlatform.instance;

  test('$MethodChannelFlutterAleoSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterAleoSdk>());
  });

  test('getPlatformVersion', () async {
    FlutterAleoSdk flutterAleoSdkPlugin = FlutterAleoSdk();
    MockFlutterAleoSdkPlatform fakePlatform = MockFlutterAleoSdkPlatform();
    FlutterAleoSdkPlatform.instance = fakePlatform;

    expect(await flutterAleoSdkPlugin.getPlatformVersion(), '42');
  });
}
