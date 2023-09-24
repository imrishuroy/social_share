import 'package:flutter/material.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';
import 'package:social_share/injection_container.dart';
import 'package:social_share/screens/spash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String sharedText = '';

  @override
  void initState() {
    super.initState();

    // ReceiveSharingIntent.getTextStreamAsUri().listen((event) {
    //   print('shared value 1--------- $event');
    // });

    // ReceiveSharingIntent.getInitialTextAsUri().then((Uri? value) {
    //   print('shared value --------- $value');
    //   if (value != null) {
    //     setState(() {
    //       sharedText = value.toString();
    //     });
    //   }
    // });

    // // Initialize the receive sharing intent
    // ReceiveSharingIntent.getTextStream().listen(
    //   (String value) {
    //     print('shared value 2--------- $value');
    //     setState(() {
    //       sharedText = value;
    //     });

    //     // Here, you can parse the shared URL (e.g., Instagram Reel) and take appropriate actions.
    //     // Example: Check if the shared URL is an Instagram Reel and display it in your app.
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Content'),
      ),
      body: Center(
        child: FutureBuilder<Uri?>(
          future: ReceiveSharingIntent.getInitialTextAsUri(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            return Text('Shared Text: ${snapshot.data.toString()}');
          },
        ),
      ),
    );
  }
}


// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:receive_sharing_intent/receive_sharing_intent.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   // await ReceiveSharingIntent.getInitialMedia();
//   // await ReceiveSharingIntent.getInitialText();

//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late StreamSubscription _intentDataStreamSubscription;
//   List<SharedMediaFile>? _sharedFiles;
//   String? _sharedText;

//   @override
//   void initState() {
//     super.initState();

//     // For sharing images coming from outside the app while the app is in the memory
//     // _intentDataStreamSubscription = ReceiveSharingIntent.getMediaStream()
//     //     .listen((List<SharedMediaFile> value) {
//     //   print('shared value --------- $value');
//     //   setState(() {
//     //     _sharedFiles = value;
//     //     print("Shared:${_sharedFiles?.map((f) => f.path).join(",") ?? ""}");
//     //   });
//     // }, onError: (err) {
//     //   print("getIntentDataStream error: $err");
//     // });

//     // For sharing images coming from outside the app while the app is closed
//     // ReceiveSharingIntent.getInitialMedia().then((List<SharedMediaFile> value) {
//     //   setState(() {
//     //     _sharedFiles = value;
//     //     print("Shared:${_sharedFiles?.map((f) => f.path).join(",") ?? ""}");
//     //   });
//     // });

//     // For sharing or opening urls/text coming from outside the app while the app is in the memory
//     _intentDataStreamSubscription =
//         ReceiveSharingIntent.getTextStream().listen((String value) {
//       print('shared value --------- $value');

//       setState(() {
//         _sharedText = value;
//         print("Shared: $_sharedText");
//       });
//     }, onError: (err) {
//       print("getLinkStream error: $err");
//     });

//     // For sharing or opening urls/text coming from outside the app while the app is closed
//     // ReceiveSharingIntent.getInitialText().then((String? value) {
//     //   setState(() {
//     //     _sharedText = value;
//     //     print("Shared: $_sharedText");
//     //   });
//     // });
//   }

//   @override
//   void dispose() {
//     _intentDataStreamSubscription.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     const textStyleBold = TextStyle(fontWeight: FontWeight.bold);
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//           child: Column(
//             children: <Widget>[
//               const Text("Shared files:", style: textStyleBold),
//               Text(_sharedFiles
//                       ?.map((f) =>
//                           "{Path: ${f.path}, Type: ${f.type.toString().replaceFirst("SharedMediaType.", "")}}\n")
//                       .join(",\n") ??
//                   ""),
//               const SizedBox(height: 100),
//               const Text("Shared urls/text:", style: textStyleBold),
//               Text(_sharedText ?? "")
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
