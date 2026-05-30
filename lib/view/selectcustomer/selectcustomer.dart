import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiz/utils/appcolors.dart';
import 'package:mobiz/view/dashboad/widget/dashboard_card.dart';
import 'package:mobiz/view/productlist/product_list.dart';

class CustomerDetailsScreen extends StatelessWidget {
  final dynamic customer;

  const CustomerDetailsScreen({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F7),

      appBar: AppBar(
        backgroundColor: AppColors.blue,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Get.back();
          },

          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),

        title: const Text(
          "Customers",

          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              // Customer Name
              Text(
                customer["name"].toString(),

                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              // Top Details Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // Customer Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),

                    child:
                        customer["cust_image"] != null &&
                            customer["cust_image"].toString().isNotEmpty
                        ? Image.network(
                            customer["cust_image"].toString(),

                            height: 140,
                            width: 140,

                            fit: BoxFit.cover,

                            errorBuilder: (context, error, stackTrace) {
                              return imagePlaceholder();
                            },
                          )
                        : imagePlaceholder(),
                  ),

                  const SizedBox(width: 15),

                  // Customer Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        infoTile(
                          icon: Icons.location_on,
                          text:
                              customer["address"] != null &&
                                  customer["address"].toString().isNotEmpty
                              ? customer["address"].toString()
                              : "Not Provided",
                        ),

                        const SizedBox(height: 18),

                        infoTile(
                          icon: Icons.call,
                          text: customer["contact_number"].toString(),
                        ),

                        const SizedBox(height: 18),

                        infoTile(
                          icon: Icons.email,
                          text: customer["email"]?.toString() ?? "No Email",
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // Customer Type
              Text(
                "Customer Type: ${customer["payment_terms"]}",

                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              // White Container
              Container(
                width: double.infinity,
                height: 550,

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(10),
                ),

                child: Center(
                  child: dashboardCard(
                    icon: Icons.point_of_sale,

                    title: "Sale",

                    onTap: () {
                      Get.to(
                        ()=>ProductListScreen(customer: customer,),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Placeholder Widget
  Widget imagePlaceholder() {
    return Container(
      height: 140,
      width: 140,

      color: Colors.grey.shade300,

      child: Icon(
        Icons.camera_alt_outlined,
        size: 50,
        color: Colors.grey.shade500,
      ),
    );
  }

  // Info Tile Widget
  Widget infoTile({required IconData icon, required String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Icon(icon, color: Colors.grey, size: 30),

        const SizedBox(width: 10),

        Expanded(child: Text(text, style: const TextStyle(fontSize: 18))),
      ],
    );
  }
}
