import 'package:cherboug/sales/SaleTile.dart';
import 'package:cherboug/shops/shopTile.dart';
import 'package:flutter/cupertino.dart';

import 'package:cherboug/config.dart' as configData;

class ShopList extends StatefulWidget {
	@override
	State<StatefulWidget> createState() {
		return ShopListState();
	}
}

class ShopListState extends State<ShopList> {
	@override
	Widget build(BuildContext context) {

		List<Widget> listSales = new List();
		configData.shops.forEach((key, value) {

			listSales.add(
				ShopTile(shop:value)
			);
		});
		return ListView(
			children: listSales,
		);
	}
}
