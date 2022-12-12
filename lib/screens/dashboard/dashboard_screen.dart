import 'package:fitness/model/dashboard/dashboard.dart';
import 'package:fitness/model/dashboard/diet_plan.dart';
import 'package:fitness/model/profile_model.dart';
import 'package:fitness/screens/attendance/attendance_screen.dart';
import 'package:fitness/screens/dashboard/class_schedule.dart';
import 'package:fitness/screens/dashboard/expiring_subscriptions.dart';
import 'package:fitness/screens/dashboard/notifications.dart';
import 'package:fitness/screens/dashboard/payment_chart.dart';
import 'package:fitness/screens/dashboard/subscription_screen.dart';
import 'package:fitness/screens/payments/due_payments_screen.dart';
import 'package:fitness/screens/payments/payment_screen.dart';
import 'package:fitness/screens/product_payments/product_due_payments_screen.dart';
import 'package:fitness/screens/profile.dart';
import 'package:fitness/services/DashboardService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../animation/Slide.dart';
import '../product_payments/product_payment_screen.dart';
import 'default_training_plan.dart';
import 'membership_due_payments.dart';
import 'my_badge.dart';
import 'package:qr_flutter/qr_flutter.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Future _dashboardFuture;
  late Future _profileFuture;
  late Dashboard dashboard;
  late Profile profile;
  String profileImage = "";
  String? qrMessage = "";
  int? totalSubscription = 0;
  String? totalAmountPaid = "0";
  int? notificationCount = 0;
  List<Notifications>? notifications = [];

  @override
  void initState() {
    _dashboardFuture = fetchDashboard();
    super.initState();
  }

  Future fetchDashboard() async {
    await Provider.of<DashboardService>(context, listen: false)
        .fetchDashboard();
    dashboard = Provider.of<DashboardService>(context, listen: false).dashboard;
    totalSubscription =
        await Provider.of<DashboardService>(context, listen: false).totalSubs;
    totalAmountPaid =
        await Provider.of<DashboardService>(context, listen: false)
            .totalAmountPaid;
    notificationCount =
        await Provider.of<DashboardService>(context, listen: false)
            .notificationsCount;
    notifications = await Provider.of<DashboardService>(context, listen: false)
        .notifications;
    setState(() {
      profileImage =
          Provider.of<DashboardService>(context, listen: false).profileImage!;
      qrMessage =
          Provider.of<DashboardService>(context, listen: false).qrMessage;
    });
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Basic dialog title'),
          content:
              QrImage(data: "Hello", version: QrVersions.auto, size: 200.0),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text("Dashboard"),
          actions: [
            MyBadge(
                top: 8,
                right: 8,
                value: notificationCount.toString(),
                child: IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {
                      Navigator.push(
                          context,
                          Slide(
                              builder: (context) =>
                                  NotificationScreen(notifications),
                              settings: null));
                    })),
            InkWell(
              onTap: () {
                Navigator.push(
                        context,
                        Slide(
                            builder: (context) => ProfileScreen(),
                            settings: null))
                    .then((value) {
                  setState(() {
                    profileImage =
                        Provider.of<DashboardService>(context, listen: false)
                            .profileImage!;
                  });
                });
              },
              child: profileImage.isEmpty
                  ? Icon(
                      Icons.person_pin,
                      color: Colors.white70,
                    )
                  : CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          "https://gym.hamrofitness.com$profileImage"),
                      backgroundColor: Colors.white,
                    ),
            )
          ]),
      body: Container(
        padding: EdgeInsets.only(top: 80),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.8),
                spreadRadius: 5,
                blurRadius: 5,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
            image: DecorationImage(
              image: const AssetImage("assets/images/two.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2),
                BlendMode.dstATop,
              ),
            )),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8),
            child: FutureBuilder(
              future: _dashboardFuture,
              builder: (context, state) {
                if (state.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (!state.hasError) {
                    return Consumer<DashboardService>(
                      builder: (_, service, __) => service.dashboard != null
                          ? Column(
                              children: [
                                IntrinsicHeight(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Card(
                                            elevation: 4.0,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    "Total Subscriptions",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    totalSubscription
                                                        .toString(),
                                                    style:
                                                        TextStyle(fontSize: 17),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Card(
                                            elevation: 4.0,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              child: Column(
                                                children: [
                                                  const Text(
                                                    "Total Amount Paid",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "Rs.${totalAmountPaid.toString()}",
                                                    style: const TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.green),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ))
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Due Payments",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18),
                                    )),
                                ListView.builder(
                                    padding: EdgeInsets.zero,
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: service
                                        .dashboard.data?.duePayments?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return MemberShipDuePayments(service
                                          .dashboard.data?.duePayments![index]);
                                    }),
                                const SizedBox(
                                  height: 10,
                                ),
                                DietPlan("Default Diet Plan",
                                    service.dashboard.data?.defaultDietPlan),
                                Divider(
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                DietPlan("Client Diet Plan",
                                    service.dashboard.data?.clientDietPlan),
                                Divider(
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ExpansionTile(
                                  iconColor: Colors.white,
                                  collapsedIconColor: Colors.white,
                                  title: Text("Training Plan",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                  //add icon
                                  childrenPadding: EdgeInsets.only(left: 60),
                                  //children padding
                                  children: [
                                    ListTile(
                                      title: Text("Default plan",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            Slide(
                                                builder: (context) =>
                                                    DefaultTrainingPlanScreen(
                                                        "Default Training Plan",
                                                        service.dashboard.data
                                                            ?.defaultTrainingPlan),
                                                settings: null));
                                      },
                                    ),
                                    ListTile(
                                      title: Text("Your plan",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18)),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            Slide(
                                                builder: (context) =>
                                                    DefaultTrainingPlanScreen(
                                                        "Your Training Plan",
                                                        service.dashboard.data
                                                            ?.clientTrainingPlan),
                                                settings: null));
                                      },
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: Colors.white,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        Slide(
                                            builder: (context) =>
                                                ClassScheduleScreen(service
                                                    .dashboard
                                                    .data
                                                    ?.classSchedule),
                                            settings: null));
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 16, bottom: 16, left: 16),
                                        child: Text("Class Schedule",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18)),
                                      ),
                                      new Spacer(),
                                      Container(
                                          margin: EdgeInsets.only(right: 16),
                                          child: Icon(
                                            Icons.arrow_forward_ios_sharp,
                                            color: Colors.white,
                                            size: 20,
                                          ))
                                    ],
                                  ),
                                ),
                                service.dashboard.data?.expiringSubscriptions !=
                                            null &&
                                        service
                                                .dashboard
                                                .data
                                                ?.expiringSubscriptions
                                                ?.length !=
                                            0
                                    ? Column(
                                        children: [
                                          Divider(
                                            color: Colors.white,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  Slide(
                                                      builder: (context) =>
                                                          ExpiringSubscription(
                                                              service
                                                                  .dashboard
                                                                  .data
                                                                  ?.expiringSubscriptions),
                                                      settings: null));
                                            },
                                            child: Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      top: 16,
                                                      bottom: 16,
                                                      left: 16),
                                                  child: Text(
                                                      "Expiring subscriptions in next 45 days",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 18)),
                                                ),
                                                new Spacer(),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        right: 16),
                                                    child: Icon(
                                                      Icons
                                                          .arrow_forward_ios_sharp,
                                                      color: Colors.white,
                                                      size: 20,
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    : Container(),
                                Divider(
                                  color: Colors.white,
                                ),
                                Container(
                                  height: 400,
                                  child: PaymentChartScreen(
                                      service.dashboard.data?.paymentCharts),
                                )
                              ],
                            )
                          : Container(
                              child: Center(
                                  child:
                                      Text("Could not fetch dashboard. . .")),
                            ),
                    );
                  }
                  return Center(child: Text("Could not fetch dashboard."));
                }
              },
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
            child: Column(
          children: [
            ExpansionTile(
              title: Text("Membership Payments"),
              leading: Icon(Icons.payments_outlined), //add icon
              childrenPadding: EdgeInsets.only(left: 60), //children padding
              children: [
                ListTile(
                  title: Text("Payments"),
                  onTap: () {
                    Navigator.push(
                        context,
                        Slide(
                            builder: (context) => PaymentsScreen(),
                            settings: null));
                  },
                ),
                ListTile(
                  title: Text("Due Payments"),
                  onTap: () {
                    Navigator.push(
                        context,
                        Slide(
                            builder: (context) => DuePaymentsScreen(),
                            settings: null));
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: Text("Product Payments"),
              leading: Icon(Icons.payments_outlined), //add icon
              childrenPadding: EdgeInsets.only(left: 60), //children padding
              children: [
                ListTile(
                  title: Text("Payments"),
                  onTap: () {
                    Navigator.push(
                        context,
                        Slide(
                            builder: (context) => ProductPaymentsScreen(),
                            settings: null));
                  },
                ),
                ListTile(
                  title: Text("Due Payments"),
                  onTap: () {
                    Navigator.push(
                        context,
                        Slide(
                            builder: (context) => ProductDuePaymentsScreen(),
                            settings: null));
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: Text("Attendance"),
              leading: Icon(Icons.calendar_month), //add icon
              childrenPadding: EdgeInsets.only(left: 60), //children padding
              children: [
                ListTile(
                  title: Text("Attendance"),
                  onTap: () {
                    Navigator.push(
                        context,
                        Slide(
                            builder: (context) => AttendanceScreen(),
                            settings: null));
                  },
                ),
              ],
            ),
            ExpansionTile(
              title: Text("Subscriptions"),
              leading: Icon(Icons.calendar_month), //add icon
              childrenPadding: EdgeInsets.only(left: 60), //children padding
              children: [
                ListTile(
                  title: Text("Subscriptions"),
                  onTap: () {
                    Navigator.push(
                        context,
                        Slide(
                            builder: (context) => SubscriptionScreen(),
                            settings: null));
                  },
                ),
              ],
            ),
            qrMessage != null
                ? QrImage(
                    data: qrMessage!, version: QrVersions.auto, size: 200.0)
                : Container(),
          ],
        )),
      ),
    );
  }
}
