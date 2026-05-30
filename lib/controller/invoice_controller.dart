import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceController extends GetxController {
  RxList<Map<String, dynamic>> invoiceItems =
      <Map<String, dynamic>>[].obs;

  RxBool isVat = true.obs;
  RxBool isPercentage = false.obs;
  RxDouble discountValue = 0.0.obs;

  final Dio dio = Dio();

  void addProduct({
    required Map<String, dynamic> product,
    required String unit,
    required String amount,
    required String quantity,
    required String type,
  }) {
    invoiceItems.add({
      "id": product["id"],
      "name": product["name"],
      "unit": unit,
      "amount": amount,
      "quantity": quantity,
      "type": type,
    });
  }

  Future<void> saveInvoice({
  required int customerId,
  required String remarks,
}) async {
  try {
    // Prepare body
    Map<String, dynamic> body = {
      "customer_id": customerId,
      "store_id": 112,
      "user_id": 150,
      "van_id": 0,
      "save_mode": "normal",
      "order_type": 1,
      "discount": 50,
      "total": 900,
      "total_tax": 50,
      "grand_total": 900,
      "round_off": 0,
      "if_vat": 1,
      "remarks": remarks,
      "item_id": [12815],
      "quantity": [2],
      "mrp": [200],
      "product_type": [1],
      "unit": [1530]
    };

    final response = await dio.post(
      "http://142.93.214.133:3641/api/vansale.store",
      data: body,
      options: Options(
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
      ),
    );

    print(response.data);

    Get.snackbar(
      "Success",
      "Invoice Saved Successfully",
      backgroundColor: Colors.green,
  colorText: Colors.white,
  snackPosition: SnackPosition.BOTTOM,
    );
  } catch (e) {
    print(e);
    Get.snackbar(
      "Error",
      e.toString(),
      backgroundColor: Colors.red,
  colorText: Colors.white,
  snackPosition: SnackPosition.BOTTOM,
    );
    
  }
}
}