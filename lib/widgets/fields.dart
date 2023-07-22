import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:waliya/provider/date_provider.dart';
import 'package:waliya/widgets/search_locations.dart';
import '../countries.dart';
import '../provider/country_provider.dart';

class Fields extends StatefulWidget {
  final String title;

  const Fields({super.key, required this.title});

  @override
  State<Fields> createState() => _FieldsState();
}

class _FieldsState extends State<Fields> {
  final dropDownController = TextEditingController();

  var _selectedCountry;

// Call _selectDate() method on button click or any other event

  @override
  Widget build(BuildContext context) {
    final pickUpDropList = Provider.of<CountryProvder>(context);
    final dateProvider = Provider.of<DateProvider>(context);
    final PickuptextController = TextEditingController(
      text: dropDownController.value.text == "Ethiopia    🇪🇹"
          ? pickUpDropList.items.isNotEmpty
              ? pickUpDropList.items[0].title.toString() +
                  " | " +
                  pickUpDropList.items[0].zone.toString()
              : "Location"
          : dropDownController.value.text,
    );
    final DroptextController = TextEditingController(
      text: dropDownController.value.text == "Ethiopia    🇪🇹"
          ? pickUpDropList.drop.isNotEmpty
              ? pickUpDropList.drop[0].title.toString() +
                  " | " +
                  pickUpDropList.drop[0].zone.toString()
              : "Location"
          : dropDownController.value.text,
    );

    var controller = widget.title.toLowerCase() == "pickUp".toLowerCase()
        ? PickuptextController
        : DroptextController;

    void handleOnTap() {
      if (widget.title.toLowerCase() == "pickUp".toLowerCase()) {
        if (pickUpDropList.items.isEmpty) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MySearchDialog(
                        title: widget.title,
                      ),
                  fullscreenDialog: true));
        } else {
          pickUpDropList.removeAll();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MySearchDialog(
                        title: widget.title,
                      ),
                  fullscreenDialog: true));
        }
      } else {
        if (pickUpDropList.drop.isEmpty) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MySearchDialog(
                        title: widget.title,
                      ),
                  fullscreenDialog: true));
        } else {
          pickUpDropList.removeDrop();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MySearchDialog(
                        title: widget.title,
                      ),
                  fullscreenDialog: true));
        }
      }
    }

    DateTime selectedDate = DateTime.now();
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate)
        widget.title.toLowerCase() == "pickUp".toLowerCase()
            ? dateProvider.addPDate(picked)
            : dateProvider.addDdate(picked);

      setState(() {
        selectedDate = picked!;
      });
    }

    return Container(
      child: Column(
        children: [
          Center(
              child: Text(
            "${widget.title} Information",
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          )),
          const Divider(
            height: 30,
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            margin: const EdgeInsets.all(6),
            child: Row(
              children: [
                Expanded(
                  child: CustomDropdown(
                    hintText: 'Select Country',
                    items: Countries.country,
                    controller: dropDownController,
                    onChanged: (p0) {
                      print("value is" + p0);
                      widget.title.toLowerCase() == "PickUp".toLowerCase()
                          ? pickUpDropList.addPCountry(p0)
                          : pickUpDropList.addDCountry(p0);
                      widget.title.toLowerCase() == "PickUp".toLowerCase()
                          ? pickUpDropList.removeAll()
                          : pickUpDropList.removeDrop();

                      setState(() {
                        _selectedCountry = dropDownController.value.text;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                            widget.title.toLowerCase() == "PickUp".toLowerCase()
                                ? dateProvider.pdate == null
                                    ? "Pick Date"
                                    : dateProvider.pdate!.day.toString() +
                                        "/" +
                                        dateProvider.pdate!.month.toString() +
                                        "/" +
                                        dateProvider.pdate!.year.toString()
                                : dateProvider.ddate == null
                                    ? "Drop Date"
                                    : dateProvider.ddate!.day.toString() +
                                        "/" +
                                        dateProvider.ddate!.month.toString() +
                                        "/" +
                                        dateProvider.ddate!.year.toString()),
                        const Icon(Icons.calendar_month)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 65,
            width: MediaQuery.of(context).size.width - 30,
            child: TextFormField(
              readOnly: true,
              onTap: () {
                handleOnTap();
              },
              controller: controller,
              enabled: _selectedCountry == "Ethiopia    🇪🇹" ? true : false,
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  hintText: "Location",
                  prefixIcon: Icon(Icons.location_on_outlined),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
          ),
        ],
      ),
    );
  }
}
