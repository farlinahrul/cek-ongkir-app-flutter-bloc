import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:startercode_project/data/blocs/cek_ongkir/use_cubit/cek_ongkir/cek_ongkir_cubit.dart';
import 'package:startercode_project/data/blocs/cek_ongkir/use_cubit/cek_ongkir/cek_ongkir_state.dart';
import 'package:startercode_project/ui/screens/cek_ongkir/pages/domestik/domestik_result_screen.dart';
import 'package:startercode_project/ui/widgets/indicator_loader.dart';
import 'package:textfield_search/textfield_search.dart';
import 'package:startercode_project/utils/extensions.dart' as appExt;

class DomestikPage extends StatefulWidget {
  const DomestikPage({Key? key}) : super(key: key);

  @override
  State<DomestikPage> createState() => _DomestikPageState();
}

class _DomestikPageState extends State<DomestikPage> {
  final CekOngkirCubit _cekOngkirCubit = CekOngkirCubit()..fetchCity();

  @override
  void dispose() {
    _cekOngkirCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _cekOngkirCubit,
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener(
            bloc: _cekOngkirCubit,
            listener: (context, state) {
              if (state is CekOngkirFetchCitySuccess) {
                debugPrint("SUKSES FETCH City");
              }
              if (state is CekOngkirFetchCityFailure) {
                debugPrint("GAGAL FETCH City:" + state.message);
              }
              if (state is CekOngkirPostOngkirSuccess) {
                debugPrint("SUKSES Cek Ongkir");
                appExt
                    .pushScreen(context, DomestikResultPage(data: state.ongkir))
                    .then((value) => _cekOngkirCubit.fetchCity());
              }
              if (state is CekOngkirPostOngkirFailure) {
                debugPrint("GAGAL Cek Ongkir:" + state.message);
              }
            },
          ),
        ],
        child: Scaffold(
          body: BlocBuilder<CekOngkirCubit, CekOngkirState>(
            builder: (context, state) {
              List<String> listCityText = [];
              if (state is CekOngkirFetchCitySuccess) {
                listCityText =
                    state.listCity.map((e) => e.cityName ?? "").toList();
              }

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    FieldDropdownWithLabel(
                      text: "Asal",
                      dataList: listCityText,
                      label: "Pilih Kota/Kabupaten",
                      myController: _cekOngkirCubit.asalController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    FieldDropdownWithLabel(
                      text: "Tujuan",
                      dataList: listCityText,
                      label: "Pilih Kota/Kabupaten",
                      myController: _cekOngkirCubit.tujuanController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CourierFieldWithLabel(
                      listCourier: _cekOngkirCubit.listCourier,
                      onChange: (newValue) {
                        _cekOngkirCubit.selectedCourier = newValue ?? "JNE";
                      },
                    ),
                    WeightFieldWithLabel(
                      myController: _cekOngkirCubit.weightController,
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Center(
                      child: BlocBuilder<CekOngkirCubit, CekOngkirState>(
                        builder: (context, state) {
                          if (state is CekOngkirFetchCitySuccess) {
                            return ElevatedButton(
                              onPressed: () {
                                _cekOngkirCubit.cekOngkir(
                                  origin: int.parse(state.listCity
                                      .firstWhere((element) => _cekOngkirCubit
                                          .asalController.text
                                          .contains(element.cityName!))
                                      .id!),
                                  destination: int.parse(state.listCity
                                      .firstWhere((element) => _cekOngkirCubit
                                          .tujuanController.text
                                          .contains(element.cityName!))
                                      .id!),
                                );
                              },
                              child: const Text("CEK ONGKIR"),
                            );
                          }
                          return indicatorLoader();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class WeightFieldWithLabel extends StatelessWidget {
  const WeightFieldWithLabel({
    Key? key,
    required this.myController,
  }) : super(key: key);

  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Berat: "),
        const SizedBox(
          width: 12,
        ),
        Flexible(
          child: TextField(
            controller: myController,
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.deepPurple),
            onChanged: (String? newValue) {
              print(newValue);
            },
          ),
        ),
        const Text("gram"),
      ],
    );
  }
}

class CourierFieldWithLabel extends StatelessWidget {
  const CourierFieldWithLabel({
    Key? key,
    required this.listCourier,
    required this.onChange,
  }) : super(key: key);

  final List<String> listCourier;
  final Function(String?) onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text("Pilih Kurir: "),
        const SizedBox(
          width: 12,
        ),
        DropdownButton<String>(
          value: "JNE",
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            onChange(newValue);
          },
          items: listCourier.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class FieldDropdownWithLabel extends StatelessWidget {
  const FieldDropdownWithLabel({
    Key? key,
    required this.dataList,
    required this.label,
    required this.text,
    required this.myController,
  }) : super(key: key);

  final List<String> dataList;
  final String label, text;
  final TextEditingController myController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text),
        TextFieldSearch(
          initialList: dataList,
          label: label,
          controller: myController,
        ),
      ],
    );
  }
}
