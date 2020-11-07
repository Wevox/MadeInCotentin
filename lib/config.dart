library config;

import 'package:cherboug/sales/Sale.dart';
import 'package:cherboug/shops/shops.dart';

bool prod = true;

String apiURL = prod? "https://cherbourg.wevox.net/index.php" : "http://192.168.1.8/cherbourg/index.php";

String imgUrl = "https://cherbourg.wevox.net/images/";

Map<int, Shop> shops;
Map<int, Sale> sales;