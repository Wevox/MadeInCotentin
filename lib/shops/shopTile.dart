import 'package:cached_network_image/cached_network_image.dart';
import 'package:cherboug/shops/shopView.dart';
import 'package:cherboug/shops/shops.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cherboug/config.dart' as configData;

class ShopTile extends StatefulWidget {
  Shop shop;
  ShopTile({this.shop});
  @override
  State<StatefulWidget> createState() {
    return ShopTileState();
  }
}

class ShopTileState extends State<ShopTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 5, color: Colors.blueGrey))),
        child: Row(
          children: [
            Flexible(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  this.widget.shop.nom.toUpperCase(),
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.left,
                ),
                Text(
                  this.widget.shop.description,
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                  maxLines: 4,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )),
            ((this.widget.shop.photo != null && this.widget.shop.photo != "")
                ? CachedNetworkImage(
                    width: 120,
                    height: 150,
                    fit: BoxFit.cover,
                    imageUrl: configData.imgUrl + this.widget.shop.photo,
                    errorWidget: (context, url, error) => Image.asset(
                        "assets/no_photo_mc.png",
                        height: 150,
                        width: 150,
                        fit: BoxFit.cover),
                  )
                : Image.asset(
                    "assets/no_photo_mc.png",
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ))
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
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
                      body: ShopView(
                        shop: configData.shops[this.widget.shop.idShop],
                      ),
                    )));
      },
    );
  }
}
