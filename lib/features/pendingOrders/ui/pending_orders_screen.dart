import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_ahwa_manager/core/theming/colors.dart';
import 'package:smart_ahwa_manager/core/theming/text_styles.dart';
import 'package:smart_ahwa_manager/core/widgets/custom_text_button.dart';
import '../../home/data/models/order.dart';
import '../../home/logic/order_service.dart';

class PendingOrdersScreen extends StatelessWidget {
  final OrderService service;

  const PendingOrdersScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title:Text("Pending orders",style: TextStyles.font24BrownBold,),),
      body: SafeArea(
        child: StreamBuilder<List<Order>>(
          stream: service.watchPendingOrders(),
          builder: (context, snapshot) {
            final pending = snapshot.data ?? const <Order>[];
            if (pending.isEmpty) {
              return const Center(child: Text('No pending orders.'));
            }
            return ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              shrinkWrap: true, //
              itemCount: pending.length,
              separatorBuilder: (_, __) =>
                  Divider(height: 1.h, color: ColorsManager.lightGray),
              itemBuilder: (context, index) {
                final order = pending[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: ColorsManager.mainBrown.withAlpha(20),
                    child: Text((pending.indexOf(order) + 1).toString()),
                  ),
                  title: Text(
                    order.customerName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Drink: ${order.drink.displayName}"),
                      if (order.specialInstructions.isNotEmpty)
                        Text("Note: ${order.specialInstructions}"),
                    ],
                  ),
                  trailing: CustomTextButton(
                    text: "Complete",
                    width: 100.w,
                    fontSize: 14.sp,
                    onPressed: () async {
                      await service.completeOrder(order.id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Order completed')),
                      );
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
