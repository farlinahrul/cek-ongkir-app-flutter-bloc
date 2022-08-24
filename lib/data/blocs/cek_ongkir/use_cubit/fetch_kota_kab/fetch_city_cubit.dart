import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startercode_project/api/api_exceptions.dart';
import 'package:startercode_project/data/blocs/cek_ongkir/use_cubit/fetch_kota_kab/fetch_kota_kab_state.dart';
import 'package:startercode_project/data/models/city.dart';
import 'package:startercode_project/data/repositories/city_repository.dart';

class FetchCityCubit extends Cubit<FetchCityState> {
  FetchCityCubit() : super(FetchCityInitial());




}
