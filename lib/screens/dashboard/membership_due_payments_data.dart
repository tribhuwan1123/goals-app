import 'package:fitness/model/payments/due_payments.dart';
import 'package:flutter/material.dart';

class MemberShipDuePaymentsData extends StatelessWidget {
  final Data duePayments;

  const MemberShipDuePaymentsData(this.duePayments, {super.key});

  @override
  Widget build(BuildContext context) {
    return membershipDuePayments(duePayments);
  }

  Widget membershipDuePayments(Data duePayment) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      child: Card(
        elevation: 4.0,
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "${duePayment.membership}",
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              const Divider(
                height: 1,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  const Text(
                    "Due Amount: ",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    "${duePayment.amountToBePaid}",
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  const Text(
                    "Due Date: ",
                    style: TextStyle(fontSize: 17),
                  ),
                  Text(
                    "${duePayment.dueDate}",
                    style: const TextStyle(fontSize: 17),
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
