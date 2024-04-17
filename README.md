## flutter_aleo_sdk

A sdk for aleo, built with flutter_rust_bridge and aleo-rust

## usage


```dart
import 'package:flutter_aleo_sdk/flutter_aleo_sdk.dart' as aleo;

```

```dart

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await aleo.FlutterAleoSdk.initAleo();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final testMnemonic =
      "lesson maid remove boring swift floor produce crouch kangaroo action kick pole";
  String privateKey0 = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Aleo SDK'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "from mnemonic",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                testMnemonic,
                style: const TextStyle(fontSize: 20),
              ),
              const Divider(),
              commonFutureValue('[PrivateKey-0]',
                  aleo.privateKeyFromSeed(seed: seedFromDerivePath(0))),
              commonFutureValue(
                  '[ViewKey-0]', aleo.toViewKey(privateKey: privateKey0)),
              commonFutureValue(
                  '[Address-0]', aleo.toAddress(privateKey: privateKey0)),
              const Divider(),
              const Text(
                "transfer public",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),




            ],
          ),
        ),
      ),
    );
  }

  Uint8List seedFromDerivePath(int index) {
    /// aleo hd account derive path m/44'/0'/<account_index>'/0' and default account_index = 0

    final path = "m/44'/0'/$index'/0'";
    final m = Mnemonic.fromSentence(testMnemonic, Language.english);
    final seedHex = hex.encode(m.seed);
    final keys = aleo.derivePath(path, seedHex);
    return keys.key!;
  }

  Widget commonFutureValue(String title, Future<String> future) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$title : "),
        Expanded(
          child: FutureBuilder<String>(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  privateKey0 = snapshot.data!;
                  return Text(snapshot.data!.toString());
                }
                return const Text("no value");
              }),
        ),
      ],
    );
  }
}

```

