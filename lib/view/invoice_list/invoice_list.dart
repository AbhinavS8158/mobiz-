import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiz/controller/sales_invoice_controller.dart';

class SalesInvoiceScreen extends StatelessWidget {
  SalesInvoiceScreen({super.key});

  final SalesInvoiceController controller =
      Get.put(SalesInvoiceController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F7),
      appBar: AppBar(
        backgroundColor: const Color(0xff4E4BB8),
        title: const Text(
          "Sales Invoice",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body:
       Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (controller.invoices.isEmpty) {
          return const Center(
            child: Text("No Invoices Found"),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.invoices.length,
          itemBuilder: (context, index) {
            final item = controller.invoices[index];

           String customerName = "No Customer";

if (item["customer"] != null) {
  if (item["customer"] is List &&
      item["customer"].isNotEmpty) {
    customerName =
        item["customer"][0]["name"]?.toString() ??
        "No Customer";
  } else if (item["customer"] is Map) {
    customerName =
        item["customer"]["name"]?.toString() ??
        "No Customer";
  }
}
            // print("Customer Name: $customerName");

            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 6,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    "${item['invoice_no']} | ${item['in_date']}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    customerName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Total : ${item['total']}",
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Round off : ${item['round_off']}",
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Total Vat : ${item['total_tax']}",
                  ),

                  const SizedBox(height: 5),

                  Text(
                    "Grand Total : ${item['grand_total']}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}