import 'package:startercode_project/api/api.dart';
import 'package:startercode_project/data/models/ongkir.dart';
import 'package:startercode_project/utils/constants.dart' as app_const;

class CekOngkirRepository {
  final ApiProvider _provider = ApiProvider();
  final String _adsKey = app_const.API_ADS_KEY;

  Future<Ongkir> cekOngkir({
    required int origin,
    required String courier,
    required int destination,
    required int weight,
  }) async {
    final response = await _provider.post('/cost', headers: {
      'key': _adsKey
    }, body: {
      'origin': origin.toString(),
      'courier': courier,
      'destination': destination.toString(),
      'weight': weight.toString(),
    });

    Ongkir data = Ongkir.fromJson(response["rajaongkir"]["results"][0]);

    return data;
  }
}
