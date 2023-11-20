import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';

void main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//           colorScheme: const ColorScheme(
//             primary: Color(0xFFE7626C),
//             onPrimary: Color(0xFFE7626C),
//             secondary: Color(0xFFE7626C),
//             onSecondary: Color(0xFFE7626C),
//             error: Color(0xFFE7626C),
//             onError: Color(0xFFE7626C),
//             background: Color(0xFFE7626C),
//             onBackground: Color(0xFFE7626C),
//             brightness: Brightness.light,
//             surface: Color(0xFFE7626C),
//             onSurface: Color(0xFFE7626C),
//           ),
//           textTheme: const TextTheme(
//               displayLarge: TextStyle(color: Color(0xFF232B55))),
//           cardColor: const Color(0xFFF4EDDB)),
//       home: const HomeScreen(),
//     );
//   }
// }



// class MyTitleWidget extends StatefulWidget {
//   const MyTitleWidget({super.key});

//   @override
//   State<MyTitleWidget> createState() => _MyTitleWidgetState();
// }

// class _MyTitleWidgetState extends State<MyTitleWidget> {
//   @override
//   void initState() {
//     super.initState();
//     debugPrint("init myTitileWidget");
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     debugPrint("dispose myTitileWidget");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       'My Large Title',
//       style: TextStyle(
//           fontSize: 30, color: Theme.of(context).textTheme.titleLarge!.color),
//     );
//   }
// }

// class _AppState extends State<App> {
//   bool showTitle = true;
//   void toggleTitle() {
//     setState(() {
//       showTitle = !showTitle;
//     });
//   }

//   int _count = 0;
//   List<int> numbers = [];
//   void onClicked() {
//     setState(() {
//       _count += 1;
//       numbers.add(_count);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         textTheme: const TextTheme(
//             titleLarge: TextStyle(
//           color: Colors.red,
//         )),
//       ),
//       home: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               showTitle ? const MyTitleWidget() : const Text('nothing'),
//               IconButton(
//                 onPressed: toggleTitle,
//                 icon: const Icon(Icons.remove_red_eye),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // @override
//   // Widget build(BuildContext context) {
//   //   return MaterialApp(
//   //     home: Scaffold(
//   //       body: Center(
//   //         child: Column(
//   //           mainAxisAlignment: MainAxisAlignment.center,
//   //           children: [
//   //             const Text('Count'),
//   //             for (var n in numbers) Text('$n'),
//   //             IconButton(
//   //               onPressed: onClicked,
//   //               icon: const Icon(Icons.add_box_rounded),
//   //             )
//   //           ],
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
// }

// class _AppState extends State<App> {
//   @override
//   Widget build(BuildContext context) {
//     const nameText = Text(
//       'Hey Yoonyoul',
//       style: TextStyle(
//           color: Colors.white, fontSize: 34, fontWeight: FontWeight.w800),
//     );
//     const greetText = Text(
//       'Welcome back',
//       style: TextStyle(color: Colors.white, fontSize: 18),
//     );
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: const Color(0xFF181818),
//         body: SingleChildScrollView(
//           child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 40,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 80,
//                   ),
//                   const Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                           nameText,
//                           greetText,
//                         ],
//                       )
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 70,
//                   ),
//                   Text(
//                     'Total Balance',
//                     style: TextStyle(
//                       fontSize: 27,
//                       color: Colors.white.withOpacity(0.8),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     '\$5 194 482',
//                     style: TextStyle(
//                       fontSize: 44,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.white.withOpacity(0.8),
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       const Text(
//                         'Wallet',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 36,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                       Text(
//                         'View All',
//                         style: TextStyle(
//                           color: Colors.white.withOpacity(0.8),
//                           fontSize: 18,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   const CurrencyCard(
//                     name: 'Euro',
//                     code: 'EUR',
//                     amount: '6.248',
//                     icon: Icons.euro_rounded,
//                     order: 1,
//                   ),
//                   const CurrencyCard(
//                     name: 'Bitcoin',
//                     code: 'BTC',
//                     amount: '6.248',
//                     icon: Icons.currency_bitcoin_rounded,
//                     order: 2,
//                   ),
//                   const CurrencyCard(
//                     name: 'Dollar',
//                     code: 'USD',
//                     amount: '6.248',
//                     icon: Icons.attach_money_outlined,
//                     order: 3,
//                   ),
//                 ],
//               )),
//         ),
//       ),
//     );
//   }
// }
