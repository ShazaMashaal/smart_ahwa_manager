import 'dart:async';
import '../models/drink.dart';
import '../models/order.dart';



/// Repository Interface (SOLID: DIP, ISP)
abstract class OrderRepository {
  Future<Order> createOrder({
    required String customerName,
    required DrinkType drinkType,
    String specialInstructions,
  });

  Future<void> markCompleted(String orderId);

  Stream<List<Order>> watchPending();

  Future<List<Order>> all();
}

/// implementation for (SOLID: LSP ).
class InMemoryOrderRepository implements OrderRepository {
  final Map<String, Order> _store = {};
  final StreamController<List<Order>> _pendingController = StreamController.broadcast();

  InMemoryOrderRepository() {
    _emitPending();
  }

  void _emitPending() {
    final pending = _store.values.where((o) => !o.isCompleted).toList()
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
    _pendingController.add(pending);
  }

  String _generateId() => DateTime.now().microsecondsSinceEpoch.toString();

  @override
  Future<Order> createOrder({
    required String customerName,
    required DrinkType drinkType,
    String specialInstructions = '',
  }) async {
    final order = Order(
      id: _generateId(),
      customerName: customerName,
      drink: Drink.of(drinkType),
      specialInstructions: specialInstructions,
    );
    _store[order.id] = order;
    _emitPending();
    return order;
  }

  @override
  Future<void> markCompleted(String orderId) async {
    final order = _store[orderId];
    if (order != null) {
      order.markCompleted();
      _emitPending();
    }
  }

  @override
  Stream<List<Order>> watchPending() async* {
    final pendingNow = _store.values.where((o) => !o.isCompleted).toList()
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
    yield pendingNow;
    yield* _pendingController.stream;
  }

  @override
  Future<List<Order>> all() async => _store.values.toList();
}


