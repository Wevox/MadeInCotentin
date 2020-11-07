
import 'package:cherboug/chargement.dart';
import 'package:cherboug/shops/shopView.dart';
import 'package:cherboug/shops/shops.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {

	// This widget is the home page of your application. It is stateful, meaning
	// that it has a State object (defined below) that contains fields that affect
	// how it looks.

	// This class is the configuration for the state. It holds the values (in this
	// case the title) provided by the parent (in this case the App widget) and
	// used by the build method of the State. Fields in a Widget subclass are
	// always marked "final".

	@override
	_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

	@override
	Widget build(BuildContext context) {

		// This method is rerun every time setState is called, for instance as done
		// by the _incrementCounter method above.
		//
		// The Flutter framework has been optimized to make rerunning build methods
		// fast, so that you can just rebuild anything that needs updating rather
		// than having to individually change instances of widgets.
		return Scaffold(
			appBar: AppBar(backgroundColor: Color(0xff51c4c9),
				// Here we take the value from the MyHomePage object that was created by
				// the App.build method, and use it to set our appbar title.
				title: Center(child:  Image.asset("assets/madeincotentin_blanc.png", fit: BoxFit.contain, height: 32,),)
			),


			body: Chargement()

			// body: ShopView(
			// 	shop: Shop(
			// 		nom: "L'univers de mano",
			// 		description: "La coutellerie L'Univers de Mano est un magasin spécialisé dans la vente de couteaux où vous y trouverez de nombreuses marques : Victorinox, Opinel, Kai, Laguiole en Aubrac, Claude Dozorme, Déglon, Herbertz, Cudeman, Buck, Marttiini, CRKT, Old Bear, Salamandra ...",
			// 		email: "cherbourg@luniversdemano.com",
			// 		phone: "0233780207",
			// 		address: "18 Rue Au Fourdray",
			// 		postcode: "50100",
			// 		city: "Cherbourg-en-Cotentin",
			// 		website: "",
			// 		facebook: "",
			// 		idSeller: 1,
			// 		idCategory: 1,
			// 		idShop: 2,
			// 		image_logo: "logo_014.jpg",
			// 		photo: "img_014compressed.jpg"
			// 	),
			// ),




			// body: Center(				// Center is a layout widget. It takes a single child and positions it
			// 	// in the middle of the parent.
			// 	child: Padding(
			// 		padding: EdgeInsets.all(30),
			// 		child :  Image.asset("assets/madeincotentincarre_black.png", fit: BoxFit.contain, )),
			// ),
			// floatingActionButton: FloatingActionButton(
			// 	onPressed: (){},
			// 	tooltip: 'Increment',
			// 	child: Icon(Icons.add),
			// ), // This trailing comma makes auto-formatting nicer for build methods.
		);
	}
}
