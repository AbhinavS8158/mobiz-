import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiz/utils/appcolors.dart';
import 'package:mobiz/view/customerlist/customerlist.dart';
import 'package:mobiz/view/dashboad/widget/dashboard_card.dart';
import 'package:mobiz/view/invoice_list/invoice_list.dart';

class DashScreen extends StatelessWidget {
  const DashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F7),

      appBar: AppBar(
        backgroundColor: AppColors.blue,
        elevation: 0,
        leading: const Icon(Icons.menu, color: AppColors.white, size: 32),
        title: const Text(
          "Hello Sales",
          style: TextStyle(color: AppColors.white, fontSize: 20),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.notifications, color: AppColors.white, size: 30),
          ),
        ],
      ),

      body: Column(
        children: [
          const SizedBox(height: 35),

          const Center(
            child: Text(
              "Mobiz Demo",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.blue,
              ),
            ),
          ),

          const SizedBox(height: 140),

          Center(
            child: Column(
              children: [
                // Customer Card
                dashboardCard(
                  icon: Icons.groups,
                  title: "Customer",
                  onTap: () {
                    Get.to(() => const Customerlist());
                  },
                ),

                const SizedBox(height: 18),

                // Invoice Card
                dashboardCard(
                  icon: Icons.document_scanner,
                  title: "Invoices",
                  onTap: () {
                    Get.to(() =>  SalesInvoiceScreen());
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
