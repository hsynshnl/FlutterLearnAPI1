// To parse this JSON data, do
//
//     final araba = arabaFromJson(jsonString);

import 'dart:convert';

List<Araba> arabaFromJson(String str) =>
    List<Araba>.from(json.decode(str).map((x) => Araba.fromJson(x)));

String arabaToJson(List<Araba> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Araba {
  Araba({
    required this.arabaAdi,
    required this.ulke,
    required this.kurulusYil,
    required this.model,
  });

  String arabaAdi;
  String ulke;
  int kurulusYil;
  List<Model> model;

  factory Araba.fromJson(Map<String, dynamic> json) => Araba(
        arabaAdi: json["araba_adi"],
        ulke: json["ulke"],
        kurulusYil: json["kurulus_yil"],
        model: List<Model>.from(json["model"].map((x) => Model.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "araba_adi": arabaAdi,
        "ulke": ulke,
        "kurulus_yil": kurulusYil,
        "model": List<dynamic>.from(model.map((x) => x.toJson())),
      };
}

class Model {
  Model({
    required this.modelAdi,
    required this.fiyat,
    required this.benzinli,
  });

  String modelAdi;
  int fiyat;
  bool benzinli;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        modelAdi: json["model_adi"],
        fiyat: json["fiyat"],
        benzinli: json["benzinli"],
      );

  Map<String, dynamic> toJson() => {
        "model_adi": modelAdi,
        "fiyat": fiyat,
        "benzinli": benzinli,
      };
}
