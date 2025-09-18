class Order{
  final String customerName;
  final String drink;
  final String specialInstructions;
  bool isCompleted = false;

  Order(this.customerName, this.drink, this.specialInstructions);
  Map<String, dynamic> toJson() => {
    'customer_name': customerName,
    'drink': drink,
    'special_instructions': specialInstructions,
  };

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    json['customer_name'],
    json['drink'],
    json['special_instructions'],
  );
}