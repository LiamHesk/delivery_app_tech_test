import 'package:flutter/material.dart';
import 'package:delivery_app_tech_test/repository/data/vehicle_enum.dart';
import 'package:delivery_app_tech_test/utilities/order/list_of_vehicles.dart';
import 'package:delivery_app_tech_test/widgets/input/custom_textfield.dart';
import 'package:delivery_app_tech_test/widgets/layouts/page_title.dart';
import 'package:delivery_app_tech_test/widgets/layouts/footer.dart';
import 'package:delivery_app_tech_test/widgets/layouts/header.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Order extends StatefulWidget {
  const Order({
    Key? key,
  }) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  bool loading = false;
  final TextEditingController _pickup = TextEditingController();
  final TextEditingController _dropoff = TextEditingController();
  String currentCost = '';
  String currentCostNoVAT = '';
  late Vehicle selectedVehicle;

  @override
  void initState() {
    super.initState();

    selectedVehicle = Vehicle.car;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: Header(
        height: MediaQuery.of(context).size.height / 18,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const PageTitle(text: 'Order'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: CustomTextfield(
                      controller: _pickup,
                      label: 'Pickup postcode',
                      obscure: false,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    8.0,
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: CustomTextfield(
                      controller: _dropoff,
                      label: 'Drop-off postcode',
                      obscure: false,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(
                    8.0,
                  ),
                  child: Text('Vehicle type:'),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    height: MediaQuery.of(context).size.height / 19,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[900],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton<Vehicle>(
                          icon: const Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                          ),
                          isExpanded: true,
                          elevation: 8,
                          dropdownColor: Colors.blueGrey[900],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                          underline: Container(),
                          value: selectedVehicle,
                          items: listOfVehicles(),
                          onChanged: (Vehicle? value) {
                            setState(() {
                              selectedVehicle = value!;
                              currentCost = '';
                              currentCostNoVAT = '';
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 20,
                width: MediaQuery.of(context).size.width / 1.2,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueGrey[900]!),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: loading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          'Calculate cost',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                  onPressed: () async {
                    setState(() {
                      loading = true;
                    });

                    List<Location> pickupAddress =
                        await locationFromAddress(_pickup.text);
                    List<Location> dropoffAddress =
                        await locationFromAddress(_dropoff.text);

                    double distanceInMeters = Geolocator.distanceBetween(
                      pickupAddress[0].latitude,
                      pickupAddress[0].longitude,
                      dropoffAddress[0].latitude,
                      dropoffAddress[0].longitude,
                    );

                    double miles = distanceInMeters / 1609;
                    double cost = (miles * selectedVehicle.value) / 100;
                    double costNoVAT = cost / 1.2;

                    setState(() {
                      currentCost = '£${cost.toStringAsFixed(2)}';
                      currentCostNoVAT = '£${costNoVAT.toStringAsFixed(2)}';
                      loading = false;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                visible: currentCost != '',
                child: Text('Cost(GBP): $currentCost'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Visibility(
                visible: currentCostNoVAT != '',
                child: Text('Cost(GBP - Ex VAT): $currentCostNoVAT'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
