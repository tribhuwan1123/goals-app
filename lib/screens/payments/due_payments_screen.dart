import 'package:fitness/screens/dashboard/membership_due_payments_data.dart';
import 'package:fitness/services/MembershipService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DuePaymentsScreen extends StatefulWidget {
  const DuePaymentsScreen({Key? key}) : super(key: key);

  @override
  State<DuePaymentsScreen> createState() => _DuePaymentsScreenState();
}

class _DuePaymentsScreenState extends State<DuePaymentsScreen> {
  late Future _duePaymentFuture;

  @override
  void initState() {
    _duePaymentFuture = fetchDuePayments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Due Payments"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 64),
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
          child: Padding(
            padding: EdgeInsets.all(16),
            child: FutureBuilder(
              future: _duePaymentFuture,
              builder: (context, state) {
                if (state.connectionState == ConnectionState.waiting) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  if (!state.hasError) {
                    return Consumer<MembershipService>(
                      builder: (_, service, __) => service.duePayments.data !=
                              null
                          ? Column(
                              children: [
                                ListView.builder(
                                    padding: EdgeInsets.zero,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: service.duePayments.data?.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return MemberShipDuePaymentsData(
                                          service.duePayments.data![index]);
                                    })
                              ],
                            )
                          : const Center(
                              child: Text("Could not fetch due payments. . .")),
                    );
                  }
                  return const Center(
                      child: Text("Could not fetch due payments."));
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Future fetchDuePayments() async {
    await Provider.of<MembershipService>(context, listen: false)
        .fetchDuePayments();
  }
}
