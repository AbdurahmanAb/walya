import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:waliya/provider/country_provider.dart';
import 'package:waliya/screen/confirm_screen.dart';
import 'package:waliya/widgets/fields.dart';

class pickupPage extends StatefulWidget {
  const pickupPage({super.key});

  @override
  State<pickupPage> createState() => _pickupPageState();
}

class _pickupPageState extends State<pickupPage> {
  bool _value2 = true;
  bool _value = true;

  void Submit() {
    if (_value) {
      //if
    }
  }

  @override
  Widget build(BuildContext context) {
    final pickupDropList = Provider.of<CountryProvder>(context);
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      top: 16, left: 10, right: 10, bottom: 10),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                      Text(
                        "PickUp/Drop",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.home,
                        size: 30,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  // height: 60,
                  // margin: EdgeInsets.only(top: 15, left: 17, right: 17),
                  // decoration:
                  //     BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 150,
                        child: CheckboxListTile(
                            title: const Text(
                              'PICKUP',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            autofocus: false,
                            activeColor: Colors.green,
                            checkColor: Colors.white,
                            selected: _value,
                            controlAffinity: ListTileControlAffinity.leading,
                            value: _value,
                            onChanged: (bool? value) {
                              pickupDropList.removeAll();
                              pickupDropList.removePCountry();
                              setState(() {
                                _value = bool.parse(value.toString());
                              });
                            }),
                      ),
                      SizedBox(
                        width: 150,
                        child: CheckboxListTile(
                            title: const Text(
                              'DROP',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            autofocus: false,
                            activeColor: Colors.green,
                            checkColor: Colors.white,
                            selected: _value2,
                            controlAffinity: ListTileControlAffinity.leading,
                            value: _value2,
                            onChanged: (bool? value) {
                              pickupDropList.removeDrop();
                              pickupDropList.removeDCountry();
                              setState(() {
                                _value2 = bool.parse(value.toString());
                              });
                            }),
                      ), //
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                AnimatedOpacity(
                    duration: const Duration(milliseconds: 1000),
                    opacity: _value ? 1.0 : 0.0,
                    child: Visibility(
                        visible: _value,
                        child: const Fields(
                          title: "Pickup",
                        ))),
                const SizedBox(
                  height: 25,
                ),
                AnimatedOpacity(
                    duration: const Duration(milliseconds: 1000),
                    opacity: _value2 ? 1.0 : 0.0,
                    child: Visibility(
                        visible: _value2,
                        child: const Fields(
                          title: "Drop",
                        ))),
              ],
            )),
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 7),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConfirmScreen(),
                  ));
            },
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                backgroundColor: Colors.green),
            child: const Text(
              "Next",
            ),
          ),
        ));
  }
}
