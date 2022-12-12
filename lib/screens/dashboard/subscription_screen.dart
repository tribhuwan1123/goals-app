import 'package:fitness/model/subscriptions/subscription_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../services/DashboardService.dart';
import 'package:provider/provider.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  late Future _subscriptionFuture;

  final DateFormat formatter = DateFormat.yMMMEd();

  @override
  void initState() {
    _subscriptionFuture = fetchSubscriptions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Subscriptions"),
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
        child: SingleChildScrollView(
          child: Column(
            children: [

              Container(
                margin: EdgeInsets.all(16),
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.all(16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Text(
                        'Add Subscription',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Colors.white,
                            letterSpacing: 1),
                      ),
                    ),
                    onPressed: () {
                    }),
              ),

              FutureBuilder(
                future: _subscriptionFuture,
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
                          return service.subscriptionResponse.data == null ||
                                  service.subscriptionResponse.data?.length == 0
                              ? const Center(
                                  child: Text("Could not fetch subscriptions."))
                              : ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      service.subscriptionResponse.data?.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return _subsItem(service
                                        .subscriptionResponse.data?[index]);
                                  });
                        },
                      );
                    }
                    return const Center(
                        child: Text("Could not fetch subscriptions."));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future fetchSubscriptions() async {
    await Provider.of<DashboardService>(context, listen: false).fetchSubs();
  }

  Widget _subsItem(Data? data) {
    int remainingPay = data!.amountToBePaid! - data.paidAmount!;
    return Card(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                data!.membership!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text("Amount to be paid "),
                Text(data.amountToBePaid.toString()),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text("Remaining Amount "),
                Text((remainingPay).toString()),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text("Next Payment "),
                Text(data.amountToBePaid.toString()),
                Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: data.nextPaymentDate == null
                            ? Colors.green
                            : Colors.orange,
                        borderRadius: BorderRadius.circular(16)),
                    child:
                        Text(remainingPay == 0 ? "Payment Complete" : "Due")),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Start Date",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(formatter.format(DateTime.parse(data.date!))),
                      ],
                    )),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Expires On",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(formatter.format(DateTime.parse(data.expiresOn!))),
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Divider(),
            SizedBox(
              height: 8,
            ),
            Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: data.status!.toLowerCase() == "active"
                        ? Colors.green
                        : Colors.orange,
                    borderRadius: BorderRadius.circular(16)),
                child: Text(
                  data.status!,
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
