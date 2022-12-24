import 'package:bloc_example/sentry/bug_report_overlay.dart';
import 'package:bloc_example/sentry/sentry_reporter.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> main() async {
  await SentryReporter.setup(MyApp());
}

class MyApp extends StatelessWidget with ChangeNotifier {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BugReportOverlay(key: key);
  }
}

// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   sendWhatsAppMessage () {
//     final Uri phoneNumber = Uri.parse('tel:+201010506412');
//     final Uri whatsPhone = Uri.parse('https://wa.me/01010504612');
//
//
//   }
//
//   _launchWhatsapp() async {
//     var whatsapp = "+201010504612";
//     var whatsappAndroid =Uri.parse("whatsapp://send?phone=$whatsapp");
//     // var whatsappAndroid =Uri.parse("whatsapp://send?phone=$whatsapp&text=hello");
//     var iosUrl = "https://wa.me/$whatsapp?text=${Uri.parse('Hi, I need some help')}";
//     // var iosUrl = "https://wa.me/$whatsapp?text=${Uri.parse('Hi, I need some help')}";
//
//
//     if (await canLaunchUrl(whatsappAndroid)) {
//       await launchUrl(whatsappAndroid);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("WhatsApp is not installed on the device"),
//         ),
//       );
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final Uri whatsPhone = Uri.parse('https://wa.me/+201010504612');
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async{
//           _launchWhatsapp();
//          // launchUrl(whatsPhone);
//         },
//         // _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
