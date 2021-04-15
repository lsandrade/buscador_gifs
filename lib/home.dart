import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const base_url = "https://api.giphy.com/v1/gifs";
const api_key = String.fromEnvironment('API_KEY', defaultValue: 'API_KEY');

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _search;
  int _offset = 0;

  Future<Map> _getGifs() async {
    String url = (_search == null)
        ? "$base_url/trending?api_key=$api_key&limit=20&rating=g"
        : "$base_url/search?api_key=$api_key&q=$_search&limit=20&offset=$_offset&rating=g&lang=en";

    http.Response response = await http.get(url);

    return json.decode(response.body);
  }

  @override
  void initState() {
    super.initState();

    _getGifs().then((map) {
      print(map);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}
