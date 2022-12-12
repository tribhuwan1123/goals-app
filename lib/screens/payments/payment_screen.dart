import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_html_to_pdf/flutter_html_to_pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../model/payments/payments.dart';
import '../../services/MembershipService.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:saf/saf.dart';

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({Key? key}) : super(key: key);

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

const directory = "/storage/emulated/0/Download/";

class _PaymentsScreenState extends State<PaymentsScreen> {
  late Future _paymentFuture;
  late Saf saf;

  String? invoice = "";
  final DateFormat formatter = DateFormat('yyyy-MM-dd hh:mm:ss a');

  bool downloading = false;
  String generatedPdfFilePath = "";

  @override
  void initState() {
    _paymentFuture = fetchPayment();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {},
    );
    Permission.storage.request();
    saf = Saf(directory);
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
          child: downloading
              ? Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Downloading...",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )
              : SingleChildScrollView(
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
                              builder: (_, service, __) => service
                                          .payments.data !=
                                      null
                                  ? Column(
                                      children: [
                                        ListView.builder(
                                            padding: EdgeInsets.zero,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount:
                                                service.payments.data?.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return payments(service
                                                  .payments.data![index]);
                                            })
                                      ],
                                    )
                                  : const Center(
                                      child: Text(
                                          "Could not fetch due payments. . .")),
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
                "${payment.firstName} ${payment.lastName}",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: 4,
              ),
              payment.membership != null && payment.membership != "null"
                  ? Text(
                      "${payment.membership}",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    )
                  : Container(),
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
              ),
              SizedBox(
                height: 4,
              ),
              Divider(),
              InkWell(
                onTap: () async {
                  await _downloadInvoice(payment.purchaseId!);
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Text(
                        "Download Invoice",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.download,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future fetchPayment() async {
    await Provider.of<MembershipService>(context, listen: false)
        .fetchPayments();
  }

  Future _downloadInvoice(int purchaseId) async {
    try {
      setState(() {
        downloading = true;
      });
      await Provider.of<MembershipService>(context, listen: false)
          .downloadInvoice(purchaseId.toString());
      invoice = Provider.of<MembershipService>(context, listen: false).invoice;

      if (invoice != null) {await checkWritePermission();
        String? savePath = await getFileSavePath();
        var targetFileName = "invoice-${DateTime.now().millisecondsSinceEpoch}";

        await FlutterHtmlToPdf.convertFromHtmlContent(
            invoice!, savePath!, targetFileName);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("File saved..."),
        ));
      }
      setState(() {
        downloading = false;
      });
    } catch (e) {
      setState(() {
        downloading = false;
      });
    }
  }

  Future<void> checkWritePermission() async {
    if (Platform.isAndroid || Platform.isIOS) {
      var permissionStatus = await Permission.storage.status;

      switch (permissionStatus) {
        case PermissionStatus.denied:
        case PermissionStatus.permanentlyDenied:
          await Permission.storage.request();
          break;
        default:
      }

      await saf.getDirectoryPermission(isDynamic: true);

      print('permission status: $permissionStatus');
    }
  }

  Future<String?> getFileSavePath() async {
    Directory? directory;
    try {
      if (Platform.isIOS) {
        directory = await getApplicationSupportDirectory();
      } else {
        // if platform is android
        directory = Directory('/storage/emulated/0/Download');
        if (!await directory.exists()) {
          directory = await getExternalStorageDirectory();
        }
      }
    } catch (err, stack) {
      print("Can-not get download folder path");
    }
    return directory?.path;
  }
}
