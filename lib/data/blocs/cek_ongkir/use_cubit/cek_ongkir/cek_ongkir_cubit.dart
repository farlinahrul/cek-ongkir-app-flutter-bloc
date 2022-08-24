import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startercode_project/api/api_exceptions.dart';
import 'package:startercode_project/data/models/city.dart';
import 'package:startercode_project/data/models/ongkir.dart';
import 'package:startercode_project/data/repositories/cek_ongkir_repository.dart';
import 'package:startercode_project/data/repositories/city_repository.dart';

import 'cek_ongkir_state.dart';

class CekOngkirCubit extends Cubit<CekOngkirState> {
  CekOngkirCubit() : super(CekOngkirInitial());

  final List<String> listKotaKab = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5'
  ];

  final List<String> listCourier = [
    'JNE',
    'POS Indonesia',
    'TIKI',
  ];

  String selectedCourier = "JNE";

  final TextEditingController asalController = TextEditingController();

  final TextEditingController tujuanController = TextEditingController();

  final TextEditingController courierController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  final CityRepository _cityRepository = CityRepository();
  final CekOngkirRepository _cekOngkirRepository = CekOngkirRepository();

  Future<void> fetchCity() async {
    emit(CekOngkirFetchCityLoading());
    try {
      List<City> listData = await _cityRepository.fetchCity();
      emit(CekOngkirFetchCitySuccess(listCity: listData));
    } catch (e) {
      if (e is NetworkException) {
        emit(CekOngkirFetchCityFailure.network(e.toString()));
        return;
      }
      emit(CekOngkirFetchCityFailure.general(e.toString()));
    }
  }

  Future<void> cekOngkir({
    required int origin,
    required int destination,
  }) async {
    emit(CekOngkirPostOngkirLoading());
    try {
      Ongkir ongkir = await _cekOngkirRepository.cekOngkir(
        origin: origin,
        courier: selectedCourier.toLowerCase(),
        destination: destination,
        weight: int.parse(weightController.text),
      );
      emit(CekOngkirPostOngkirSuccess(ongkir: ongkir));
    } catch (e) {
      if (e is NetworkException) {
        emit(CekOngkirPostOngkirFailure.network(e.toString()));
        return;
      }
      emit(CekOngkirPostOngkirFailure.general(e.toString()));
    }
  }
}
