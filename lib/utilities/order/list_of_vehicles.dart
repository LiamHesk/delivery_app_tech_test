import 'package:delivery_app_tech_test/repository/data/vehicle_enum.dart';
import 'package:flutter/material.dart';

List<DropdownMenuItem<Vehicle>> listOfVehicles() {
  List<DropdownMenuItem<Vehicle>> items =
      List<DropdownMenuItem<Vehicle>>.empty(growable: true);

  items.add(
    DropdownMenuItem(
      value: Vehicle.car,
      child: Text(Vehicle.car.name),
    ),
  );
  items.add(
    DropdownMenuItem(
      value: Vehicle.smallVan,
      child: Text(Vehicle.smallVan.name),
    ),
  );
  items.add(
    DropdownMenuItem(
      value: Vehicle.mediumVan,
      child: Text(Vehicle.mediumVan.name),
    ),
  );
  items.add(
    DropdownMenuItem(
      value: Vehicle.lutonVan,
      child: Text(Vehicle.lutonVan.name),
    ),
  );

  return items;
}
