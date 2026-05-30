import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiz/controller/get_product_controller.dart';
import 'package:mobiz/view/select_product/product_dialog.dart';

class ProductListScreen extends StatelessWidget {
  final dynamic customer;
 
  ProductListScreen({
    super.key,
    required this.customer,
  });
  final GetProductController controller = Get.put(GetProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F7),

      appBar: AppBar(
        backgroundColor: const Color(0xff4E4BB8),

        title: const Text(
          "Copy Products",
          style: TextStyle(color: Colors.white),
        ),

        leading: IconButton(
          onPressed: Get.back,
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),
        ],
      ),

      body: Obx(() {
        if (controller.isProductLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.productList.isEmpty) {
          return const Center(child: Text("No Products Found"));
        }

        return ListView.builder(
          itemCount: controller.productList.length,

          itemBuilder: (context, index) {
            final product = controller.productList[index];

            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => ProductDialogWidget(product: product,customer:customer),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),

                padding: const EdgeInsets.all(10),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.1),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),

                child: Row(
                  children: [
                    // Product Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),

                      child: Container(
                        height: 75,
                        width: 75,
                        color: Colors.grey.shade200,

                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 35,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),

                    const SizedBox(width: 15),

                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            product["id"]?.toString() ?? "No Name",

                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(width: 2),
                          Text(" | "),
                          SizedBox(width: 5),
                          Text(
                            product['name'].toString().toUpperCase(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            " ${product['units'][0]['stock']}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            " ${product['units'][0]['name']}",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
