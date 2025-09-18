import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_ahwa_manager/core/helpers/spacing.dart';
import 'package:smart_ahwa_manager/core/helpers/storage_helper.dart';
import 'package:smart_ahwa_manager/core/theming/text_styles.dart';
import 'package:smart_ahwa_manager/features/home/ui/summary_cards_row.dart';

import '../data/models/order.dart';
import 'add_order_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Order> orders=[];

  @override
  void initState() {
    super.initState();
    StorageHelper.loadOrders().then((loadedOrders) {
      setState(() {
        orders = loadedOrders;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 30.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Dashboard Cards Row
              SummaryCardsRow(orders:orders),
              VSpace(30),
              
              // Add Order Section
              Text("Add Order", style: TextStyles.font24BrownBold),
              VSpace(15),
              AddOrderForm(
                onAddOrder: (order) {
                  setState(() {
                    orders.add(order);
                  });
                  StorageHelper.saveOrders(orders);

                },

              )
            ],
          ),
        ),
      ),
    );
  }

}
