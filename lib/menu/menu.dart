import 'package:cherboug/sales/SalesList.dart';
import 'package:cherboug/shops/shopList.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget{
	int idMenu;
	Menu(this.idMenu);

  @override
  State<StatefulWidget> createState() {
    return MenuState();
  }

}

class MenuState extends State<Menu>{
  @override
  Widget build(BuildContext context) {
    return Drawer(child: ListView(
		padding: EdgeInsets.zero,
		children: [
			Padding(padding: EdgeInsets.all(20),child:Image.asset("assets/madeincotentincarre_black.png")),
			ListTile(
				tileColor: this.widget.idMenu == 0 ? Colors.teal : Colors.transparent,
				title: Text("Promotions en cours", style: TextStyle(color: this.widget.idMenu == 0 ? Colors.white : Colors.black,),),
				onTap: (){
					Navigator.pop(context);

					if(this.widget.idMenu != 0){
					Navigator.push(context, MaterialPageRoute(builder: (BuildContext) =>

						Scaffold(
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
						),
					)
					);}
				}
			),
			ListTile(
				tileColor: this.widget.idMenu == 1 ? Colors.teal : Colors.transparent,
				title: Text("Les commerces", style: TextStyle(color: this.widget.idMenu == 1 ? Colors.white : Colors.black,)),
				onTap: (){
					Navigator.pop(context);
					if(this.widget.idMenu != 1){
					Navigator.push(context, MaterialPageRoute(builder: (BuildContext) =>

						Scaffold(
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
							body: ShopList(),
							drawer: Menu(1),
							),
						)
					);}
				},
			),
	],),);
  }

}