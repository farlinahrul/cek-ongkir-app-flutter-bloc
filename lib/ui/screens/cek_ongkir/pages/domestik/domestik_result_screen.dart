import 'package:flutter/material.dart';
import 'package:startercode_project/data/models/ongkir.dart';

class DomestikResultPage extends StatelessWidget {
  final Ongkir data;

  const DomestikResultPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hasil Cek Ongkir Domestik"),
      ),
      body: Column(children: [
        LabelWithValue(
          label: "Code",
          value: data.code ?? "",
        ),
        LabelWithValue(
          label: "Name",
          value: data.name ?? "",
        ),
        LabelWithValue(
          label: "Name",
          value: data.name ?? "",
        ),
        Expanded(
          child: ListView.builder(
            itemCount: data.costs?.length ?? 0,
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  LabelWithValue(
                    label: "Service",
                    value: data.costs?[index].service ?? "",
                  ),
                  LabelWithValue(
                    label: "Description",
                    value: data.costs?[index].description ?? "",
                  ),
                  LabelWithValue(
                    label: "Cost",
                    value: data.costs?[index].cost?[0].value.toString() ?? "",
                  ),
                  LabelWithValue(
                    label: "Estimasi",
                    value: data.costs?[index].cost?[0].etd.toString() ?? "",
                  ),
                ],
              );
            }),
          ),
        )
      ]),
    );
  }
}

class LabelWithValue extends StatelessWidget {
  const LabelWithValue({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label),
        Text(': '),
        Text(value),
      ],
    );
  }
}
