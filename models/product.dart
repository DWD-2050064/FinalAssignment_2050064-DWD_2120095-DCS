// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MaterialApp(
//     home: product(),
//   ));
//
// }
//
// class product extends StatefulWidget {
//   const product({Key? key}) : super(key: key);
//
//   @override
//   State<product> createState() => _productState();
// }
//
// class _productState extends State<product> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView(
//         children: [
//           Container(
//             padding: EdgeInsets.all(16),
//             width: MediaQuery.of(context).size.width,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Image.asset("images/back_button.png"),
//                 Container(
//                   child: Column(
//                     children: <Widget>[
//                       Text(
//                         "MEN'S ORIGINAL",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w100, fontSize: 14),
//                       ),
//                       Text(
//                         "Smiths Shoes",
//                         style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: Color(0xFF2F2F3E)),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Image.asset(
//                   "images/bag_button.png",
//                   width: 27,
//                   height: 30,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
