import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:provider/provider.dart';

import '../model/postmodel.dart';
import '../provider/provider.dart';

class First_Screen extends StatefulWidget {
  const First_Screen({Key? key}) : super(key: key);

  @override
  State<First_Screen> createState() => _First_ScreenState();
}
class _First_ScreenState extends State<First_Screen> {
  weathere_Provider? wproviderT;
  weathere_Provider? wproviderF;
  @override
  Widget build(BuildContext context) {
    wproviderT= Provider.of<weathere_Provider>(context,listen: true);
    wproviderF= Provider.of<weathere_Provider>(context,listen: false);
    return  Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              "assets/image/pexels-adam-kontor-325117.jpg",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              scale: 1,
            ),
            SafeArea(
              child: FutureBuilder<Postmodel>(
                  future: wproviderF!.Wfactory(),
                builder: (context,snapshot){
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  else if (snapshot.hasData)
                    {
                      Postmodel p1 = snapshot.data!;
                      return
                        SafeArea(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("${p1.name}  (${p1.sys!.country})",style: TextStyle(color: Colors.white,fontSize: 30),),
                                        SizedBox(width: 150,),
                                        Icon(Icons.location_on,color: Colors.green,size: 30,),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 60,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                        Text("☀️",style: TextStyle(fontSize: 60),),
                                        Column(
                                          children: [
                                            Text("18 oct",style: TextStyle(color: Colors.white,fontSize: 20),),
                                            Text("Monday",style: TextStyle(color: Colors.white,fontSize: 20),),
                                          ],
                                        )
                                    ],
                                  ),
                                  SizedBox(height: 10,),

                                  Row(
                                    children: [
                                    Text("${p1.main!.temp}°",style: TextStyle(fontSize:65,color: Colors.white),),
                                  ],),
                                  SizedBox(height: 5,),
                                   Text("Clouds",style: TextStyle(color: Colors.white,fontSize: 20),),
                                  SizedBox(height: 10,),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(horizontal: 5),
                                    child: GlassmorphicContainer(
                                        width: MediaQuery.of(context).size.width*0.85,
                                        height: 200,
                                        borderRadius: 20,
                                        blur: 20,
                                        alignment: Alignment.bottomCenter,
                                        border: 2,
                                        linearGradient: LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              Color(0xFFffffff).withOpacity(0.1),
                                              Color(0xFFFFFFFF).withOpacity(0.05),
                                            ],
                                            stops: [
                                              0.1,
                                              1,
                                            ]),
                                        borderGradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          colors: [
                                            Color(0xFFffffff).withOpacity(0.5),
                                            Color((0xFFFFFFFF)).withOpacity(0.5),
                                          ],
                                        ),
                                        child: Column(
                                         children: [
                                           Row(
                                             children: [
                                               Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Column(
                                                   children: [
                                                     Text("🌡  ${p1.main!.temp}",style: TextStyle(color: Colors.white,fontSize: 25),),
                                                     Text("Temperature",style: TextStyle(color: Colors.white),)
                                                   ],
                                                 ),
                                               ),
                                               SizedBox(width: 40,),
                                               Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Column(
                                                   children: [
                                                     Text("☁️${p1.clouds!.all}",style: TextStyle(color: Colors.white,fontSize: 25),),
                                                     Text("Colude",style: TextStyle(color: Colors.white),)
                                                   ],
                                                 ),
                                               ),
                                             ],
                                           ),
                                           SizedBox(height: 50,),
                                           Row(
                                             children: [
                                               Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Column(
                                                   children: [
                                                     Text("🌡  ${p1.main!.temp}",style: TextStyle(color: Colors.white,fontSize: 25),),
                                                     Text("Temperature",style: TextStyle(color: Colors.white),)
                                                   ],
                                                 ),
                                               ),
                                               SizedBox(width: 40,),
                                               Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Column(
                                                   children: [
                                                     Text("☁️${p1.clouds!.all}",style: TextStyle(color: Colors.white,fontSize: 25),),
                                                     Text("Colude",style: TextStyle(color: Colors.white),)
                                                   ],
                                                 ),
                                               ),
                                             ],
                                           ),

                                         ], 
                                        ),),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                    }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
