import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDialogController extends GetxController {
  final amountController =
      TextEditingController();

  final quantityController =
      TextEditingController();

  RxString selectedType =
      "Normal".obs;

  RxString selectedUnit = "".obs;

  void initialize(
    Map<String, dynamic> product,
  ) {
    amountController.text =
        product["price"].toString();

    quantityController.text = "1";

    if (product["units"] != null &&
        product["units"].isNotEmpty) {
      selectedUnit.value =
          product["units"][0]["name"]
              .toString();
    }
  }

  @override
  void onClose() {
    amountController.dispose();
    quantityController.dispose();
    super.onClose();
  }
}