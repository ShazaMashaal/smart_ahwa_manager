

enum DrinkType { shai, turkishCoffee, hibiscusTea }

abstract class Drink {
  final DrinkType type;
  final String displayName;
  final double price;

  const Drink({required this.type, required this.displayName, required this.price});

  String description() => displayName;

  factory Drink.of(DrinkType type) {
    switch (type) {
      case DrinkType.shai:
        return const Shai();
      case DrinkType.turkishCoffee:
        return const TurkishCoffee();
      case DrinkType.hibiscusTea:
        return const HibiscusTea();
    }
  }
}

class Shai extends Drink {
  const Shai() : super(type: DrinkType.shai, displayName: 'Shai (Tea)', price: 10);
}

class TurkishCoffee extends Drink {
  const TurkishCoffee() : super(type: DrinkType.turkishCoffee, displayName: 'Turkish Coffee', price: 18);
}

class HibiscusTea extends Drink {
  const HibiscusTea() : super(type: DrinkType.hibiscusTea, displayName: 'Hibiscus Tea (Karkadeh)', price: 15);
}


