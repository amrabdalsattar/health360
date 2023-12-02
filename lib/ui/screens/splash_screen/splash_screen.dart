// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:health360/ui/screens/auth_ui/sign_in/sign_in_screen.dart';
// import 'package:health360/utils/app_asset.dart';
//
// class SplashScreen extends StatefulWidget {
//   static const String routeName = "splash";
//
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashState();
// }
//
// class _SplashState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(const Duration(seconds: 2), () {
//       Navigator.pushReplacementNamed(context, SignInScreen.routeName);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
//       SystemUiOverlay.top
//     ]);
//     return Scaffold(
//         body: Container(
//           decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage(AppAsset.splash),
//                   fit:BoxFit.cover
//               )
//           ),
//         ));
//   }
// }
