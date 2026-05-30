import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiz/controller/invoice_controller.dart';
import 'package:mobiz/controller/product_dialog_controller.dart';
import 'package:mobiz/view/create_invoice/invoice.dart';

class ProductDialogWidget extends StatelessWidget {
  final Map<String, dynamic> product;
  final dynamic customer;

  ProductDialogWidget({super.key, required this.product,required this.customer});

  final ProductDialogController controller = Get.put(ProductDialogController());
  final InvoiceController invoiceController = Get.put(InvoiceController());

  @override
  Widget build(BuildContext context) {
    controller.initialize(product);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),

      child: Padding(
        padding: const EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                product["name"].toString().toUpperCase(),

                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              Center(
                child: Container(
                  height: 100,
                  width: 100,

                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12),
                  ),

                  child: const Icon(Icons.camera_alt_outlined, size: 40),
                ),
              ),

              const SizedBox(height: 20),

              const Text("Product Type"),

              const SizedBox(height: 5),

              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.selectedType.value,

                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),

                  items: const [
                    DropdownMenuItem<String>(
                      value: "Normal",
                      child: Text("Normal"),
                    ),
                  ],

                  onChanged: (String? value) {
                    if (value != null) {
                      controller.selectedType.value = value;
                    }
                  },
                ),
              ),

              const SizedBox(height: 15),

              const Text("Unit"),

              const SizedBox(height: 5),

              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.selectedUnit.value,

                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),

                  items: (product["units"] as List)
                      .map<DropdownMenuItem<String>>((unit) {
                        return DropdownMenuItem<String>(
                          value: unit["name"].toString(),

                          child: Text(unit["name"].toString()),
                        );
                      })
                      .toList(),

                  onChanged: (String? value) {
                    if (value != null) {
                      controller.selectedUnit.value = value;
                    }
                  },
                ),
              ),

              const SizedBox(height: 15),

              const Text("Amount"),

              const SizedBox(height: 5),

              TextFormField(
                controller: controller.amountController,

                keyboardType: TextInputType.number,

                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),

              const SizedBox(height: 15),

              const Text("Quantity"),

              const SizedBox(height: 5),

              TextFormField(
                controller: controller.quantityController,

                keyboardType: TextInputType.number,

                decoration: const InputDecoration(border: OutlineInputBorder()),
              ),

              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },

                    child: const Text("Close"),
                  ),

                  const SizedBox(width: 10),

                  ElevatedButton(
                    onPressed: () {
                      final invoiceController = Get.find<InvoiceController>();

                      invoiceController.addProduct(
                        product: product,
                        unit: controller.selectedUnit.value,
                        amount: controller.amountController.text.trim(),
                        quantity: controller.quantityController.text.trim(),
                        type: controller.selectedType.value,
                      );

                      Get.to(() => SaleScreen(customer:customer));
                    },
                    child: const Text("Save"),
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
