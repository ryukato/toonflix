// import 'dart:async';

// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   static const twentyFiveMinutes = 1500;
//   int totalSeconds = twentyFiveMinutes;
//   bool isRunning = false;
//   int totalPomodoros = 0;
//   late Timer timer;

//   void onTick(Timer _) {
//     if (totalSeconds == 0) {
//       setState(() {
//         totalPomodoros += 1;
//         isRunning = false;
//         totalSeconds = twentyFiveMinutes;
//       });
//       timer.cancel();
//     } else {
//       setState(() {
//         totalSeconds -= 1;
//       });
//     }
//   }

//   void onStartPressed() {
//     setState(() {
//       isRunning = true;
//     });
//     timer = Timer.periodic(const Duration(seconds: 1), onTick);
//   }

//   void onPausePressed() {
//     setState(() {
//       isRunning = false;
//     });
//     timer.cancel();
//   }

//   void onResetPressed() {
//     setState(() {
//       totalSeconds = twentyFiveMinutes;
//       isRunning = false;
//       totalPomodoros = 0;
//     });
//     timer.cancel();
//   }

//   String format(int seconds) {
//     var duration = Duration(seconds: seconds);
//     return duration.toString().split(".").first.substring(2, 7);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Theme.of(context).colorScheme.background,
//       body: Column(
//         children: [
//           Flexible(
//             flex: 1,
//             child: Container(
//               alignment: Alignment.bottomCenter,
//               child: Text(
//                 format(totalSeconds),
//                 style: TextStyle(
//                     color: Theme.of(context).cardColor,
//                     fontSize: 89,
//                     fontWeight: FontWeight.w600),
//               ),
//             ),
//           ),
//           Flexible(
//             flex: 3,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   iconSize: 120,
//                   color: Theme.of(context).cardColor,
//                   onPressed: isRunning ? onPausePressed : onStartPressed,
//                   icon: Icon(isRunning
//                       ? Icons.pause_circle_outline
//                       : Icons.play_circle_outline),
//                 ),
//                 IconButton(
//                   iconSize: 120,
//                   color: Theme.of(context).cardColor,
//                   onPressed: isRunning ? () => {() => {}} : onResetPressed,
//                   icon: Icon(isRunning ? null : Icons.stop_circle_outlined),
//                 )
//               ],
//             ),
//           ),
//           Flexible(
//             flex: 1,
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50),
//                       color: Theme.of(context).cardColor,
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Pomodoros',
//                           style: TextStyle(
//                               fontSize: 20,
//                               color: Theme.of(context)
//                                   .textTheme
//                                   .labelLarge!
//                                   .color),
//                         ),
//                         Text(
//                           '$totalPomodoros',
//                           style: TextStyle(
//                               fontSize: 58,
//                               color: Theme.of(context)
//                                   .textTheme
//                                   .labelLarge!
//                                   .color),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
