import 'package:flutter/material.dart';

import '../../model/payments/product_due_payments.dart';

class ProductDuePaymentsData extends StatelessWidget {
  final Data duePayments;

  const ProductDuePaymentsData(this.duePayments, {super.key});

  @override
  Widget build(BuildContext context) {
    return membershipDuePayments(duePayments);
  }

  Widget membershipDuePayments(Data duePayment) {
    int amount = duePayment.totalAmount! - duePayment.paidAmount!;
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
                "${duePayment.productName}",
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
                    amount.toString(),
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
