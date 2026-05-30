import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiz/controller/invoice_controller.dart';
import 'package:mobiz/view/dashboad/dash_screen.dart';

class SaleScreen extends StatelessWidget {
  final dynamic customer;
  SaleScreen({super.key, this.customer});

  final InvoiceController invoiceController = Get.find<InvoiceController>();

  final TextEditingController remarksController = TextEditingController();

  final TextEditingController discountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F7),

      appBar: AppBar(
        backgroundColor: const Color(0xff4E4BB8),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "Sale",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.search, color: Colors.white, size: 30),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            /// TOP SCROLLABLE SECTION
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Customer
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          customer["name"].toString(),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),

                        Row(
                          children: [
                            vatButton(title: "VAT", isSelected: true),

                            const SizedBox(width: 5),

                            vatButton(title: "NO VAT", isSelected: false),
                          ],
                        ),
                      ],
                    ),

                    const SizedBox(height: 15),

                    /// Product List
                    Obx(() {
                      if (invoiceController.invoiceItems.isEmpty) {
                        return Container(
                          height: 200,
                          alignment: Alignment.center,
                          child: const Text(
                            "No Products Added",
                            style: TextStyle(fontSize: 18),
                          ),
                        );
                      }

                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: invoiceController.invoiceItems.length,
                        itemBuilder: (context, index) {
                          final item = invoiceController.invoiceItems[index];

                          return Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.15),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "${item["id"]} | ${item["name"]}",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),

                                    IconButton(
                                      onPressed: () {
                                        invoiceController.invoiceItems.removeAt(
                                          index,
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ],
                                ),

                                Text(
                                  "${item["type"]} | ${item["unit"]} | Qty: ${item["quantity"]} | Rate: ${item["amount"]}",
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }),
                  ],
                ),
              ),
            ),

            /// FIXED BOTTOM SECTION
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 6),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Remarks
                  Row(
                    children: [
                      const SizedBox(
                        width: 90,
                        child: Text("Remarks", style: TextStyle(fontSize: 18)),
                      ),

                      Expanded(
                        child: TextFormField(
                          controller: remarksController,
                          decoration: InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  /// Discount
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 90,
                              child: Text(
                                "Discount",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),

                            GestureDetector(
                              onTap: () {
                                invoiceController.isPercentage.value = false;
                              },
                              child: Obx(
                                () => vatButton(
                                  title: "AMOUNT",
                                  isSelected:
                                      !invoiceController.isPercentage.value,
                                ),
                              ),
                            ),

                            const SizedBox(width: 5),

                            GestureDetector(
                              onTap: () {
                                invoiceController.isPercentage.value = true;
                              },
                              child: Obx(
                                () => vatButton(
                                  title: "PERCENTAGE",
                                  isSelected:
                                      invoiceController.isPercentage.value,
                                ),
                              ),
                            ),

                            const SizedBox(width: 10),

                            Expanded(
                              child: Obx(
                                () => TextFormField(
                                  controller: discountController,
                                  keyboardType: TextInputType.number,
                                  onChanged: (value) {
                                    invoiceController.discountValue.value =
                                        double.tryParse(value) ?? 0;
                                  },
                                  decoration: InputDecoration(
                                    hintText:
                                        invoiceController.isPercentage.value
                                        ? "Enter %"
                                        : "Enter Amount",
                                    isDense: true,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // child: TextFormField(
                        //   controller:
                        //       discountController,
                        //   keyboardType:
                        //       TextInputType.number,
                        //   decoration:
                        //       InputDecoration(
                        //     isDense: true,
                        //     border:
                        //         OutlineInputBorder(
                        //       borderRadius:
                        //           BorderRadius.circular(
                        //         8,
                        //       ),
                        //     ),
                        //   ),
                        //   onChanged: (_) {
                        //     invoiceController
                        //         .invoiceItems
                        //         .refresh();
                        //   },
                        // ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  /// TOTALS
                  Obx(() {
                    double total = 0;

                    for (var item in invoiceController.invoiceItems) {
                      final rate =
                          double.tryParse(item["amount"].toString()) ?? 0;

                      final qty =
                          double.tryParse(item["quantity"].toString()) ?? 0;

                      total += rate * qty;
                    }

                    final tax = total * 0.05;

                    double discountAmount = 0;

                    if (invoiceController.isPercentage.value) {
                      discountAmount =
                          (total * invoiceController.discountValue.value) / 100;
                    } else {
                      discountAmount = invoiceController.discountValue.value;
                    }

                    final grandTotal = total + tax - discountAmount;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Total : ${total.toStringAsFixed(2)}",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),

                        const SizedBox(height: 5),

                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Tax : ${tax.toStringAsFixed(2)}",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),

                        const SizedBox(height: 5),

                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Discount : ${discountAmount.toStringAsFixed(2)}",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),

                        const SizedBox(height: 5),

                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Grand Total : ${grandTotal.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    );
                  }),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff4E4BB8),
                      ),
                      onPressed: () async {
                        await invoiceController.saveInvoice(
                          customerId: customer["id"],
                          remarks: remarksController.text,
                        );
                        Future.delayed(const Duration(seconds: 1), () {
                          Get.offAll(() => DashScreen());
                        });
                      },
                      child: const Text(
                        "SAVE",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget vatButton({required String title, required bool isSelected}) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xff4E4BB8) : Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
