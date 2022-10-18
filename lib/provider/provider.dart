import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/postmodel.dart';

class weathere_Provider extends ChangeNotifier{


  //String searchdata ="news";


  //
  // void changeData(String newdata)
  // {
  //   searchdata =newdata;
  //   notifyListeners();
  // }

  Future<Postmodel> Wfactory() async {
    String newslike = "https://api.openweathermap.org/data/2.5/weather?lat=21.1702&lon=72.8311&appid=9628b95a2235abb2f18055013ade5de8";
    var newsString = await http.get(Uri.parse(newslike));
    var newsjson = jsonDecode(newsString.body);
    return  Postmodel.fromJson(newsjson);
  }
}