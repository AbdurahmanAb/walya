import 'package:flutter/material.dart';
import 'package:waliya/provider/country_provider.dart';
import '../api/location_api.dart';
import 'package:provider/provider.dart';
import '../model/location_model.dart';

class MySearchDialog extends StatefulWidget {
  final String title;
  MySearchDialog({required this.title});

  @override
  _MySearchDialogState createState() => _MySearchDialogState();
}

class _MySearchDialogState extends State<MySearchDialog> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    var controller = widget.title.toLowerCase() == "pickUp".toLowerCase()
        ? "addLocation"
        : "dropLocation";
    final pickUpDropList = Provider.of<CountryProvder>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                decoration: const InputDecoration(
                    hintText: 'Search...',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search)),
                onChanged: (value) {
                  setState(() {
                    _query = value;
                    print(_query);
                  });
                },
              ),
              Expanded(
                child: FutureBuilder<List<Address>?>(
                  future: fetchLocation(),
                  builder: (context, snapshot) {
                    final locations = snapshot.data;

                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        if (snapshot.hasError) {
                          print(snapshot.error);
                          return const Center(child: Text("404  Error "));
                        } else {
                          return ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 10,
                                  ),
                              itemCount: locations!.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) => Column(
                                  children: _query != ''
                                      ? locations
                                          .where((e) => e.title!
                                              .toLowerCase()
                                              .contains(_query.toLowerCase()))
                                          .map((e) => ListTile(
                                                title: Text(e.title!),
                                                leading: const Icon(
                                                    Icons.location_on),
                                                subtitle: Text(e.zone!),
                                                onTap: () {
                                                  widget.title.toLowerCase() ==
                                                          "drop".toLowerCase()
                                                      ? pickUpDropList
                                                          .dropLocation(e)
                                                      : pickUpDropList
                                                          .addLocation(e);

                                                  Navigator.of(context).pop();
                                                },
                                              ))
                                          .toList()
                                      : [
                                          ListTile(
                                            title:
                                                Text(locations[index].title!),
                                            leading:
                                                const Icon(Icons.location_on),
                                            subtitle:
                                                Text(locations[index].zone!),
                                            onTap: () {
                                              widget.title.toLowerCase() ==
                                                      "drop".toLowerCase()
                                                  ? pickUpDropList.dropLocation(
                                                      locations[index])
                                                  : pickUpDropList.addLocation(
                                                      locations[index]);

                                              Navigator.of(context).pop();
                                            },
                                          )
                                        ]));
                        }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
