import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waliya/model/location_model.dart';

Future<List<Address>?> fetchLocation() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  try {
    // Check if the data is already cached
    final cachedData = prefs.getString('cached_data');
    if (cachedData != null) {
      final data = jsonDecode(cachedData);
      var addresses = LocationModel.fromJson(data);
      print("data cached already");
      return addresses.address;
    } else {
      final uri =
          Uri.parse("http://amircreations.com/walya/get_all_places.php");
      final res = await http.get(uri);

      final cachedList = res.body;
      // Cache the data
      await prefs.setString('cached_data', cachedList);
      final cachedData = prefs.getString('cached_data');
      final data = jsonDecode(cachedData!);
      var addresses = LocationModel.fromJson(data);
      print("data cached");
      return addresses.address;
    }
  } on Exception catch (e) {
    print("Exception Message " + e.toString());
  }
}
