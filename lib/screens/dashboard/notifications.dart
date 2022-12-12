import 'package:flutter/material.dart';

import '../../model/dashboard/dashboard.dart';

class NotificationScreen extends StatefulWidget {
  List<Notifications>? notifications;

  NotificationScreen(this.notifications, {super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Notifications"),
      ),
      body: Container(
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
        padding: EdgeInsets.all(8),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.notifications?.length,
            itemBuilder: (BuildContext context, int index) {
              return notification(widget.notifications?[index]);
            }),
      ),
    );
  }
}

Widget notification(Notifications? notification) {
  return Container(
    padding: EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 4,
        ),
        Text(
          notification?.notificationType ?? "",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          notification?.title ?? "",
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 4,
        ),
        Divider(
          height: 1,
          color: Colors.white,
        ),
        SizedBox(
          height: 4,
        ),
      ],
    ),
  );
}
