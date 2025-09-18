// enums.dart

enum DrinkType {
  shai,
  turkishCoffee,
  hibiscusTea,
}

extension DrinkTypeExtension on DrinkType {
  String get displayName {
    switch (this) {
      case DrinkType.shai:
        return "Shai";
      case DrinkType.turkishCoffee:
        return "Turkish Coffee";
      case DrinkType.hibiscusTea:
        return "Hibiscus Tea";
    }
  }
}
