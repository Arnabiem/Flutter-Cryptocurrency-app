import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_crypto_app/home.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart'as http;
void main() async{
  List currency=await getCurrency();
  print(currency);
  runApp(cryptoapp(currency));
}
class cryptoapp extends StatefulWidget {
  final List _currency;
  cryptoapp(this._currency);

  @override
  State<cryptoapp> createState() => _cryptoappState();
}

class _cryptoappState extends State<cryptoapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(widget._currency),
    );
  }
}
Future<List> getCurrency() async {
  String cryptourl = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
  http.Response response = await http.get(Uri.parse(cryptourl));
  return jsonDecode(response.body);
}