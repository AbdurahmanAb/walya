import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waliya/pick_up.dart';
import 'package:waliya/provider/country_provider.dart';
import 'package:waliya/widgets/confirm_widget.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({super.key});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    final PickupDropList = Provider.of<CountryProvder>(context);
    void _showSuccessDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Icon(Icons.check_circle, color: Colors.green, size: 80),
            content: Text("PickUp/Drop Registration Completed!"),
            actions: [
              TextButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => pickupPage()));
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 16, left: 10, right: 10, bottom: 10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
                Text(
                  "Confirm",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.home,
                  size: 30,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(18),
            padding: EdgeInsets.all(28),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                ConfirmWidget(
                    initial: "PickUp Country", second: PickupDropList.pcountry),
                ConfirmWidget(
                    initial: "PickUp Location",
                    second: PickupDropList.items.isNotEmpty
                        ? PickupDropList.items[0].title
                        : ""),
                ConfirmWidget(
                    initial: "Zone",
                    second: PickupDropList.items.isNotEmpty
                        ? PickupDropList.items[0].zone
                        : ""),
                ConfirmWidget(
                    initial: "City",
                    second: PickupDropList.items.isNotEmpty
                        ? PickupDropList.items[0].city
                        : ""),
                Divider(
                  height: 25,
                ),
                SizedBox(
                  height: 25,
                ),
                ConfirmWidget(
                    initial: "Drop Country",
                    second: PickupDropList.dcountry.isNotEmpty
                        ? PickupDropList.dcountry
                        : ""),
                ConfirmWidget(
                    initial: "Drop Location",
                    second: PickupDropList.drop.isNotEmpty
                        ? PickupDropList.drop[0].title
                        : ""),
                ConfirmWidget(
                    initial: "Zone",
                    second: PickupDropList.drop.isNotEmpty
                        ? PickupDropList.drop[0].zone
                        : ""),
                ConfirmWidget(
                    initial: "City",
                    second: PickupDropList.drop.isNotEmpty
                        ? PickupDropList.drop[0].city
                        : ""),
                ElevatedButton(
                  onPressed: () {
                    _showSuccessDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 15, right: 15),
                      backgroundColor: Colors.green),
                  child: const Text(
                    "Confirm",
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
