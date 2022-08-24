class Ongkir {
  Ongkir({
    this.code,
    this.name,
    this.costs,
  });

  String? code;
  String? name;
  List<OngkirCost>? costs;

  factory Ongkir.fromJson(Map<String, dynamic> json) => Ongkir(
        code: json["code"],
        name: json["name"],
        costs: json["costs"] == null
            ? null
            : List<OngkirCost>.from(
                json["costs"].map((x) => OngkirCost.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "costs": costs,
      };
}

class OngkirCost {
  OngkirCost({
    this.service,
    this.description,
    this.cost,
  });

  String? service;
  String? description;
  List<CostCost>? cost;

  factory OngkirCost.fromJson(Map<String, dynamic> json) => OngkirCost(
        service: json["service"],
        description: json["description"],
        cost: json["cost"] != null
            ? List<CostCost>.from(json["cost"].map((x) => CostCost.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "service": service,
        "description": description,
        "cost": cost,
      };
}

class CostCost {
  CostCost({
    this.value,
    this.etd,
    this.note,
  });

  int? value;
  String? etd;
  String? note;

  factory CostCost.fromJson(Map<String, dynamic> json) => CostCost(
        value: json["value"],
        etd: json["etd"],
        note: json["note"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "etd": etd,
        "note": note,
      };
}
