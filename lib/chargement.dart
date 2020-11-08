import 'package:cherboug/menu/menu.dart';
import 'package:cherboug/sales/Sale.dart';
import 'package:cherboug/sales/SalesList.dart';
import 'package:cherboug/shops/shops.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cherboug/config.dart' as configData;
import 'dart:convert' as convert;

class Chargement extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChargementState();
  }
}

class ChargementState extends State<Chargement> {
  bool loadStarted = false;
  @override
  Widget build(BuildContext context) {
    loadData();

    return Padding(
        padding: EdgeInsets.all(30),
        child: Column(children: [
          Expanded(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Container(
                  padding: EdgeInsets.only(bottom: 15, right: 50, left: 50),
                  alignment: Alignment.center,
                  child: Image.asset("assets/madeincotentincarre_black.png"),
                ),
                LinearProgressIndicator(),
                Text("\nChargement en cours...")
              ]))
        ]));
  }

  Future<void> loadData() async {
    if (loadStarted) {
      return;
    }
    loadStarted = true;

    configData.shops = new Map();
    configData.sales = new Map();
    print(configData.apiURL + "?ac=shops");
    var response = await http.get(configData.apiURL + "?ac=shops");

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List;

      jsonResponse.forEach((element) {
        configData.shops[int.parse(element["id_shop"])] = Shop(
            idShop: int.parse(element["id_shop"]),
            nom: element["name"] ?? "",
            description: element["description"] ?? "",
            email: element["email"] ?? "",
            phone: element["phone"] ?? "",
            address: element["address"] ?? "",
            postcode: element["postcode"] ?? "",
            city: element["city"] ?? "",
            website: element["website"] ?? "",
            facebook: element["facebook"] ?? "",
            image_logo: element["image_logo"] ?? "",
            photo: element["photo"] ?? "",
            idCategory: int.parse(element["id_category"]),
            idSeller: int.parse(element["id_seller"]));
      });
    }
    var responsePromo = await http.get(configData.apiURL + "?ac=sales");
    print(configData.apiURL + "?ac=sales");

    if (responsePromo.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(responsePromo.body) as List;

      jsonResponse.forEach((element) {
        configData.sales[int.parse(element["id_sale"])] = Sale(
          idShop: int.parse(element["id_shop"]),
          idSale: int.parse(element["id_sale"]),
          description: element["description"] ?? "",
          name: element["name"] ?? "",
          photo: element['photo'],
          endDateTime: DateTime.parse(element["end_datetime"] + " 00:00:00"),
          startDateTime:
              DateTime.parse(element["start_datetime"] + " 23:59:59"),
        );

        configData.shops[int.parse(element["id_shop"])].sales
            .add(int.parse(element["id_sale"]));
      });
    }

    Navigator.pushReplacement(
        context,
        CupertinoPageRoute(
            builder: (BuildContext context) => Scaffold(
                appBar: AppBar(
                    backgroundColor: Color(0xff51c4c9),
                    // Here we take the value from the MyHomePage object that was created by
                    // the App.build method, and use it to set our appbar title.
                    title: Center(
                      child: Image.asset(
                        "assets/madeincotentin_blanc.png",
                        fit: BoxFit.contain,
                        height: 32,
                      ),
                    )),
                body: SalesList(),
              drawer: Menu(0),
				)));
  }
}
