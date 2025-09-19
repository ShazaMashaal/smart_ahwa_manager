import '../data/models/drink.dart';
import '../data/models/order.dart';
import '../data/repos/order_repo.dart';


class SalesReport {
  final int totalOrders;
  final Map<DrinkType, int> countsByDrink;

  const SalesReport({required this.totalOrders, required this.countsByDrink});

  List<MapEntry<DrinkType, int>> get topDrinksDesc {
    final entries = countsByDrink.entries.toList();
    entries.sort((a, b) => b.value.compareTo(a.value));
    return entries;
  }
}

class OrderService {
  final OrderRepository _repository;

  OrderService(this._repository);

  Future<Order> addOrder({
    required String customerName,
    required DrinkType drinkType,
    String specialInstructions = '',
  }) {
    return _repository.createOrder(
      customerName: customerName,
      drinkType: drinkType,
      specialInstructions: specialInstructions,
    );
  }

  Future<void> completeOrder(String orderId) => _repository.markCompleted(orderId);

  Stream<List<Order>> watchPendingOrders() => _repository.watchPending();
  Future<List<Order>> all() => _repository.all();

  Future<SalesReport> generateSalesReport() async {
    final allOrders = await _repository.all();
    final counts = <DrinkType, int>{
      for (final type in DrinkType.values) type: 0,
    };
    for (final o in allOrders) {
      counts[o.drink.type] = (counts[o.drink.type] ?? 0) + 1;
    }
    return SalesReport(totalOrders: allOrders.length, countsByDrink: counts);
  }
}


