import 'package:cherboug/sales/SaleTile.dart';
import 'package:flutter/cupertino.dart';

import 'package:cherboug/config.dart' as configData;

class SalesList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SalesListState();
  }
}

class SalesListState extends State<SalesList> {
  @override
  Widget build(BuildContext context) {

    List<Widget> listSales = new List();
    configData.sales.forEach((key, value) {

        listSales.add(
          SaleTile(sale: value,)
        );
    });
    return ListView(
      children: listSales,
    );
  }
}
