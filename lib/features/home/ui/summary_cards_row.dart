import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_ahwa_manager/core/helpers/extensions.dart';
import 'package:smart_ahwa_manager/core/routing/routes.dart';
import 'package:smart_ahwa_manager/features/home/logic/order_service.dart';

import '../../../core/widgets/custom_drop_down.dart';
import '../data/models/order.dart';
import 'widgets/summary_card.dart';

class SummaryCardsRow extends StatelessWidget {
  final OrderService service;
  const SummaryCardsRow({super.key, required this.service});

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
        stream: service.watchPendingOrders(),
    builder: (context, snapshot) {
    final pending = snapshot.data ?? const <Order>[];
              return FutureBuilder<SalesReport>(
          future: service.generateSalesReport(),
          builder: (context, reportSnap) {
            final report = reportSnap.data;
            final total = report?.totalOrders ?? 0;
            final pendingCount = pending.length;
            final completedCount = (total - pendingCount).clamp(0, 1 << 31);
            String? topDrinkName;
            int topDrinkCount = 0;
            if (report != null && report.topDrinksDesc.isNotEmpty) {
              final top = report.topDrinksDesc.first;
              topDrinkCount = top.value;
              topDrinkName =  drinkLabel(top.key);
            }
            return IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: SummaryCard(
                      title: "Pending Orders",
                      value:pendingCount.toString(),
                      icon: Icons.access_time,
                      onTap:(){
                        context.pushNamed(Routes.pendingOrdersScreen,arguments: service);
                      },
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: SummaryCard(
                      title: "Completed Orders",
                      value: completedCount.toString(),
                      icon: Icons.check_circle,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: SummaryCard(
                      title: "Top Drink",
                      value: topDrinkCount > 0 ? '$topDrinkName ($topDrinkCount)' : '—',
                      icon: Icons.local_cafe,
                    ),
                  ),
                ],
              ),
            );
          }
        );
      }
    );
  }
}
