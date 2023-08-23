// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class Phone extends StatefulWidget {
//   final Color color;

//   const Phone({super.key, required this.color});

//   @override
//   State<Phone> createState() => _PhoneState();
// }

// class _PhoneState extends State<Phone> {
//   @override
//   Widget build(BuildContext context) {
//     String time = DateFormat.jm().format(DateTime.now());
//     return Container(
//       padding: const EdgeInsets.all(10),
//       constraints: BoxConstraints(
//         maxHeight: 510,
//         maxWidth: 250,
//       ),
//       decoration: BoxDecoration(
//         color: widget.color,
//         borderRadius: BorderRadius.circular(26),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.menu),
//                 SizedBox(width: 50),
//                 Text(
//                   "Projects",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
