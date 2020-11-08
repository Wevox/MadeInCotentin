import 'package:basic_utils/basic_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cherboug/sales/SaleTile.dart';
import 'package:cherboug/shops/shops.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cherboug/config.dart' as configData;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ShopView extends StatefulWidget {
  Shop shop;

  ShopView({this.shop});

  @override
  State<StatefulWidget> createState() {
    return ShopViewState();
  }
}

class ShopViewState extends State<ShopView> {
  Color color = Colors.teal;

  @override
  Widget build(BuildContext context) {
    List<Widget> salesListTiles = new List();

    if (this.widget.shop.sales.length > 0) {
      salesListTiles.add(Text(
        (this.widget.shop.sales.length.toString() +
                " promotion" +
                ((this.widget.shop.sales.length > 1) ? "s" : "") +
                " en cours\n")
            .toUpperCase(),
        style: TextStyle(
          fontSize: 20,
        ),
      ));
      this.widget.shop.sales.forEach((element) {
        salesListTiles.add(SaleTile(
          sale: configData.sales[element],
          tappable: false,
        ));
      });
    } else {
      salesListTiles.add(Text(
        "Ce commerçant n'a aucune promotion en cours",
        style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
      ));
    }
    return ListView(
      children: [
        Container(
          padding: EdgeInsets.only(top: 15),
          decoration: new BoxDecoration(
            color: Colors.white, //new Color.fromRGBO(255, 0, 0, 0.0),
            // borderRadius: new BorderRadius.only(topLeft: const Radius.circular(15.0), topRight: const Radius.circular(15.0)),
            image: DecorationImage(
                image: (this.widget.shop.photo == null ||
                        this.widget.shop.photo == ""
                    ? AssetImage("assets/no_photo_mc.png")
                    : CachedNetworkImageProvider(
                        configData.imgUrl + this.widget.shop.photo)),
                fit: (this.widget.shop.photo == null
                    ? BoxFit.contain
                    : BoxFit.cover)),
          ),
          height: MediaQuery.of(context).size.height * 0.25,
          width: double.infinity,
        ),
        // Padding(
        //   padding: EdgeInsets.only(top: 15, bottom: 20),
        //   child: Text(
        //     this.widget.shop.nom.toUpperCase(),
        //     textAlign: TextAlign.center,
        //     style: TextStyle(fontSize: 23),
        //   ),
        // ),
        // Padding(
        //   padding: EdgeInsets.only(bottom: 15, left: 20, right: 20),
        //   child: Text(
        //     this.widget.shop.description,
        //     style: TextStyle(fontSize: 18, color: color),
        //   ),
        // ),
        Padding(
            padding: EdgeInsets.only(top: 20, bottom: 15, left: 20, right: 20),
            child: ExpandablePanel(
                header: Text(
                  this.widget.shop.nom.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 23),
                ),
                collapsed: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    this.widget.shop.description,
                    style: TextStyle(fontSize: 18, color: color),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                expanded: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    this.widget.shop.description,
                    style: TextStyle(fontSize: 18, color: color),
                    softWrap: true,
                  ),
                ))),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 10),
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.phone,
                    size: 30,
                    color: color,
                  )),
              Text(
                StringUtils.addCharAtPosition(
                    this.widget.shop.phone.replaceAll(".", ""), " ", 2,
                    repeat: true),
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20,
            top: 10,
          ),
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.language,
                    size: 30,
                    color: color,
                  )),
              InkWell(
                child: Text(
                  this.widget.shop.website,
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () {
                  if (this.widget.shop.website != null &&
                      this.widget.shop.website != "") {
                    openLink(this.widget.shop.website);
                  }
                },
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 20,
            top: 10,
          ),
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: FaIcon(
                    FontAwesomeIcons.facebook,
                    size: 30,
                    color: color,
                  )),
              InkWell(
                child: Text(
                  this.widget.shop.facebook,
                  style: TextStyle(fontSize: 15),
                ),
                onTap: () {
                  if (this.widget.shop.facebook != null &&
                      this.widget.shop.facebook != "") {
                    openLink(this.widget.shop.facebook);
                  }
                },
              )
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.map_outlined,
                      size: 30,
                      color: color,
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(this.widget.shop.address,
                        style: TextStyle(fontSize: 15)),
                    Text(
                        this.widget.shop.postcode + " " + this.widget.shop.city,
                        style: TextStyle(fontSize: 15))
                  ],
                )
              ],
            )),
        Padding(
          padding: EdgeInsets.only(left: 20, top: 10),
          child: Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.drafts_outlined,
                    size: 30,
                    color: color,
                  )),
              Text(this.widget.shop.email, style: TextStyle(fontSize: 15))
            ],
          ),
        ),

        Container(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              children: salesListTiles,
            ))
      ],
    );
  }

  Future<void> openLink(url) async {
    print("ouverture de " + url);

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // throw 'Could not launch ' + urlAdmin;
    }
  }
}
