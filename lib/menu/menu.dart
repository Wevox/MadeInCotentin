import 'package:cherboug/menu/mention.dart';
import 'package:cherboug/sales/SalesList.dart';
import 'package:cherboug/shops/shopList.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  int idMenu;
  Menu(this.idMenu);

  @override
  State<StatefulWidget> createState() {
    return MenuState();
  }
}

class MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Padding(
              padding:
                  EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
              child: Image.asset("assets/madeincotentincarre_black.png")),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                    tileColor: this.widget.idMenu == 0
                        ? Colors.teal
                        : Colors.transparent,
                    title: Text(
                      "Promotions en cours",
                      style: TextStyle(
                        color: this.widget.idMenu == 0
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);

                      if (this.widget.idMenu != 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext) => Scaffold(
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
                            ));
                      }
                    }),
                ListTile(
                  tileColor: this.widget.idMenu == 1
                      ? Colors.teal
                      : Colors.transparent,
                  title: Text("Les commerces",
                      style: TextStyle(
                        color: this.widget.idMenu == 1
                            ? Colors.white
                            : Colors.black,
                      )),
                  onTap: () {
                    Navigator.pop(context);
                    if (this.widget.idMenu != 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext) => Scaffold(
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
                          ));
                    }
                  },
                ),
              ],
            ),
          ),
          ListTile(
            title: Text("Mentions légales"),
            onTap: () {
              Navigator.pop(context);
              showBottomSheet(
                  context: context,
                  builder: (BuildContext context) => Container(
                      width: double.infinity,
                      child: ListView(
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            width: double.infinity,
                            color: Colors.grey,
                            child: Row(children: [ Expanded(child: Text(
                              "Mentions légales",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )),
							InkWell( child: Icon(Icons.expand_more, color: Colors.white,), onTap: (){Navigator.pop(context);},)]),
                          ),
							MentionLegales()
                        ],
                      )));
            },
          )
        ],
      ),
    );
  }
}
