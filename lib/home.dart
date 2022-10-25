import 'dart:js_util/js_util_wasm.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class home extends StatefulWidget {
  final List currency;
  home(this.currency);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List? currency;
  final List<MaterialColor> colors=[Colors.blue,Colors.green,Colors.red];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: Text("Flutter Crypto App"),centerTitle: true),
      body: cryptowidget(),
    );
  }
  Widget cryptowidget(){
return Container(
  child: Column(
    children: [
      Flexible(
        child: ListView.builder(
          itemCount: widget.currency.length,
          itemBuilder: (BuildContext context,int index){
          final Map currname=widget.currency[index];
          final MaterialColor currcolor=colors[index];
          return getListUI(currname,currcolor);
          },
        )
      ),
    ],
  ),
);
  }
  Widget getListUI(Map currname,MaterialColor currcolor){
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: currcolor,
              child:Text(currency!['name'][0]) ,
            ),
      title: Text(currency!['name'].toString(),style: TextStyle(fontWeight: FontWeight.bold)),
       subtitle: getsubtitle(currency!['price_usd'].toString(),currency!['percentage_change_1h']),
            isThreeLine: true,
          );
  }
   Widget getsubtitle(String priceusd,String percentagechange){
    TextSpan pricetxtwidget=new TextSpan(
      text: "\$$priceusd\n",
      style: TextStyle(color: Colors.black),
    );
    String percentagechangetxt="1 hour:$percentagechange%";
    TextSpan percentagechangewidget;
    if(double.parse(percentagechange)>0){
     percentagechangewidget= TextSpan(text: percentagechangetxt,style: TextStyle(color: Colors.green));
    }
    else{
      percentagechangewidget=TextSpan(text: percentagechangetxt,style: TextStyle(color: Colors.red));
    }
    return RichText(
      text: TextSpan(
        children: [pricetxtwidget,percentagechangewidget],
      ),
    );
  }
}
