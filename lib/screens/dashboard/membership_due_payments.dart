import 'package:fitness/model/dashboard/dashboard.dart';
import 'package:flutter/material.dart';

class MemberShipDuePayments extends StatelessWidget {
  DuePayments? duePayments;

  MemberShipDuePayments(this.duePayments);

  @override
  Widget build(BuildContext context) {
    return membershipDuePayments(duePayments);
  }

  Widget membershipDuePayments(DuePayments? duePayment) {
    int dueAmount = 0;
    if (duePayment != null &&
        duePayment.amountToBePaid != null &&
        duePayment.paid != null) {
      dueAmount = duePayment.amountToBePaid! - duePayment.paid!;
    }
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
                "${duePayment?.firstName} ${duePayment?.lastName}",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "${duePayment?.membership}",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
                    "Due Amount:",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    "$dueAmount",
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    "Due Date",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    "${duePayment?.dueDate ?? ""}",
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
}
