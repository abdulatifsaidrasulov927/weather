import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/modul/region_model.dart';
import '../../modul/universal_data_model.dart';

class RegionModelResource {
  static Future<UniversalData> regionApi() async {
    Uri uri = Uri.parse("https://islomapi.uz/api/present/day?region=Toshkent");

    try {
      print('try ga kirdi');

      http.Response response = await http.get(uri);
      print('responce oldi');
      print(response.statusCode);
      print('>>>>>>>>>>>>>>>${response.body}<<<<<<<<<');

      if (response.statusCode == 200) {
        print('>>>>>>>>>>>>>>>${response.body}');
        return UniversalData(
            data: RegionModel.fromJson(jsonDecode(response.body)));
      }
      return UniversalData(error: "Error!");
    } catch (err) {
      print('${err}');

      return UniversalData(error: err.toString());
    }
  }
}
