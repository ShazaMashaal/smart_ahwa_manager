import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/models/order.dart';
import 'widgets/summary_card.dart';

class SummaryCardsRow extends StatelessWidget {
  final List<Order> orders;
  const SummaryCardsRow({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: SummaryCard(
              title: "Pending Orders",
              value:orders.where((order) => !order.isCompleted).length.toString(),
              icon: Icons.access_time,
            ),
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: SummaryCard(
              title: "Completed Orders",
              value: orders.where((order) => order.isCompleted).length.toString(),
              icon: Icons.check_circle,
            ),
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: SummaryCard(
              title: "Top Drink",
              value: "Shai",
              icon: Icons.local_cafe,
            ),
          ),
        ],
      ),
    );
  }
}
