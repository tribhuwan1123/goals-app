import 'package:fitness/services/DashboardService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Future _dashboardFuture;
  int totalSubscription = 0;
  String totalAmountPaid = "0";

  @override
  void initState() {
    _dashboardFuture = fetchDashboard();
    super.initState();
  }

  Future fetchDashboard() async {
    await Provider.of<DashboardService>(context, listen: false)
        .fetchDashboard();
    totalSubscription =
        await Provider.of<DashboardService>(context, listen: false).totalSubs;
    totalAmountPaid =
        await Provider.of<DashboardService>(context, listen: false)
            .totalAmountPaid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Dashboard"),
        ),
        body: Container(
            child: FutureBuilder(
          future: _dashboardFuture,
          builder: (context, state) {
            if (state.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (!state.hasError) {
                return RefreshIndicator(
                  onRefresh: fetchDashboard,
                  child: Consumer<DashboardService>(
                    builder: (_, service, __) => service.dashboard != null
                        ? Container(
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Card(
                                        child: Column(
                                          children: [
                                            Text("Total Subscriptions"),
                                            Text(totalSubscription.toString()),
                                          ],
                                        ),
                                      ),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      child: Card(
                                        child: Column(
                                          children: [
                                            Text("Total Amount Paid"),
                                            Text(totalAmountPaid.toString()),
                                          ],
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          )
                        : Container(
                            child: Center(
                                child: Text("Could not fetch dashboard. . .")),
                          ),
                  ),
                );
              }
              return Center(child: Text("Could not fetch dashboard. . ."));
            }
          },
        )));
  }
}
