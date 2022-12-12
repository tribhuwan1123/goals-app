import 'package:flutter/material.dart';

import '../../model/payments/payments.dart';
import '../../services/MembershipService.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ProductPaymentsScreen extends StatefulWidget {
  const ProductPaymentsScreen({Key? key}) : super(key: key);

  @override
  State<ProductPaymentsScreen> createState() => _ProductPaymentsScreenState();
}

class _ProductPaymentsScreenState extends State<ProductPaymentsScreen> {
  late Future _paymentFuture;

  final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm:ss a');

  @override
  void initState() {
    _paymentFuture = fetchPayment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Payments"),
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
        child: Container(
          padding: EdgeInsets.only(top: 64),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: FutureBuilder(
                future: _paymentFuture,
                builder: (context, state) {
                  if (state.connectionState == ConnectionState.waiting) {
                    return Container(
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
                      return Consumer<MembershipService>(
                        builder: (_, service, __) => service.payments.data !=
                                null
                            ? Column(
                                children: [
                                  ListView.builder(
                                      padding: EdgeInsets.zero,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: service.payments.data?.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return payments(
                                            service.payments.data![index]);
                                      })
                                ],
                              )
                            : const Center(
                                child:
                                    Text("Could not fetch due payments. . .")),
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
      ),
    );
  }

  Widget payments(Data payment) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Card(
        elevation: 4.0,
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${payment.productName}",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: 4,
              ),
              SizedBox(
                height: 4,
              ),
              Divider(
                height: 1,
                color: Colors.grey,
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    "Payment Source: ",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    "${payment.paymentSource}",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    "Payment ID: ",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    "${payment.paymentId}",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    "Amount: ",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    "${payment.paymentAmount}",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Date: ",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${formatter.format(DateTime.parse(payment.paymentDate!))}",
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future fetchPayment() async {
    await Provider.of<MembershipService>(context, listen: false)
        .fetchProductPayments();
  }
}
