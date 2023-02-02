enum Vehicle {
  car,
  smallVan,
  mediumVan,
  lutonVan,
}

extension VehicleExtension on Vehicle {
  String get name {
    switch (this) {
      case Vehicle.car:
        return 'Car';
      case Vehicle.smallVan:
        return 'Small Van';
      case Vehicle.mediumVan:
        return 'Medium Van';
      case Vehicle.lutonVan:
        return 'Luton Van';
    }
  }

  int get value {
    switch (this) {
      case Vehicle.car:
        return 100;
      case Vehicle.smallVan:
        return 150;
      case Vehicle.mediumVan:
        return 180;
      case Vehicle.lutonVan:
        return 200;
    }
  }
}
