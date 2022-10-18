import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weathere/provider/provider.dart';
import 'package:weathere/view/firstScreen.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<weathere_Provider>(create: (context)=>weathere_Provider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>First_Screen(),
        },
      ),
    ),
  );
}