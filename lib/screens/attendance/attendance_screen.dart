import 'package:fitness/services/DashboardService.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/attendance.dart';
import '../../model/dashboard/dashboard.dart';
import 'package:provider/provider.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  late Future _attendanceFuture;

  final DateFormat formatter = DateFormat.jm();
  final DateFormat formatter1 = DateFormat.yMMMd('en_US');

  @override
  void initState() {
    _attendanceFuture = fetchAttendance();
    super.initState();
  }

  Widget attendance(Attendance? attendance) {
    return Card(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("${formatter1.format(DateTime.parse(attendance?.checkIn ?? ""))}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
            Divider(),
            Text("Check In: ${formatter.format(DateTime.parse(attendance?.checkIn ?? ""))}"),
            SizedBox(
              height: 12,
            ),
            Text("Check Out: ${formatter.format(DateTime.parse(attendance?.checkOut ?? ""))}"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Attendance"),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 64),
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
        child: FutureBuilder(
          future: _attendanceFuture,
          builder: (context, state) {
            if (state.connectionState == ConnectionState.waiting) {
              return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
            } else {
              if (!state.hasError) {
                return Consumer<DashboardService>(
                  builder: (_, service, __) {
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                        itemCount: service.attendanceResponse.attendance?.length,
                        itemBuilder: (BuildContext context, int index) {
                      return attendance(
                          service.attendanceResponse.attendance![index]);
                    });
                  },
                );
              }
              return const Center(child: Text("Could not fetch attendance."));
            }
          },
        ),
      ),
    );
  }

  Future fetchAttendance() async {
    await Provider.of<DashboardService>(context, listen: false)
        .fetchAttendance();
  }
}
