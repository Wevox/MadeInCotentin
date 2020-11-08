import 'package:cherboug/sales/Sale.dart';
import 'package:cherboug/shops/shopView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cherboug/config.dart' as configData;
import 'package:intl/intl.dart'; //for date format
import 'package:intl/date_symbol_data_local.dart';

class SaleTile extends StatefulWidget {
  bool tappable;
  Sale sale;

  SaleTile({this.sale, this.tappable = true});

  @override
  State<StatefulWidget> createState() {
    return SaleTileState();
  }
}

class SaleTileState extends State<SaleTile> {
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
                  this.widget.sale.name.toUpperCase(),
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.left,
                ),
                Text(
                  this.widget.sale.description,
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                  maxLines: 4,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Icon(Icons.watch_later_outlined),
                        Text("Jusqu'au " +
                            DateFormat("EEE dd MMM yyyy")
                                .format(this.widget.sale.endDateTime))
                      ],
                    ))
              ],
            )),
        ((this.widget.sale.photo != null && this.widget.sale.photo != "" )? CachedNetworkImage(
                width: 120,
                height: 150,
                fit: BoxFit.cover,
                imageUrl: configData.imgUrl + this.widget.sale.photo)
            :Image.asset("assets/no_photo_mc.png"))
          ],
        ),
      ),
      onTap: () {
        if(!this.widget.tappable){return;}
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
                      shop: configData.shops[this.widget.sale.idShop],
                    ),
                )));
      },
    );
  }
}
