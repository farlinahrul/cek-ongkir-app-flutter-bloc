import 'package:flutter/cupertino.dart';
import 'package:startercode_project/api/api.dart';
import 'package:startercode_project/data/models/city.dart';
import 'package:startercode_project/utils/constants.dart' as app_const;

class CityRepository {
  final ApiProvider _provider = ApiProvider();
  final String _adsKey = app_const.API_ADS_KEY;

  Future<List<City>> fetchCity() async {
    final response = await _provider.get('/city', headers: {'key': _adsKey});

    List<City> data = List<City>.from(
        response["rajaongkir"]["results"].map((x) => City.fromJson(x)));

    return data;
  }
}
