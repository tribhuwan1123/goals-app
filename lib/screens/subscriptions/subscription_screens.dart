// import 'package:flutter/material.dart';
//
// class SubscriptionScreen extends StatefulWidget {
//   const SubscriptionScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SubscriptionScreen> createState() => _SubscriptionScreenState();
// }
//
// class _SubscriptionScreenState extends State<SubscriptionScreen> {
//
//   late Future _subscriptionFuture;
//
//   @override
//   void initState() {
//     _subscriptionFuture = fetchSubs();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         title: Text("Due Payments"),
//       ),
//       body: Container(
//         padding: EdgeInsets.only(top: 64),
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.8),
//                 spreadRadius: 5,
//                 blurRadius: 5,
//                 offset: const Offset(0, 0), // changes position of shadow
//               ),
//             ],
//             image: DecorationImage(
//               image: const AssetImage("assets/images/two.jpg"),
//               fit: BoxFit.cover,
//               colorFilter: ColorFilter.mode(
//                 Colors.black.withOpacity(0.2),
//                 BlendMode.dstATop,
//               ),
//             )),
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.all(16),
//             child: FutureBuilder(
//               future: _subscriptionFuture,
//               builder: (context, state) {
//                 if (state.connectionState == ConnectionState.waiting) {
//                   return Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height,
//                     child: const Center(
//                       child: CircularProgressIndicator(),
//                     ),
//                   );
//                 } else {
//                   if (!state.hasError) {
//                     return Consumer<MembershipService>(
//                       builder: (_, service, __) => service
//                           .productDuePayments.data !=
//                           null
//                           ? Column(
//                         children: [
//                           ListView.builder(
//                               padding: EdgeInsets.zero,
//                               physics:
//                               const NeverScrollableScrollPhysics(),
//                               shrinkWrap: true,
//                               itemCount: service.duePayments.data?.length,
//                               itemBuilder:
//                                   (BuildContext context, int index) {
//                                 return ProductDuePaymentsData(service
//                                     .productDuePayments.data![index]);
//                               })
//                         ],
//                       )
//                           : const Center(
//                           child: Text("Could not fetch due payments. . .")),
//                     );
//                   }
//                   return const Center(
//                       child: Text("Could not fetch due payments."));
//                 }
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future fetchSubs() async {
//
//   }
// }
