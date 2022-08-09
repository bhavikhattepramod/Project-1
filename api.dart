import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:project/model.dart';
import 'package:http/http.dart' as http;

class Api extends StatefulWidget {
  const Api({Key? key}) : super(key: key);

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  List products = [];
  var item;
  //Model model = Model();
  bool circular = true;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    Map<String, dynamic> data = {
      "currentpage": 1,
      "pagesize": 10,
      "sortorder": {"field": "menu_name", "direction": "desc"},
      "searchstring": "",
      "filter": {"Category": ""}
    };
    var uri = Uri.parse("http://fda.intertoons.com/api/V1/products");
    var res = await http.post(uri,
        headers: {
          "Content-type": "application/json",
          "Authorization": "Bearer akhil@intertoons.com"
        },
        body: json.encode(data));

    var r = jsonDecode(res.body);

    setState(() {
      circular = false;
      products = r["data"]["products"];
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: circular
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) =>
                      dataShow(products[index])),
        ),
      ),
    );
  }

  Widget dataShow(var obj) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Container(
        height: 300,
        child: Card(
          color: Colors.transparent,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Name: ${obj["name"]}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
                Text(obj["is_veg"]),
                Image.network(obj["image"]),
                SizedBox(
                  height: 300,
                ),
              ]),
        ),
      ),
    );
  }
}
