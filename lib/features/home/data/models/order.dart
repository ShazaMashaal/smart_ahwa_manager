import 'drink.dart';

/// Order entity with encapsulated state and behavior.
class Order {
  final String id;
  final String customerName;
  final Drink drink;
  final String specialInstructions;
  bool _completed;
  final DateTime createdAt;

  Order({
    required this.id,
    required this.customerName,
    required this.drink,
    this.specialInstructions = '',
    bool completed = false,
    DateTime? createdAt,
  })  : _completed = completed,
        createdAt = createdAt ?? DateTime.now();

  bool get isCompleted => _completed;

  void markCompleted() {
    _completed = true;
  }
}


