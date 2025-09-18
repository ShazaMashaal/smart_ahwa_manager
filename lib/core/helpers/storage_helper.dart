import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../features/home/data/models/order.dart';

class StorageHelper{
  static const _key = 'orders';
  //save an order
  static Future<void> saveOrders(List<Order> orders) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> ordersString =
    orders.map((order) => jsonEncode(order.toJson())).toList();
    await prefs.setStringList(_key, ordersString);
  }
  //get list of orders
  static Future<List<Order>> loadOrders() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? ordersString = prefs.getStringList(_key);
    if (ordersString == null) return [];
    return ordersString
        .map((orderStr) => Order.fromJson(jsonDecode(orderStr)))
        .toList();
  }
}