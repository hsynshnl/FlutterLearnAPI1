import 'dart:convert';

import 'package:flutter/material.dart';

import 'model/araba_model.dart';

class LocalJson extends StatefulWidget {
  const LocalJson({Key? key}) : super(key: key);

  @override
  State<LocalJson> createState() => _LocalJsonState();
}

class _LocalJsonState extends State<LocalJson> {
  @override
  Widget build(BuildContext context) {
    arabalarJsonOku();
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Json Islemleri"),
      ),
      body: FutureBuilder<List<Araba>>(
          future: arabalarJsonOku(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Araba> arabaListesi = snapshot.data!;
              return ListView.builder(
                  itemCount: arabaListesi.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(arabaListesi[index].arabaAdi),
                      subtitle: Text(arabaListesi[index].ulke),
                      leading: CircleAvatar(
                          child: Text(arabaListesi[index]
                              .model[index]
                              .fiyat
                              .toString())),
                    );
                  });
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Future<List<Araba>> arabalarJsonOku() async {
    var okunanString = await DefaultAssetBundle.of(context)
        .loadString("assets/data/arabalar.json");
    var jsonObject = jsonDecode(okunanString);

    //   debugPrint(okunanString);
    //   debugPrint("***************************");
    //   List arabaListesi = jsonObject;
    //   debugPrint(arabaListesi[0]["araba_adi"].toString());
    List<Araba> tumArabalar =
        (jsonObject as List).map((e) => Araba.fromJson(e)).toList();
    return tumArabalar;
  }
}
