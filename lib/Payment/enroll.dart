import 'package:flutter/material.dart';
import 'package:untitled/Payment/Widgets/billing_address_container.dart';
import 'package:untitled/Payment/Widgets/billing_summary_container.dart';
import 'package:untitled/Payment/Widgets/order_review_container.dart';
import 'package:untitled/Payment/Widgets/pay_widget.dart';
import 'package:untitled/Payment/Widgets/payment_method_container.dart';
import 'package:untitled/Widgets/Appbar/custom_appbar.dart';
class EnrollScreen extends StatelessWidget {
  const EnrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Payment Method',
        onBackPressed: () {
          Navigator.of(context).pop();
        },
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 520,
            padding: const EdgeInsets.all(8.0),
            child:  const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),

                  // Billing Address
                  BillingAddressContainer(),
                  SizedBox(height: 20),

                  // Payment Method
                  PaymentMethodContainer(),
                  SizedBox(height: 20),

                  // Order Review
                  OrderReviewContainer(),
                  SizedBox(height: 20),

                  // Billing Summary
                  BillingSummaryContainer(),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 4.0, right: 4.0),
            child: const PayWidget(),
          ),
        ],
      ),
    );
  }
}